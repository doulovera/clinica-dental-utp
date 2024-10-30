¿
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nosotros</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <!-- Sección Sobre Nosotros -->
        <section id="about" class="about section">

            <div class="container">

                <div class="row gy-4 gx-5">

                    <div class="col-lg-6 position-relative align-self-start" data-aos="fade-up" data-aos-delay="200">
                        <img src="assets/img/about.jpg" class="img-fluid" alt="Sobre Nosotros">
                        <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox pulsating-play-btn"></a>
                    </div>

                    <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
                        <h3>Sobre Nosotros</h3>
                        <p>
                            En la Clínica Dental Palmeras, nos dedicamos a proporcionar la mejor atención dental para nuestros pacientes. Con un equipo de especialistas altamente capacitados y tecnología de punta, nos enfocamos en brindarte una experiencia dental segura, cómoda y personalizada.
                        </p>
                        <ul>
                            <li>
                                <i class="fa-solid fa-vial-circle-check"></i>
                                <div>
                                    <h5>Tratamientos de alta calidad</h5>
                                    <p>Ofrecemos procedimientos dentales con los más altos estándares, asegurando resultados duraderos y efectivos.</p>
                                </div>
                            </li>
                            <li>
                                <i class="fa-solid fa-pump-medical"></i>
                                <div>
                                    <h5>Tecnología de vanguardia</h5>
                                    <p>Utilizamos equipos modernos para garantizar diagnósticos precisos y tratamientos avanzados.</p>
                                </div>
                            </li>
                            <li>
                                <i class="fa-solid fa-heart-circle-xmark"></i>
                                <div>
                                    <h5>Atención personalizada</h5>
                                    <p>Cada paciente recibe una atención única y adaptada a sus necesidades, buscando siempre su bienestar.</p>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>

            </div>

        </section><!-- Fin Sección Sobre Nosotros -->
        <!-- Sección de Estadísticas -->
        <section id="stats" class="stats section light-background">

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="row gy-4">

                    <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
                        <i class="fa-solid fa-user-doctor"></i>
                        <div class="stats-item">
                            <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Doctores</p>
                        </div>
                    </div><!-- Fin del Ítem de Estadística -->

                    <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
                        <i class="fa-regular fa-hospital"></i>
                        <div class="stats-item">
                            <span data-purecounter-start="0" data-purecounter-end="18" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Consultorios</p>
                        </div>
                    </div><!-- Fin del Ítem de Estadística -->

                    <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
                        <i class="fas fa-flask"></i>
                        <div class="stats-item">
                            <span data-purecounter-start="0" data-purecounter-end="12" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Laboratorios de Investigación</p>
                        </div>
                    </div><!-- Fin del Ítem de Estadística -->

                    <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
                        <i class="fas fa-award"></i>
                        <div class="stats-item">
                            <span data-purecounter-start="0" data-purecounter-end="150" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Premios</p>
                        </div>
                    </div><!-- Fin del Ítem de Estadística -->

                </div>

            </div>

        </section><!-- /Sección de Estadísticas -->
    </body>
    <%@include file="footer.jsp" %>
</html>
