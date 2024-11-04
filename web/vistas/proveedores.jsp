<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Proveedores"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            body {
                background-color: #e0f7fa; /* Fondo celeste claro */
                color: #01579b;
                font-family: Arial, sans-serif;
            }
            h1 {
                text-align: center;
                color: #0277bd;
                margin-top: 20px;
                font-weight: bold;
            }
            .navbar {
                background-color: #0288d1;
            }
            .navbar-brand, .nav-link {
                color: #ffffff !important;
                font-weight: bold;
            }
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
            .modal-content {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .modal-header {
                background-color: #b3e5fc;
            }
            .modal-title {
                color: #01579b;
            }
            label {
                font-weight: bold;
                color: #01579b;
            }
            .form-control {
                border-radius: 5px;
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
                background-color: #e3f2fd;
                color: #333;
                border-top: 1px solid #ddd;
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
            <h1>Proveedores</h1>

            <div class="d-flex justify-content-between">
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-outline-success" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo</button>
                <a class="btn btn-outline-warning" href="compras.jsp">Ingresar Compra</a>
            </div>

            <div class="modal fade" id="modal_proveedor" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar Proveedor</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../sr_proveedores" method="post" class="form-group">
                                <label for="lbl_id">ID</label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                
                                <label for="lbl_proveedor">Proveedor</label>
                                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Proveedor1" required>

                                <label for="lbl_nit">NIT</label>
                                <input type="text" name="txt_NIT" id="txt_NIT" class="form-control" placeholder="123" required>

                                <label for="lbl_direccion">Direccion</label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>

                                <label for="lbl_telefono">Telefono</label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>

                                <div class="modal-footer">
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
                        <th>Proveedor</th>
                        <th>NIT</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                    </tr>
                </thead>
                <tbody id="tbl_proveedors">
                    <%
                        Proveedores proveedor = new Proveedores();
                        DefaultTableModel tabla = proveedor.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function limpiar() {
                $("#txt_id").val(0);
                $("#txt_proveedor").val('');
                $("#txt_NIT").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
            }

            $('#tbl_proveedors').on('click', 'tr td', function (evt) {
                var target = $(event.target);
                var id = target.parent().data('id');
                var proveedor = target.parent("tr").find("td").eq(0).html();
                var NIT = target.parent("tr").find("td").eq(1).html();
                var direccion = target.parent("tr").find("td").eq(2).html();
                var telefono = target.parent("tr").find("td").eq(3).html();

                $("#txt_id").val(id);
                $("#txt_proveedor").val(proveedor);
                $("#txt_NIT").val(NIT);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);

                $("#modal_proveedor").modal('show');
            });
        </script>
    </body>
</html>
