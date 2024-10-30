
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>pie de pagina</title>
    </head>
    <body>
        <footer id="footer" class="footer light-background">
            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="admin-dashboard.html" class="logo d-flex align-items-center">
                            <span class="sitename">Admin - Palmeras</span>
                        </a>
                        <div class="footer-contact pt-3">
                            <p>Av. Las Palmeras 123, Lima, Perú</p>
                            <p class="mt-3"><strong>Teléfono:</strong> <span>+51 987 654 321</span></p>
                            <p><strong>Email:</strong> <span>admin@clinicapalmeras.com</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- FullCalendar Initialization -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    events: [
                        {
                            title: 'Cita con Juan Pérez - Implantes Dentales',
                            start: '2024-10-02T10:00:00',
                            end: '2024-10-02T11:00:00'
                        },
                        {
                            title: 'Cita con María Gómez - Ortodoncia',
                            start: '2024-10-05T09:00:00',
                            end: '2024-10-05T10:00:00'
                        },
                        {
                            title: 'Cita con Carlos Paredes - Limpieza Dental',
                            start: '2024-10-07T11:00:00',
                            end: '2024-10-07T12:00:00'
                        }
                    ]
                });
                calendar.render();
            });
        </script>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>



        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
