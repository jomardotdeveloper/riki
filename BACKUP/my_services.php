<div class="content py-5 mt-3">
    <div class="container">
        <h3><b>My Service Requests</b></h3>
        <hr>
        <div class="card card-outline card-dark shadow rounded-0">
            <div class="card-body">
                <div class="container-fluid">
                    <table class="table table-stripped table-bordered">
                        <colgroup>
                            <col width="5%">
                            <col width="20%">
                            <col width="25%">
                            <col width="20%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr class="bg-gradient-dark text-light">
                                <th class="text-center">#</th>
                                <th class="text-center">Date Requested</th>
                                <th class="text-center">Mechanic</th>
                                <th class="text-center">Service Type</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            $mechanic = $conn->query("SELECT * FROM mechanics_list where id in (SELECT mechanic_id FROM `service_requests` where client_id = '{$_settings->userdata('id')}')");
                            $mechanic_arr = array_column($mechanic->fetch_all(MYSQLI_ASSOC), 'name', 'id');
                            $orders = $conn->query("SELECT * FROM `service_requests` where client_id = '{$_settings->userdata('id')}' order by unix_timestamp(date_created) desc ");
                            while ($row = $orders->fetch_assoc()) :
                            ?>
                                <tr>
                                    <td class="text-center"><?= $i++ ?></td>
                                    <td><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
                                    <td>
                                        <p class="truncate-1 m-0"><?= isset($mechanic_arr[$row['mechanic_id']]) ? $mechanic_arr[$row['mechanic_id']] : "N/A" ?></p>
                                    </td>
                                    <td class=""><?= $row['service_type'] ?></td>
                                    <td class="text-center">
                                        <?php if ($row['status'] == 1) : ?>
                                            <span class="badge badge-primary rounded-pill px-3">Confirmed</span>
                                        <?php elseif ($row['status'] == 2) : ?>
                                            <span class="badge badge-warning rounded-pill px-3">On-progress</span>
                                        <?php elseif ($row['status'] == 3) : ?>
                                            <span class="badge badge-success rounded-pill px-3">Done</span>
                                        <?php elseif ($row['status'] == 4) : ?>
                                            <span class="badge badge-danger rounded-pill px-3">Cancelled</span>
                                        <?php else : ?>
                                            <span class="badge badge-secondary rounded-pill px-3">Pending</span>
                                        <?php endif; ?>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-flat btn-sm btn-default border view_data" type="button" data-id="<?= $row['id'] ?>"><i class="fa fa-eye"></i> View</button>
                                        <button class="btn btn-flat btn-sm btn-default border delete_data" type="button" data-id="<?= $row['id'] ?>"><i class="fa fa-trash"></i> Cancel</button>
                                        <!--<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>-->
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if (isset($_GET["has_error"])) : ?>
    <script>
        alert_toast('An error occurred.', 'error');
    </script>
<?php endif; ?>
<script>
    $(function() {
        $('.view_data').click(function() {
            // console.log($(this).attr('data-id'));
            uni_modal("Service Request Details", "view_request.php?id=" + $(this).attr('data-id'), "mid-large")
        })

        $('.cancel_data').click(function() {
            uni_modal("Service Request Details", "cancel_request.php?id=" + $(this).attr('data-id'), "mid-large")
        })

        $('.table th, .table td').addClass("align-middle px-2 py-1")
        $('.table').dataTable();
        $('.table').dataTable();
    })

    $('.delete_data').click(function() {
        _conf("Are you sure to cancel this service request?", "cancel_service", [$(this).attr('data-id')])
    })

    function cancel_service($id) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=cancel_service',
            data: {
                id: $id
            },
            method: 'POST',
            dataType: 'json',
            error: err => {
                console.error(err)
                alert_toast('An error occurred.', 'error')
                end_loader()
            },
            success: function(resp) {
                if (resp.status == 'success') {
                    location.reload()
                } else if (!!resp.msg) {
                    alert_toast(resp.msg, 'error')
                } else {
                    alert_toast('An error occurred.', 'error')
                }
                end_loader();
            }
        })
    }
</script>