<style>
    .fc-time {
        display: none;
    }
</style>
<!DOCTYPE html>
<html>

<head>
    <title>Service Requests</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
    <script>
        $(document).ready(function() {
            var calendar = $('#calendar').fullCalendar({
                editable: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                events: <?php
                        $dbname = "rikimotor";
                        $username = "root";
                        $password = "";
                        //load.php
                        $connect = new PDO('mysql:host=localhost;dbname=' . $dbname, $username, $password);

                        $data = array();

                        $query = "SELECT * FROM service_requests INNER JOIN client_list ON service_requests.client_id=client_list.id WHERE service_requests.status = 1";

                        $statement = $connect->prepare($query);

                        $statement->execute();

                        $result = $statement->fetchAll();

                        foreach ($result as $row) {
                            $data[] = array(
                                'id'   => $row["id"],
                                'title'   => $row["lastname"] . " " . $row["firstname"],
                                'start'   => $row["date_created"],
                            );
                        }

                        echo json_encode($data);

                        ?>,
                selectable: true,
                selectHelper: true,

                editable: true,




            });
        });
    </script>
</head>

<body>
    <br />
    <h2 align="center"><a href="#">Service Requests</a></h2>
    <br />
    <div class="container">
        <div id="calendar"></div>
    </div>


</body>

</html>