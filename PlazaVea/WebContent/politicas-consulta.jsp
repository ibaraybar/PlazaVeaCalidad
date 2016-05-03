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

		<form class="form-horizontal" role="form" method="post" action="ConsultarPoliticasCalidadServlet">
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
					<input type="text" name="anioDesde" id="anioDesde" class="form-control" />
				</div>
				<label for="lblhasta" class="col-md-1 control-label">Hasta:</label>
				<div class="col-md-2">
					<input type="text" name="anioHasta" id="anioHasta" class="form-control" />
				</div>
				<label for="lblestado" class="col-md-1 control-label">Estado:</label>
				<div class="col-md-3">
					<select name="estado" id="estado" class="form-control">
					  <option value="all">Todos</option>
					  <option value="activo">Activo</option>
					  <option value="inactivo">Inactivo</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-offset-10 col-md-1">
					<input type="submit" value="Buscar" class="btn btn-primary" />
				</div>
				<div class="col-md-1">
					<input type="submit" value="Limpiar" class="btn btn-primary" />
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
								out.println("<td><a href='#' class='btn btn-warning'>Editar</a> <a href='#' class='btn btn-danger'>Eliminar</a> <a href='#' class='btn btn-info'>Detalle</a></td>");
								out.println("</tr>");
							}
						} 	
					%>
					
				</table>
				</div>
			</div>
		</div>
	</div>
		
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
</body>
</html>
