<h1 class="">Welcome to <?php echo $_settings->info('name') ?></h1>
<hr>
<?php
$months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
$ordersData = [];
$servicesData = [];

foreach ($months as $month) {
  $qr = "SELECT sum(total_amount) as total FROM `order_list` WHERE YEAR(date_created) = YEAR(CURDATE()) AND MONTH(date_created) = $month";
  $sum = $conn->query($qr)->fetch_assoc()['total'];

  if (!$sum) {
    array_push($ordersData, 0);
  } else {
    array_push($ordersData, $sum);
  }
}

foreach ($months as $month) {
  $qr = "SELECT sum(service_amount) as total FROM `service_requests` WHERE YEAR(date_created) = YEAR(CURDATE()) AND MONTH(date_created) = $month";
  $sum = $conn->query($qr)->fetch_assoc()['total'];

  if (!$sum) {
    array_push($servicesData, 0);
  } else {
    array_push($servicesData, $sum);
  }
}


?>
<div class="row">
  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-dark elevation-1"><i class="fas fa-copyright"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Total Brands</span>
        <span class="info-box-number">
          <?php
          $inv = $conn->query("SELECT count(id) as total FROM brand_list where delete_flag = 0 ")->fetch_assoc()['total'];
          echo number_format($inv);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-12 col-sm-6 col-md-3">
    <div class="info-box">
      <span class="info-box-icon bg-light elevation-1"><i class="fas fa-th-list"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Total Category</span>
        <span class="info-box-number">
          <?php
          $inv = $conn->query("SELECT count(id) as total FROM categories where delete_flag = 0 ")->fetch_assoc()['total'];
          echo number_format($inv);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-info elevation-1"><i class="fas fa-users-cog"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Mechanics</span>
        <span class="info-box-number">
          <?php
          $mechanics = $conn->query("SELECT sum(id) as total FROM `mechanics_list` where status = '1' ")->fetch_assoc()['total'];
          echo number_format($mechanics);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->

  <!-- fix for small devices only -->
  <div class="clearfix hidden-md-up"></div>

  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-success elevation-1"><i class="fas fa-th-list"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Services</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT sum(id) as total FROM `service_list` where status = 1 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-users"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Registered Clients</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT COUNT(*) as total FROM `client_list` where status = 1 and delete_flag = 0 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-gradient-secondary elevation-1"><i class="fas fa-tasks"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Pending Orders</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT COUNT(*) as total FROM `order_list` where status = 0 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-tasks"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Ready for Pick Up</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT COUNT(*) as total FROM `order_list` where status = 1 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-gradient-danger elevation-1"><i class="fas fa-tasks"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Cancelled Orders</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT sum(id) as total FROM `order_list` where status =5 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-6 col-md-3">
    <div class="shadow info-box mb-3">
      <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-file-invoice"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Finished Requests</span>
        <span class="info-box-number">
          <?php
          $services = $conn->query("SELECT sum(id) as total FROM `service_requests` where status = 3 ")->fetch_assoc()['total'];
          echo number_format($services);
          ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div class="row">
  <div class="col-12 col-sm-6 col-md-6">
    <div class="shadow info-box mb-3">
      <canvas id="myChart"></canvas>
    </div>
  </div>
  <div class="col-12 col-sm-6 col-md-6">
    <div class="shadow info-box mb-3">
      <canvas id="myChartService"></canvas>
    </div>
  </div>
</div>


<script>
  function php(value) {

  }
  const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'November',
    'December'
  ];

  var ordersData = []

  <?php foreach ($ordersData as $o_data) : ?>
    ordersData.push(<?= $o_data ?>);
  <?php endforeach; ?>
  // alert(ordersData);
  const data = {
    labels: labels,
    datasets: [{
      label: 'Orders',
      backgroundColor: 'rgb(40, 167, 69)',
      borderColor: 'rgb(40, 167, 69)',
      data: ordersData,
    }]
  };

  const config = {
    type: 'line',
    data: data,
  };
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>
<script>
  var serviceData = [];

  <?php foreach ($servicesData as $o_data) : ?>
    serviceData.push(<?= $o_data ?>);
  <?php endforeach; ?>

  const dataService = {
    labels: labels,
    datasets: [{
      label: 'Services',
      backgroundColor: 'rgb(255, 193, 7)',
      borderColor: 'rgb(255, 193, 7)',
      data: serviceData,
    }]
  };

  const configService = {
    type: 'line',
    data: dataService,
    options: {}
  };
  const myChartService = new Chart(
    document.getElementById('myChartService'),
    configService
  );
</script>