<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Cliente</title>
</head>
<body>
    <%@include file="../header.jsp" %>

    <div class="container my-5">
        <h2 class="text-center mb-4">Editar Paciente</h2>
        
        <form action="ControlCliente" method="post" class="border p-4 shadow rounded">
            <input type="hidden" name="opc" value="4"/>
            <input type="hidden" name="id" value="${cliente.id}"/>
            
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="${cliente.nombre}" class="form-control" required/>
            </div>
            
            <div class="mb-3">
                <label for="apellidos" class="form-label">Apellidos:</label>
                <input type="text" name="apellidos" id="apellidos" value="${cliente.apellidos}" class="form-control" required/>
            </div>
            
            <div class="mb-3">
                <label for="correo" class="form-label">Correo:</label>
                <input type="email" name="correo" id="correo" value="${cliente.correo}" class="form-control" required/>
            </div>
            
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección:</label>
                <input type="text" name="direccion" id="direccion" value="${cliente.direccion}" class="form-control" required/>
            </div>
            
            <div class="text-center">
                <input type="submit" value="Guardar Cambios" class="btn btn-success"/>
                <a href="ControlCliente?opc=1" class="btn btn-secondary ms-2">Volver a la lista de clientes</a>
            </div>
        </form>
    </div>

    <%@include file="../footer.jsp" %>
</body>
</html>
