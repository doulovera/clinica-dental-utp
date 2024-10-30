

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmación de Cita Veterinaria</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom Styles -->
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .confirmation-box {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 40px;
                margin: 80px auto;
                max-width: 600px;
                text-align: center;
            }

            .confirmation-box h1 {
                font-size: 36px;
                color: #007bff;
                margin-bottom: 20px;
            }

            .confirmation-box p {
                font-size: 18px;
                color: #6c757d;
                margin-bottom: 30px;
            }

            .confirmation-box .btn {
                background-color: #007bff;
                color: #ffffff;
                padding: 10px 20px;
                border-radius: 50px;
                font-size: 16px;
                border: none;
                transition: background-color 0.3s ease;
            }

            .confirmation-box .btn:hover {
                background-color: #0056b3;
            }

            .icon-checkmark {
                font-size: 60px;
                color: #007bff;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="confirmation-box">
                <!-- Icono de confirmación -->
                <div class="icon-checkmark">
                    &#10003;
                </div>
                <!-- Mensaje de éxito -->
                <h1>¡Cita Registrada con Éxito!</h1>
                <p>Tu cita veterinaria ha sido agendada correctamente. Recibirás un correo electrónico de confirmación con los detalles de la cita.</p>
                <p>¡Gracias por confiar en nosotros para el cuidado de tu mascota!</p>
                <!-- Botón para volver a la página principal o hacer otra cita -->
                <a href="index.jsp" class="btn btn-primary">Volver a la Página Principal</a>
            </div>
        </div>
        <!-- Bootstrap JS y dependencias -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <%@include file="footer.jsp" %>
    </body>
</html>

