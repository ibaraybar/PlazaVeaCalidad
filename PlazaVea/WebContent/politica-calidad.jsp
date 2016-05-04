<!DOCTYPE html>
<html lang="es-419">
<head>
	<meta charset="utf-8" />
	<meta name="description" content="Pagina de Consulta de Politicas Internas de Calidad del Modulo de Calidad">
	<meta name="author" content="Ivan Baraybar Delgado">
	
	<%@include file="include/header.jsp" %> 	
</head>

<body>
	<%@include file="include/menu.jsp" %>

	<div class="container">
        	
		<!-- Inicio del contenido -->
		<div class="page-header">
			<h2>Pol&iacute;ticas Internas de Calidad</h2>
			Criterios de B&uacute;squeda
		</div>

		<form class="form-horizontal" role="form" method="post" action="PoliticaCalidadServlet">
			<div class="form-group">
				<label class="col-md-2 control-label" for="lblpolitica" id="lblpolitica">Pol&iacute;tica de Calidad:</label>
				<div class="col-md-10">
					<input class="form-control" type="text" name="txtpolitica" id="txtpolitica" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="lblanio" class="col-md-1 control-label">Año:</label>
				<label for="lbldesde" class="col-md-1 control-label">Desde:</label>
				<div class="col-md-2">
					<input type="text" name="txtanioDesde" id="txtanioDesde" class="form-control" />
				</div>
				<label for="lblhasta" class="col-md-1 control-label">Hasta:</label>
				<div class="col-md-2">
					<input type="text" name="txtanioHasta" id="txtanioHasta" class="form-control" />
				</div>
				<label for="lblestado" class="col-md-1 control-label">Estado:</label>
				<div class="col-md-3">
					<select name="selestado" id="selestado" class="form-control">
					  <option value="0">Todos</option>
					  <option value="1">Activo</option>
					  <option value="2">Inactivo</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-offset-8 col-md-1">
					<input type="submit" value="Buscar" class="btn btn-primary" />
				</div>
				<div class="col-md-1">
					<input type="button" value="Limpiar" class="btn btn-primary" onclick="limpiarCriteriosBusqueda()" />
				</div>
				<div class="col-md-2">
					<input type="button" value="Crear Política Calidad" class="btn btn-primary" data-toggle="modal" data-target="#modal-crear-politica" />
				</div>
			</div>
		</form>
		
		<div class="row">
		   	<div class="col-md-12">
		   		<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>C&oacute;digo</th>
						<th>Pol&iacute;tica de Calidad</th>
						<th>Año</th>
						<th>Estado</th>
						<th>Acciones</th>
					</tr>
					
					<%@page import="java.util.ArrayList, plazavea.calidad.modelo.PoliticaCalidad"%>
					<%
						
						ArrayList<PoliticaCalidad> pcalidad = (ArrayList<PoliticaCalidad>) request.getAttribute("PCALIDAD_REGISTRADAS");
						
						if (pcalidad != null) {
							for (PoliticaCalidad x : pcalidad) {							
								out.println("<tr>");
								out.println("<td align='center'>" + x.getIdPolitica() + "</td>");
								out.println("<td>" + x.getNombre() + "</td>");
								out.println("<td align='center'>" + x.getAnio() + "</td>");
								out.println("<td align='center'>" + x.getDescripcionActivo() + "</td>");
								out.println("<td align='center'><a href='#' class='btn btn-warning'>Editar</a> <a href='#' class='btn btn-danger'>Eliminar</a> <a href='DetallePoliticaCalidadServlet?idPolitica=" + x.getIdPolitica() + " ' class='btn btn-info'>Detalle</a></td>");
								out.println("</tr>");
							}
						} 	
					%>
					
				</table>
				</div>
				
				<div class="modal fade" id="modal-crear-politica" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Crear Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" action="PoliticaCalidadServlet">
					  		<div class="form-group">
					        	<label for="lbl01" class="col-sm-3 control-label" id=lbl01>C&oacute;digo Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtcodpolitica" name="txtcodpolitica" disabled>
					            </div>
					        </div>
					        <div class="form-group">
					        	<label for="lbl04" class="col-sm-3 control-label" id=lbl04>Año Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtaniopolitica" name="txtaniopolitica" required autofocus>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl02" class="col-sm-3 control-label" id=lbl02>Nombre Pol&iacute;tica:</label>
					            <div class="col-sm-9">
					            	<input type="text" class="form-control" id="txtnompolitica" name="txtnompolitica">
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl03>Descripci&oacute;n Pol&iacute;tica:</label>
					            <div class="col-sm-9">
					            	<textarea class="form-control" id="txtdescpolitica" name="txtdescpolitica" rows=5></textarea>
					            </div>
					        </div>
						</form>
					  </div>
					  <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button type="button" class="btn btn-primary">Aceptar</button>
					  </div>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function limpiarCriteriosBusqueda() {
			$('input[name="txtpolitica"] ').val('');
			$('input[name="txtanioDesde"] ').val('');
			$('input[name="txtanioHasta"] ').val('');
			$('#selestado').val('0');
		}
	</script>
		
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
</body>
</html>
