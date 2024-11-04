<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            /* Fondo y colores amigables */
            body {
                background-color: #e3f2fd; /* Celeste claro */
                color: #333;
                font-family: Arial, sans-serif;
            }
            h1 {
                text-align: center;
                color: #0277bd; /* Encabezado en azul */
                margin-top: 20px;
                font-size: 2.5em;
                font-weight: bold;
            }
            /* Barra de navegación */
            .navbar {
                background-color: #0288d1;
            }
            .navbar-brand, .nav-link {
                color: #ffffff !important;
                font-weight: bold;
            }
            /* Botones */
            .btn-outline-success, .btn-outline-warning {
                margin: 10px;
                border-radius: 5px;
            }
            .btn-outline-success {
                border-color: #0277bd;
                color: #0277bd;
            }
            .btn-outline-success:hover {
                background-color: #0277bd;
                color: #ffffff;
            }
            .btn-outline-warning {
                border-color: #fbc02d;
                color: #fbc02d;
            }
            .btn-outline-warning:hover {
                background-color: #fbc02d;
                color: #ffffff;
            }
            /* Modal */
            .modal-content {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .modal-header {
                background-color: #e1f5fe;
                border-bottom: 1px solid #b3e5fc;
            }
            .modal-title {
                font-size: 1.5em;
                color: #0277bd;
            }
            /* Tabla */
            .table-dark {
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
                background-color: #ffffff;
            }
            .table-dark th {
                background-color: #0277bd;
                color: #ffffff;
            }
            .table-dark td {
                background-color: #f1f8e9;
                color: #333;
                border-top: 1px solid #ddd;
            }
            .modal-footer {
                display: flex;
                justify-content: space-between;
            }
            label {
                font-weight: bold;
                color: #555;
            }
            .form-control {
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .btn-primary {
                background-color: #0277bd;
                border-color: #0277bd;
                border-radius: 5px;
            }
            .btn-primary:hover {
                background-color: #01579b;
            }
            .btn-danger {
                border-radius: 5px;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark">
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

        <div class="container">
            <h1>Marcas</h1>

            <div class="d-flex justify-content-between">
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-outline-success" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
                <a class="btn btn-outline-warning" href="productos.jsp">Ingresar Producto</a>
            </div>

            <div class="modal fade" id="modal_empleado" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar Marca</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../sr_marcas" method="post" class="form-group">
                                <label for="lbl_id">ID</label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly> 
                                <label for="lbl_codigo">Marca</label>
                                <input type="text" name="txt_marca" id="txt_marca" class="form-control" required>

                                <div class="modal-footer mt-4">
                                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                                    <button name="btn_eliminar" id="btn_modificar" value="eliminar" class="btn btn-danger" onclick="return confirm('¿Desea Eliminar?');">Eliminar</button>
                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <table class="table table-striped table-dark mt-4">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Marca</th>
                    </tr>
                </thead>
                <tbody id="tbl_marcas">
                    <%
                        Marca marca = new Marca();
                        HashMap<String, String> drop = marca.drop();
                        for (String i : drop.keySet()) {
                            out.println("<tr>");
                            out.println("<td>" + i + "</td>");
                            out.println("<td>" + drop.get(i) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar() {
                $("#txt_id").val(0);
                $("#txt_marca").val('');
            }

            $('#tbl_marcas').on('click', 'tr td', function (evt) {
                var target, id, marca;
                target = $(event.target);
                id = target.parent("tr").find("td").eq(0).html();
                marca = target.parent("tr").find("td").eq(1).html();

                $("#txt_id").val(id);
                $("#txt_marca").val(marca);

                $("#modal_empleado").modal('show');
            });
        </script>
    </body>
</html>
