<div class="content py-5 mt-3">
    <div class="container">
        <h3><b>My Orders</b></h3>
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
                                <th class="text-center">Date Ordered</th>
                                <th class="text-center">Ref. Code</th>
                                <th class="text-center">Total Amount</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            $orders = $conn->query("SELECT * FROM `order_list` where client_id = '{$_settings->userdata('id')}' order by unix_timestamp(date_created) desc ");
                            while ($row = $orders->fetch_assoc()) :
                            ?>
                                <tr>
                                    <td class="text-center"><?= $i++ ?></td>
                                    <td><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
                                    <td><?= $row['ref_code'] ?></td>
                                    <td class="text-right"><?= number_format($row['total_amount'], 2) ?></td>
                                    <td class="text-center">
                                        <?php if ($row['status'] == 0) : ?>
                                            <span class="badge badge-secondary px-3 rounded-pill">Pending</span>
                                        <?php elseif ($row['status'] == 1) : ?>
                                            <span class="badge badge-primary px-3 rounded-pill">Ready for Pick Up</span>
                                        <?php elseif ($row['status'] == 5) : ?>
                                            <span class="badge badge-danger px-3 rounded-pill">Cancelled</span>
                                        <?php endif; ?>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-flat btn-sm btn-default border view_data" type="button" data-id="<?= $row['id'] ?>"><i class="fa fa-eye"></i> View</button>
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
<script>
    $(function() {
        $('.view_data').click(function() {
            uni_modal("Order Details", "view_order.php?id=" + $(this).attr('data-id'), "large")
        })

        $('.table th, .table td').addClass("align-middle px-2 py-1")
        $('.table').dataTable();
        $('.table').dataTable();
    })
</script>