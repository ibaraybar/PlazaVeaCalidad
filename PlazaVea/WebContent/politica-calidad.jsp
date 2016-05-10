<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es-419">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Pagina de Consulta de Politicas Internas de Calidad del Modulo de Calidad">
	<meta name="author" content="Ivan Baraybar Delgado">
	
	<title>SISTEMA DE GESTIÓN DE SUPERMERCADOS - Gestión de Calidad</title>
	    
	<%@include file="include/header.jsp" %> 	
</head>

<body>
	<%@include file="include/menu.jsp" %>

	<div class="container">
        	
		<!-- Inicio del contenido -->
		<ol class="breadcrumb">
			<li><a href="#">Inicio</a></li>
			<li><a href="#">Planificaci&oacute;n Anual</a></li>
			<li class="active">Pol&iacute;ticas Internas de Calidad</li>
		</ol>

		<div class="page-header">
			<h2>Pol&iacute;ticas Internas de Calidad</h2>
		</div>
		
		<form role="form" method="post" id="formBuscar" name="formBuscar" action="PoliticaCalidadServlet" >
			
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="lblpolitica" id="lblpolitica">Pol&iacute;tica de Calidad:</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="txtpolitica" id="txtpolitica" />
				</div>
			</div>
			
			<div class="row form-group">
				<label for="lblanio" class="col-sm-1 control-label">Año:</label>
				<label for="lbldesde" class="col-sm-1 control-label">Desde:</label>
				<div class="col-sm-2">
					<input type="text" name="txtanioDesde" id="txtanioDesde" class="form-control" />
				</div>
				<label for="lblhasta" class="col-sm-1 control-label">Hasta:</label>
				<div class="col-sm-2">
					<input type="text" name="txtanioHasta" id="txtanioHasta" class="form-control" />
				</div>
				<label for="lblestado" class="col-sm-1 control-label">Estado:</label>
				<div class="col-sm-4">
					<select name="selestado" id="selestado" class="form-control">
					  <option value="0">Todos</option>
					  <option value="1">Activo</option>
					  <option value="2">Inactivo</option>
					</select>
				</div>
			</div>
			
			<input type="hidden" name="txtaccion" value=" "/>
			<div class="row form-group">
				<div class="col-md-offset-8 col-md-1">
					<input type="button" value="Buscar" class="btn btn-primary" onclick="buscar()" />
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
								out.println("<td align='center'><a href='#' class='btn btn-warning' data-toggle='modal' data-target='#modal-editar-politica' onclick='mostrarPoliticaEditar(" + x.getIdPolitica() + ",\"" + x.getAnio() + "\",\"" + x.getNombre() + "\",\"" + x.getDescripcion() + "\")'>Editar</a> <a href='#' class='btn btn-danger' data-toggle='modal' data-target='#modal-confirm-delete' onclick='mostrarIdEliminar(" + x.getIdPolitica() + ")'>Eliminar</a> <a href='DetallePoliticaCalidadServlet?idPolitica=" + x.getIdPolitica() + " ' class='btn btn-info'>Detalle</a></td>");
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
					  	<form class="form-horizontal" role="form" method="post" id="formInsertar" name="formInsertar" action="PoliticaCalidadServlet">
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
					        
					        <input type="hidden" name="txtaccion" value=" "/>
					        <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
								<button type="button" class="btn btn-primary" onclick="insertar()">Aceptar</button>
							</div>
						</form>
					  </div>
					  
					</div>
				  </div>
				</div>
				
				<div class="modal fade" id="modal-confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Eliminar Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" id="formEliminar" name="formEliminar" action="PoliticaCalidadServlet">
					  		<p>¿ Est&aacute; seguro de Eliminar la Pol&iacute;tica de Calidad seleccionada ?</p>
					  		<input type="hidden" name="txtHiddenIdPC" value=" "/>
					  		<input type="hidden" name="txtaccion" value=" "/>
					  		
					  		<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
								<button type="button" class="btn btn-primary" onclick="eliminar()">S&iacute;</button>
							</div>
					  	</form>				
					  </div>
					</div>
				  </div>
				</div>
				
				<div class="modal fade" id="modal-editar-politica" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Editar Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" id="formEditar" name="formEditar" action="PoliticaCalidadServlet">
					  		<div class="form-group">
					        	<label for="lbl05" class="col-sm-3 control-label" id="lbl05">C&oacute;digo Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtcodpolitica2" name="txtcodpolitica2" disabled>
					            </div>
					            <input type="hidden" name="txtIdPolCal" value=" "/>
					        </div>
					        <div class="form-group">
					        	<label for="lbl06" class="col-sm-3 control-label" id="lbl06">Año Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtaniopolitica2" name="txtaniopolitica2" required>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl07" class="col-sm-3 control-label" id="lbl07">Nombre Pol&iacute;tica:</label>
					            <div class="col-sm-9">
					            	<input type="text" class="form-control" id="txtnompolitica2" name="txtnompolitica2">
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl08" class="col-sm-3 control-label" id="lbl08">Descripci&oacute;n Pol&iacute;tica:</label>
					            <div class="col-sm-9">
					            	<textarea class="form-control" id="txtdescpolitica2" name="txtdescpolitica2" rows=5></textarea>
					            </div>
					        </div>
					        
					        <input type="hidden" name="txtaccion" value=" "/>
					        <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
								<button type="button" class="btn btn-primary" onclick="editar()">Aceptar</button>
							</div>
						</form>
					  </div>
					  
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	
	<%
	//String juntaOK = String.valueOf(request.getAttribute("JUNTA_OK"));
	HttpSession sesion = request.getSession();
	String eliminarOK = (String)sesion.getAttribute("ELIMINAR_OK");
				
	if (eliminarOK == "SI") {
	%>
	<div class="alert alert-success alert-dismissible fade in" role="alert" id="lyMensajeOk">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
	  <strong>Felicitaciones! </strong>La Politica de Calidad has sido eliminada.
	</div>
	
	<script>
		$("#lyMensajeOk").delay(1000).fadeTo(1000, 0);
	</script>
	<%
	}
	%>
	
	<script type="text/javascript">
		function limpiarCriteriosBusqueda() {
			$('input[name="txtpolitica"] ').val('');
			$('input[name="txtanioDesde"] ').val('');
			$('input[name="txtanioHasta"] ').val('');
			$('#selestado').val('0');
		}
		
		function buscar() { 
			$('input[name="txtaccion"] ').val('buscar');
			$('form#formBuscar').submit();
		}
		
		function insertar() { 
			$('input[name="txtaccion"] ').val('insertar');
			$('form#formInsertar').submit();
		};
		
		function eliminar() { 
			$('input[name="txtaccion"] ').val('eliminar');
			$('form#formEliminar').submit();
		};
		
		function mostrarIdEliminar(idPCal) {
			$('input[name="txtHiddenIdPC"] ').val(idPCal);
		}
		
		function mostrarPoliticaEditar(pIdPC, pAnioPC, pNomPC, pDesPC) {
			$('input[name="txtcodpolitica2"] ').val(pIdPC);
			$('input[name="txtIdPolCal"] ').val(pIdPC);
			$('input[name="txtaniopolitica2"] ').val(pAnioPC);
			$('input[name="txtnompolitica2"] ').val(pNomPC);
			$('textarea[name="txtdescpolitica2"] ').val(pDesPC);
		}
		
		function editar() { 
			$('input[name="txtaccion"] ').val('editar');
			$('form#formEditar').submit();
		};
	</script>
		
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
</body>
</html>
