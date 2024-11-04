<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Compras"%>
<%@page import="modelo.Proveedores"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Clientes"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            body {
                background-color: #e3f2fd; /* Fondo celeste claro */
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
            <h1>Compras</h1>

            <div class="d-flex justify-content-between">
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-outline-success" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo</button>
                <a class="btn btn-outline-warning" href="proveedores.jsp">Ingresar Proveedores</a>
            </div>

            <div class="modal fade" id="modal_proveedor" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar Compra</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="../sr_compras" method="post" class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="lbl_id">ID</label>
                                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lbl_factura">No. Orden</label>
                                        <input type="number" name="txt_orden" id="txt_orden" class="form-control" placeholder="001" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lbl_proveedor">Proveedor</label>
                                        <select name="drop_proveedor" id="drop_proveedor" class="form-select">
                                            <% 
                                                Proveedores proveedor = new Proveedores();
                                                HashMap<String, String> drop = proveedor.drop();
                                                for (String i : drop.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label for="lbl_fecha">Fecha-Orden</label>
                                        <input type="date" name="txt_fecha" id="txt_fecha" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lbl_ingreso">Fecha-Ingreso</label>
                                        <input type="datetime-local" name="txt_ingreso" id="txt_ingreso" class="form-control" required>
                                    </div>
                                </div>

                                <h5 class="mt-4">Detalle Compra</h5>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="lbl_producto">Producto</label>
                                        <select name="drop_producto" id="drop_producto" class="form-select">
                                            <% 
                                                Producto producto = new Producto();
                                                HashMap<String, String> drop3 = producto.drop();
                                                for (String i : drop3.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop3.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lbl_cantidad">Cantidad</label>
                                        <input type="number" name="txt_cantidad" id="txt_cantidad" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lbl_precio">Precio Unitario</label>
                                        <input type="number" name="txt_precio" id="txt_precio" class="form-control" required>
                                    </div>
                                </div>

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
                        <th>Número Orden</th>
                        <th>Proveedor</th>
                        <th>Fecha Orden</th>
                        <th>Fecha Ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_compras">
                    <% 
                        Compras compra = new Compras();
                        DefaultTableModel tabla = compra.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id-prov=" + tabla.getValueAt(t, 2) + " data-id-p=" + tabla.getValueAt(t, 6) + " data-id-cant=" + tabla.getValueAt(t, 7) + " data-id-u=" + tabla.getValueAt(t, 8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
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
                $("#txt_orden").val('');
                $("#drop_proveedor").val(0);
                $("#txt_fecha").val('');
                $("#txt_ingreso").val('');
                $("#drop_producto").val(0);
                $("#txt_cantidad").val('');
                $("#txt_precio").val('');
            }

            $('#tbl_compras').on('click', 'tr td', function (evt) {
                var target = $(event.target);
                var id = target.parent().data('id');
                var proveedor = target.parent().data('id-prov');
                var producto = target.parent().data('id-p');
                var cantidad = target.parent().data('id-cant');
                var precio = target.parent().data('id-u');
                var orden = target.parent("tr").find("td").eq(0).html();
                var fecha = target.parent("tr").find("td").eq(2).html();
                var ingreso = target.parent("tr").find("td").eq(3).html();

                $("#txt_id").val(id);
                $("#txt_orden").val(orden);
                $("#drop_proveedor").val(proveedor);
                $("#txt_fecha").val(fecha);
                $("#txt_ingreso").val(ingreso);
                $("#drop_producto").val(producto);
                $("#txt_cantidad").val(cantidad);
                $("#txt_precio").val(precio);

                $("#modal_proveedor").modal('show');
            });
        </script>
    </body>
</html>
