
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio de Sesión - Clínica Dental</title>

        <!-- Estilos de Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        
        <!-- SweetAlert CSS y JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Estilos adicionales -->
        <style>
            body {
                background-image: url('path/to/image.png'); /* Ajusta el path con la imagen que subiste */
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login-container {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 2rem;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 400px;
                text-align: center;
            }

            .login-container img {
                width: 100px;
                margin-bottom: 1rem;
            }

            .login-container h3 {
                font-family: 'Poppins', sans-serif;
                margin-bottom: 2rem;
            }

            .btn-primary {
                width: 100%;
                background-color: #007bff;
                border-color: #007bff;
            }

            .form-floating {
                position: relative;
            }

            .form-floating input {
                padding-right: 45px; /* Espacio para el botón de ojo */
            }

            .form-floating .toggle-password {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }

            .forgot-password {
                margin-top: 1rem;
            }

            .forgot-password a {
                color: #007bff;
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <!-- Imagen del logotipo o clínica -->
            <img src="https://img.icons8.com/clouds/100/000000/tooth.png" alt="Logotipo Clínica Dental">

            <h3>Iniciar Sesión</h3>

            <!-- Dentro de tu formulario en admin/index.jsp -->
            <form action="${pageContext.request.contextPath}/login" method="POST">
                <!-- Usuario -->
                <div class="form-floating mb-3">
                    <input name="txtuser" type="text" class="form-control" placeholder="Correo electrónico" required>
                    <label for="txtuser">Correo Electrónico</label>
                </div>

                <!-- Contraseña con el botón para mostrar/ocultar -->
                <div class="form-floating mb-3">
                    <input name="txtpass" type="password" class="form-control" id="password" placeholder="Contraseña" required>
                    <label for="txtpass">Contraseña</label>
                    <i class="bi bi-eye-slash toggle-password" onclick="togglePasswordVisibility()"></i>
                </div>

                <!-- Botón de Iniciar Sesión -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                </div>

                <!-- Opción de Recuperar Contraseña -->
                <div class="forgot-password">
                    <a href="#">¿Olvidaste tu contraseña?</a>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script para el botón de mostrar/ocultar contraseña -->
        <script>
                        function togglePasswordVisibility() {
                            var passwordInput = document.getElementById('password');
                            var icon = document.querySelector('.toggle-password');
                            if (passwordInput.type === 'password') {
                                passwordInput.type = 'text';
                                icon.classList.remove('bi-eye-slash');
                                icon.classList.add('bi-eye');
                            } else {
                                passwordInput.type = 'password';
                                icon.classList.remove('bi-eye');
                                icon.classList.add('bi-eye-slash');
                            }
                        }
        </script>

        <!-- Mostrar mensaje de error con SweetAlert si loginError es true -->
        <script>
            <%
                String loginError = (String) request.getAttribute("loginError");
                if (loginError != null) {
                    if (loginError.equals("inactive")) {%>
            Swal.fire({
                icon: 'error',
                title: 'Acceso denegado',
                text: 'Tu cuenta está inactiva. Contacta con el administrador.',
                confirmButtonText: 'Aceptar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '<%= request.getContextPath()%>/admin/index.jsp';
                }
            });
            <% } else if (loginError.equals("credentials")) {%>
            Swal.fire({
                icon: 'error',
                title: 'Error de inicio de sesión',
                text: 'Usuario o contraseña incorrectos',
                confirmButtonText: 'Aceptar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '<%= request.getContextPath()%>/admin/index.jsp';
                }
            });
            <% } %>
            <% }%>
        </script>


    </body>
</html>
