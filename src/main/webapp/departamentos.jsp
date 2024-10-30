
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Departamentos</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <!-- Sección de Departamentos -->
        <section id="departments" class="departments section">

            <!-- Título de la Sección -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Servicios Dentales</h2>
                <p>Descubre nuestros servicios especializados para el cuidado de tu salud bucal.</p>
            </div><!-- Fin del Título de la Sección -->

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="row">
                    <div class="col-lg-3">
                        <ul class="nav nav-tabs flex-column">
                            <li class="nav-item">
                                <a class="nav-link active show" data-bs-toggle="tab" href="#departments-tab-1">Odontología General</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#departments-tab-2">Ortodoncia</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#departments-tab-3">Implantes Dentales</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#departments-tab-4">Endodoncia</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#departments-tab-5">Odontopediatría</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-9 mt-4 mt-lg-0">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="departments-tab-1">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>Odontología General</h3>
                                        <p class="fst-italic">Cuidamos de tu salud bucal con tratamientos preventivos y restaurativos para mantener una sonrisa saludable.</p>
                                        <p>Realizamos limpiezas dentales, empastes y diagnósticos completos para asegurarnos de que tus dientes y encías estén en perfecto estado.</p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img src="assets/img/departments-1.jpg" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="departments-tab-2">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>Ortodoncia</h3>
                                        <p class="fst-italic">Corregimos la posición de tus dientes para mejorar la función y la estética de tu sonrisa.</p>
                                        <p>Ofrecemos brackets y alineadores invisibles para todas las edades, garantizando comodidad y eficacia en el tratamiento.</p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img src="assets/img/departments-2.jpg" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="departments-tab-3">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>Implantes Dentales</h3>
                                        <p class="fst-italic">Recupera la funcionalidad y estética de tu boca con soluciones permanentes para reemplazar dientes perdidos.</p>
                                        <p>Colocamos implantes dentales seguros y duraderos, devolviendo la confianza en tu sonrisa.</p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img src="assets/img/departments-3.jpg" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="departments-tab-4">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>Endodoncia</h3>
                                        <p class="fst-italic">Salva tus dientes afectados por infecciones o daños en la pulpa dental con tratamientos de conducto.</p>
                                        <p>Nuestros especialistas en endodoncia se encargan de eliminar el dolor y preservar tus dientes naturales.</p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img src="assets/img/departments-4.jpg" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="departments-tab-5">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>Odontopediatría</h3>
                                        <p class="fst-italic">Cuidamos de la salud bucal de los más pequeños, fomentando buenos hábitos desde temprana edad.</p>
                                        <p>Ofrecemos un ambiente amigable y tratamientos preventivos para asegurar el bienestar dental de los niños.</p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img src="assets/img/departments-5.jpg" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section><!-- Fin Sección de Departamentos -->
        <!-- Sección de Galería -->
        <section id="gallery" class="gallery section">

            <!-- Título de la Sección -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Galería</h2>
                <p>Explora nuestras instalaciones y algunos de nuestros tratamientos realizados con los más altos estándares de calidad dental.</p>
            </div><!-- Fin del Título de la Sección -->

            <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

                <div class="row g-0">

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-1.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-1.jpg" alt="Imagen de la Clínica Dental" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-2.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-2.jpg" alt="Sala de espera de la Clínica" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-3.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-3.jpg" alt="Consultorio dental" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-4.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-4.jpg" alt="Equipo de odontólogos" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-5.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-5.jpg" alt="Sala de tratamientos" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-6.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-6.jpg" alt="Instrumentos de alta tecnología" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-7.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-7.jpg" alt="Paciente en tratamiento" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="assets/img/gallery/gallery-8.jpg" class="glightbox" data-gallery="images-gallery">
                                <img src="assets/img/gallery/gallery-8.jpg" alt="Clínica Dental Palmeras" class="img-fluid">
                            </a>
                        </div>
                    </div><!-- Fin del Ítem de la Galería -->

                </div>

            </div>

        </section><!-- Fin de la Sección de Galería -->
    </body>
    <%@include file="footer.jsp" %>
</html>
