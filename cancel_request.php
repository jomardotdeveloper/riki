<?php 
require_once('./config.php');
if(isset($_GET['id'])){
    $mechanic = $conn->query("SELECT * FROM mechanics_list where id in (SELECT mechanic_id FROM `service_requests` where id = '{$_GET['id']}')");
    $mechanic_arr = array_column($mechanic->fetch_all(MYSQLI_ASSOC),'name','id');
    $qry = $conn->query("SELECT * FROM `service_requests` where id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        foreach($qry->fetch_array() as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
        $meta = $conn->query("SELECT * FROM `request_meta` where request_id = '{$id}'");
        while($row = $meta->fetch_assoc()){
            ${$row['meta_field']} = $row['meta_value'];
        }
        $req_ser="";
        if(isset($service_id) && !empty($service_id)){
            $services = $conn->query("SELECT * FROM `service_list` where id in ({$service_id})");
            while($row = $services->fetch_assoc()){
                if(!empty($req_ser)) $req_ser .= ", ";
                $req_ser .= $row['service'];
            }
        }
        $req_ser = !empty($req_ser) ? $req_ser : "N/A";
    }
}
?>
<style>
    #uni_modal .modal-footer{
        display:none;
    }
    .prod-cart-img{
        width:7em;
        height:7em;
        object-fit:scale-down;
        object-position: center center;
    }
</style>
<div class="container-fluid">
  
    <div class="row">
        <div class="col-md-6">
            <label for="" class="text-muted">Service Type</label>
            <div class="ml-3"><b><?= isset($service_type) ? $service_type : "N/A" ?></b></div>
        </div>
        <?php 
            if(isset($service_type) && $service_type == 'Pick Up'):
        ?>
        <div class="col-md-6">
            <label for="" class="text-muted">Pick Up Address</label>
            <div class="ml-3"><b><?= isset($pickup_address) ? $pickup_address : "N/A" ?></b></div>
        </div>
        <?php endif; ?>
    </div>
    <div class="clear-fix my-2"></div>
    <div class="row">
        <div class="col-12 text-right">
      
            <button class="btn btn-danger btn-flat btn-sm" id="btn-cancel" type="button">Cancel Request</button>
           
            <button class="btn btn-dark btn-flat btn-sm" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
        </div>
    </div>
</div>
<script>
    $('#btn-cancel').click(function(){
        _conf("Are you sure to cancel this service request?","cancel_service",[])
    })
    function cancel_service(){
        start_loader();
        $.ajax({
            url:_base_url_+'classes/master.php?f=cancel_service',
            data:{id : "<?= isset($id) ? $id : '' ?>"},
            method:'POST',
            dataType:'json',
            error:err=>{
                console.error(err)
                alert_toast('An error occurred.','error')
                end_loader()
            },
            success:function(resp){
                if(resp.status == 'success'){
                    location.reload()
                }else if(!!resp.msg){
                    alert_toast(resp.msg,'error')
                }else{
                    alert_toast('An error occurred.','error')
                }
                end_loader();
            }
        })
    }
</script>