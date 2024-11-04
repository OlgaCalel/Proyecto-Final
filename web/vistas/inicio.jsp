<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") != null) {
        String usuario = (String) session.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            body {
                background: linear-gradient(to bottom right, #FFD194, #D1913C); /* Colores cálidos */
                color: #4a2c2a;
                font-family: 'Arial', sans-serif;
            }
            h1 {
                text-align: center;
                color: #4a2c2a;
                font-size: 2.5em;
                margin-top: 20px;
            }
            .welcome-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 40px;
                padding: 20px;
                background-color: rgba(255, 239, 213, 0.8); /* Fondo semitransparente */
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                max-width: 80%;
                margin: 40px auto;
            }
            .welcome-message {
                font-size: 1.5em;
                font-weight: bold;
                color: #663d3d;
                margin-left: 20px;
                max-width: 60%;
            }
            .image-container img {
                max-width: 200px;
                height: auto;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .navbar-brand {
                color: #4a2c2a !important;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #D1913C;">
            <a class="navbar-brand" href="inicio.jsp">TECHNOVA</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="inicio.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="compras.jsp">Compras</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <h1>Bienvenido a TECHNOVA</h1>
        
        <div class="welcome-container">
            <div class="image-container">
                <img src="https://png.pngtree.com/png-vector/20210128/ourlarge/pngtree-business-technology-information-technology-png-image_2854742.jpg" alt="Imagen de bienvenida">
            </div>
            <div class="welcome-message">
                <p> ¡Bienvenido!</p> 
                <p>Nos alegra que estés aquí. Esperamos que encuentres todo lo que necesitas en avances tecnológicos. Disfruta de tu experiencia en TECHNOVA, donde la innovación está a un clic de distancia.</p>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>

<% } else {
    response.sendRedirect("../index.jsp");
} %>
