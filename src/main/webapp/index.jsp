
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clinica Palmaeras</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <!-- Sección de Hero -->
        <section id="hero" class="hero section light-background">

            <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in">

            <div class="container position-relative">

                <div class="welcome position-relative" data-aos="fade-down" data-aos-delay="100">
                    <h2>Bienvenidos a la Clínica Palmeras</h2>
                    <p>Somos un equipo de profesionales dedicados al cuidado dental con las mejores herramientas tecnológicas.</p>
                </div><!-- Fin de Bienvenida -->

                <div class="content row gy-4">
                    <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="why-box" data-aos="zoom-out" data-aos-delay="200">
                            <h3>¿Por qué elegir Clínica Palmeras?</h3>
                            <p>
                                En la Clínica Palmeras, brindamos atención dental de calidad, con un equipo profesional comprometido en garantizar tu bienestar bucal. Nuestro objetivo es ofrecerte un servicio personalizado y eficiente en un ambiente cómodo y moderno.
                            </p>
                            <div class="text-center">
                                <a href="#about" class="more-btn"><span>Conoce más</span> <i class="bi bi-chevron-right"></i></a>
                            </div>
                        </div>
                    </div><!-- Fin de Caja de Elección -->

                    <div class="col-lg-8 d-flex align-items-stretch">
                        <div class="d-flex flex-column justify-content-center">
                            <div class="row gy-4">

                                <div class="col-xl-4 d-flex align-items-stretch">
                                    <div class="icon-box" data-aos="zoom-out" data-aos-delay="300">
                                        <i class="bi bi-clipboard-data"></i>
                                        <h4>Tratamientos Personalizados</h4>
                                        <p>Ofrecemos planes de tratamiento adaptados a tus necesidades específicas para garantizarte los mejores resultados.</p>
                                    </div>
                                </div><!-- Fin de Caja de Icono -->

                                <div class="col-xl-4 d-flex align-items-stretch">
                                    <div class="icon-box" data-aos="zoom-out" data-aos-delay="400">
                                        <i class="bi bi-gem"></i>
                                        <h4>Equipos de Alta Tecnología</h4>
                                        <p>Utilizamos las últimas tecnologías dentales para asegurar un diagnóstico preciso y un tratamiento eficaz.</p>
                                    </div>
                                </div><!-- Fin de Caja de Icono -->

                                <div class="col-xl-4 d-flex align-items-stretch">
                                    <div class="icon-box" data-aos="zoom-out" data-aos-delay="500">
                                        <i class="bi bi-inboxes"></i>
                                        <h4>Atención Integral</h4>
                                        <p>Ofrecemos una amplia gama de servicios desde limpiezas dentales hasta tratamientos especializados, todo en un solo lugar.</p>
                                    </div>
                                </div><!-- Fin de Caja de Icono -->

                            </div>
                        </div>
                    </div>
                </div><!-- Fin de Contenido -->

            </div>

        </section><!-- Fin de la Sección Hero -->
    </body>
    <%@include file="footer.jsp" %>
</html>
