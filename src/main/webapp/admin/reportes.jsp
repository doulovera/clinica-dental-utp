<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="dao.GraficoDao" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reportes</title>
    <%@include file="header.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <section id="reportes" class="admin-section section">
        <div class="container section-title" data-aos="fade-up">
            <h2>Reportes</h2>
            <p>Genera y visualiza reportes de citas, clientes o tratamientos.</p>
        </div>

        <div class="container my-5">
            <h3>Citas Vencidas por Mes en el Último Año</h3>
            <canvas id="citasVencidasPorMesChart" width="400" height="200"></canvas>
        </div>
    </section>
    <%
        // Obtener datos de citas vencidas por mes
        GraficoDao graficoDao = new GraficoDao();
        Map<String, Integer> citasPorMes = graficoDao.contarCitasVencidasPorMesUltimoAno();

        // Imprimir los datos en la consola para depuración
        System.out.println("Meses: " + new ArrayList<>(citasPorMes.keySet()));
        System.out.println("Totales: " + new ArrayList<>(citasPorMes.values()));

        // Convertir los datos a formato JSON para pasarlos a JavaScript
        String mesesJson = new JSONArray(new ArrayList<>(citasPorMes.keySet())).toString();
        String totalesJson = new JSONArray(new ArrayList<>(citasPorMes.values())).toString();
    %>

    <script>
        // Configurar y renderizar el gráfico con datos pasados de Java a JavaScript
        const ctx = document.getElementById('citasVencidasPorMesChart').getContext('2d');
        const citasVencidasPorMesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: <%= mesesJson %>, // Etiquetas de los meses en formato JSON
                datasets: [{
                    label: 'Citas Vencidas',
                    data: <%= totalesJson %>, // Datos de citas vencidas en formato JSON
                    borderColor: 'rgba(255, 99, 132, 1)', // Color de la línea
                    backgroundColor: 'rgba(255, 99, 132, 0.2)', // Color de fondo debajo de la línea
                    fill: true,
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Mes'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Citas Vencidas'
                        }
                    }
                }
            }
        });
    </script>

    <%@include file="footer.jsp" %>
</body>
</html> 
