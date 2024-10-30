<%-- 
    Document   : contactanos
    Created on : 23 oct 2024, 7:39:00 p.m.
    Author     : FRANKLIN LOPEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactanos</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <!-- Sección de Contacto -->
        <section id="contact" class="contact section">

            <!-- Título de la Sección -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Contacto</h2>
                <p>Ponte en contacto con nosotros para cualquier consulta o para programar tu próxima cita dental.</p>
            </div><!-- Fin del Título de la Sección -->

            <!-- Google Maps -->
            <div class="mb-5" data-aos="fade-up" data-aos-delay="200">
                <iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d2007842.6610933123!2d-79.06140855003282!3d-10.61293304984364!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d-9.1193344!2d-78.5350656!4m5!1s0x9105c85a657a0e17%3A0x4e39ace5561c33a3!2sCentro%20M%C3%A9dico%20Cl%C3%ADnica%20las%20Palmeras%2C%20Av%20Javier%20Prado%20Oeste%201465%2C%20San%20Isidro%2015073!3m2!1d-12.0943135!2d-77.0456109!5e0!3m2!1ses!2spe!4v1727760438770!5m2!1ses!2spe" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div><!-- Fin Google Maps -->

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="row gy-4">

                    <div class="col-lg-4">
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                            <i class="bi bi-geo-alt flex-shrink-0"></i>
                            <div>
                                <h3>Ubicación</h3>
                                <p>Av. Las Palmeras 123, Lima, Perú</p>
                            </div>
                        </div><!-- Fin Info Item -->

                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                            <i class="bi bi-telephone flex-shrink-0"></i>
                            <div>
                                <h3>Llámanos</h3>
                                <p>+51 987 654 321</p>
                            </div>
                        </div><!-- Fin Info Item -->

                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
                            <i class="bi bi-envelope flex-shrink-0"></i>
                            <div>
                                <h3>Escríbenos</h3>
                                <p>contacto@clinicapalmeras.com</p>
                            </div>
                        </div><!-- Fin Info Item -->

                    </div>

                    <div class="col-lg-8">
                        <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
                            <div class="row gy-4">

                                <div class="col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Tu Nombre" required="">
                                </div>

                                <div class="col-md-6 ">
                                    <input type="email" class="form-control" name="email" placeholder="Tu Correo Electrónico" required="">
                                </div>

                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="subject" placeholder="Asunto" required="">
                                </div>

                                <div class="col-md-12">
                                    <textarea class="form-control" name="message" rows="6" placeholder="Mensaje" required=""></textarea>
                                </div>

                                <div class="col-md-12 text-center">
                                    <div class="loading">Cargando</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Tu mensaje ha sido enviado. ¡Gracias!</div>

                                    <button type="submit">Enviar Mensaje</button>
                                </div>

                            </div>
                        </form>
                    </div><!-- Fin del Formulario de Contacto -->

                </div>

            </div>

        </section><!-- Fin de la Sección de Contacto -->
        <!-- Sección de Preguntas Frecuentes -->
        <section id="faq" class="faq section light-background">

            <!-- Título de la Sección -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Preguntas Frecuentes</h2>
                <p>Resuelve tus dudas más comunes sobre nuestros servicios dentales</p>
            </div><!-- Fin del Título de la Sección -->

            <div class="container">

                <div class="row justify-content-center">

                    <div class="col-lg-10" data-aos="fade-up" data-aos-delay="100">

                        <div class="faq-container">

                            <div class="faq-item faq-active">
                                <h3>¿Cada cuánto debo acudir a una consulta dental?</h3>
                                <div class="faq-content">
                                    <p>Es recomendable visitar al dentista cada 6 meses para realizar limpiezas dentales y chequeos preventivos que ayuden a mantener una buena salud bucal.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                            <div class="faq-item">
                                <h3>¿Los tratamientos de ortodoncia son dolorosos?</h3>
                                <div class="faq-content">
                                    <p>Al principio, puede haber algo de incomodidad mientras los dientes comienzan a moverse, pero generalmente el dolor es leve y manejable con analgésicos. La incomodidad desaparece después de unos días.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                            <div class="faq-item">
                                <h3>¿Qué incluye un tratamiento de implantes dentales?</h3>
                                <div class="faq-content">
                                    <p>Un tratamiento de implantes dentales incluye la colocación del implante, la corona y el seguimiento para asegurar que el implante se integre correctamente con el hueso.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                            <div class="faq-item">
                                <h3>¿Cuándo es necesario un tratamiento de conducto?</h3>
                                <div class="faq-content">
                                    <p>Un tratamiento de conducto es necesario cuando la pulpa del diente se ha infectado debido a una caries profunda o un trauma. El tratamiento salva el diente eliminando la infección.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                            <div class="faq-item">
                                <h3>¿Qué cuidados debo tener después de un blanqueamiento dental?</h3>
                                <div class="faq-content">
                                    <p>Después de un blanqueamiento dental, se recomienda evitar alimentos y bebidas que puedan manchar los dientes, como el café, el vino tinto y alimentos con colorantes. También es importante mantener una buena higiene dental.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                            <div class="faq-item">
                                <h3>¿Cómo puedo ayudar a mis hijos a cuidar sus dientes?</h3>
                                <div class="faq-content">
                                    <p>Es fundamental enseñarles buenos hábitos de cepillado desde pequeños, llevarlos a chequeos regulares y limitar el consumo de azúcares para evitar la aparición de caries.</p>
                                </div>
                                <i class="faq-toggle bi bi-chevron-right"></i>
                            </div><!-- Fin del ítem de Pregunta Frecuente -->

                        </div>

                    </div><!-- Fin de la Columna de Preguntas Frecuentes -->

                </div>

            </div>

        </section><!-- Fin de la Sección de Preguntas Frecuentes -->


        <!-- Sección de Testimonios -->
        <section id="testimonials" class="testimonials section">

            <div class="container">

                <div class="row align-items-center">

                    <div class="col-lg-5 info" data-aos="fade-up" data-aos-delay="100">
                        <h3>Testimonios</h3>
                        <p>
                            Escucha lo que nuestros pacientes tienen que decir sobre su experiencia en nuestra clínica dental.
                        </p>
                    </div>

                    <div class="col-lg-7" data-aos="fade-up" data-aos-delay="200">

                        <div class="swiper init-swiper">
                            <script type="application/json" class="swiper-config">
                                {
                                "loop": true,
                                "speed": 600,
                                "autoplay": {
                                "delay": 5000
                                },
                                "slidesPerView": "auto",
                                "pagination": {
                                "el": ".swiper-pagination",
                                "type": "bullets",
                                "clickable": true
                                }
                                }
                            </script>
                            <div class="swiper-wrapper">

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="d-flex">
                                            <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img flex-shrink-0" alt="">
                                            <div>
                                                <h3>Carlos García</h3>
                                                <h4>Paciente</h4>
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>Estoy muy agradecido con el equipo de la Clínica Palmeras. Su atención fue excelente y ahora tengo una sonrisa mucho más saludable.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- Fin de testimonio -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="d-flex">
                                            <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img flex-shrink-0" alt="">
                                            <div>
                                                <h3>María Sánchez</h3>
                                                <h4>Paciente</h4>
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>El tratamiento de ortodoncia fue increíble. ¡Los resultados superaron mis expectativas!</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- Fin de testimonio -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="d-flex">
                                            <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img flex-shrink-0" alt="">
                                            <div>
                                                <h3>Jorge Fernández</h3>
                                                <h4>Paciente</h4>
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>Me realizaron un implante dental y no podría estar más satisfecho. El equipo fue muy profesional y me explicaron cada paso del proceso.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- Fin de testimonio -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="d-flex">
                                            <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img flex-shrink-0" alt="">
                                            <div>
                                                <h3>Lucía Rodríguez</h3>
                                                <h4>Paciente</h4>
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>El cuidado que ofrecen a los niños en la clínica es excepcional. Mi hijo se siente cómodo y feliz cada vez que va a sus chequeos dentales.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- Fin de testimonio -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="d-flex">
                                            <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img flex-shrink-0" alt="">
                                            <div>
                                                <h3>Juan López</h3>
                                                <h4>Paciente</h4>
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>La mejor clínica dental en la que he estado. El servicio es impecable y los resultados son increíbles.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- Fin de testimonio -->

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>

                </div>

            </div>

        </section><!-- Fin de la Sección de Testimonios -->

    </body>
    <%@include file="footer.jsp" %>
</html>
