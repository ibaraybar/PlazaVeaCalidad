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
			<h2>Pol&iacute;tica Interna de Calidad</h2>
			Criterios de B&uacute;squeda
		</div>

		<form class="form-horizontal" role="form" method="post" action="ConsultarPoliticasCalidadServlet">
			<%@page import="java.util.ArrayList, plazavea.calidad.modelo.PoliticaCalidad"%>
			<%
				
				PoliticaCalidad politicaCalidad = (PoliticaCalidad) request.getAttribute("politicaCalidad");
				
				if (politicaCalidad != null) {
	
			%>
			<div class="form-group">
				<label class="col-md-2 control-label" for="lblidpolitica" id="lblidpolitica">C&oacute;digo Pol&iacute;tica:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="txtidpolitica" id="txtidpolitica" disabled="disabled" value="<%=politicaCalidad.getIdPolitica()%>" />
				</div>
				<label class="col-md-2 control-label" for="lblaniopolitica" id="lblaniopolitica">Año Pol&iacute;tica:</label>
				<div class="col-md-2">
					<input class="form-control" type="text" name="txtaniopolitica" id="txtaniopolitica" disabled="disabled" value="<%=politicaCalidad.getAnio()%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="lblnombrepolitica" id="lblnombrepolitica">Nombre Pol&iacute;tica:</label>
				<div class="col-md-10">
					<input class="form-control" type="text" name="txtnombrepolitica" id="txtnombrepolitica" disabled="disabled" value="<%=politicaCalidad.getNombre()%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="lbldescripcionpolitica" id="lbldescripcionpolitica">Descripci&oacute;n Pol&iacute;tica:</label>
				<div class="col-md-10">
					<textarea class="form-control" name="txtdescripcionpolitica" id="txtdescripcionpolitica" disabled="disabled" rows="4" cols="50"><%=politicaCalidad.getDescripcion()%></textarea>
				</div>
			</div>
			<%
			
				}
			%>			
			
			<div class="form-group">
				<div class="col-md-offset-8 col-md-1">
					<input type="submit" value="Agregar Detalle de Política" class="btn btn-primary" />
				</div>
			</div>
		</form>
		
		<div class="row">
		   	<div class="col-md-12">
		   		<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>Item</th>
						<th>Nombre</th>
						<th>Tipo</th>
						<th>Alerta</th>
						<th>Acciones</th>
					</tr>
					
					<%@page import="java.util.ArrayList, plazavea.calidad.modelo.DetallePoliticaCalidad"%>
					<%
						
						ArrayList<DetallePoliticaCalidad> detallePoliticaList = (ArrayList<DetallePoliticaCalidad>) request.getAttribute("detallePoliticaList");
						
						if (detallePoliticaList != null) {
							for (DetallePoliticaCalidad x : detallePoliticaList) {							
								out.println("<tr>");
								out.println("<td align='center'>" + x.getIdDetallePolitica() + "</td>");
								out.println("<td align='center'>" + x.getNombre() + "</td>");
								out.println("<td align='center'></td>");
								out.println("<td align='center'></td>");
								out.println("<td align='center'><a href='#' class='btn btn-warning'>Editar</a> <a href='#' class='btn btn-danger'>Eliminar</a> </td>");
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
