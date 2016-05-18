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
			<li class="active">Aprobar Plan de Trabajo Anual</li>
		</ol>

		<div class="page-header">
			<h2>Planes de Trabajo Anuales</h2>
		</div>
		
		<form role="form" method="post" id="formBuscar" name="formBuscar" action="AprobarPlanAnualServlet" >
					
			<div class="row form-group">
				<label for="lblanio" class="col-sm-1 control-label">Año:</label>
				<div class="col-sm-2">
					<input type="number" name="txtanio" id="txtanio" class="form-control" />
				</div>
				<label for="lblestado" class="col-sm-1 control-label">Estado:</label>
				<div class="col-sm-4">
					<select name="selestado" id="selestado" class="form-control">
					  <option value="-1">Todos</option>
					  <option value="0">Registrado</option>
					  <option value="1">Pendiente de Aprobación</option>
					  <option value="2">Aprobado</option>
					  <option value="3">Rechazado</option>
					  <option value="4">No Vigente</option>
					</select>
				</div>
				<div class="col-md-offset-3 col-md-1">
					<input type="button" value="Buscar" class="btn btn-primary" onclick="buscar()" />
				</div>
			</div>
			
			<input type="hidden" name="txtaccion" value=" "/>
		</form>
		<br>
		<div class="row">
		   	<div class="col-md-12">
		   		<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>C&oacute;digo</th>
						<th>Año Plan</th>
						<th>Descripción del Plan</th>
						<th>Estado</th>
						<th></th>
					</tr>
					
					<%@page import="java.util.ArrayList, plazavea.calidad.modelo.PlanAnual"%>
					<%
						
						ArrayList<PlanAnual> planes = (ArrayList<PlanAnual>) request.getAttribute("PANUALES_REGISTRADOS");
						
						if (planes != null) {
							for (PlanAnual x : planes) {							
								out.println("<tr>");
								out.println("<td align='center'>" + x.getIdPlan() + "</td>");
								out.println("<td align='center'>" + x.getAnioVigencia() + "</td>");
								out.println("<td>" + x.getDescripcion() + "</td>");
								out.println("<td align='center'>" + x.getNombreEstado() + "</td>");
								
								if (x.getEstado() == 1) {
									out.println("<td align='center'><a href='#' class='btn btn-info'>Ver</a> <a href='#' class='btn btn-primary' data-toggle='modal' data-target='#modal-confirm-aprobar' onclick='mostrarIdAprobar(" + x.getIdPlan() + ")'>Aprobar</a> <a href='#' class='btn btn-danger' onclick='rechazar()'>Rechazar</a></td>");
									//out.println("<td align='center'><a href='#' class='btn btn-warning' data-toggle='modal' data-target='#modal-editar-politica' onclick='mostrarPoliticaEditar(" + x.getIdPolitica() + ",\"" + x.getAnio() + "\",\"" + x.getNombre() + "\",\"" + x.getDescripcion() + "\")'>Editar</a> <a href='#' class='btn btn-danger' data-toggle='modal' data-target='#modal-confirm-delete' onclick='mostrarIdEliminar(" + x.getIdPolitica() + ")'>Eliminar</a> <a href='DetallePoliticaCalidadServlet?idPolitica=" + x.getIdPolitica() + " ' class='btn btn-info'>Detalle</a></td>");	
								} else {
									out.println("<td align='center'><a href='#' class='btn btn-info'>Ver</a></td>");
								}
								
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
				
				<div class="modal fade" id="modal-confirm-aprobar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Eliminar Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" id="formAprobar" name="formAprobar" action="AprobarPlanAnualServlet">
					  		<p>¿ Est&aacute; seguro de Aprobar el Plan seleccionado ?</p>
					  		<input type="hidden" name="txtPlanAprueba" value=" "/>
					  		<input type="hidden" name="txtaccion" value=" "/>
					  		
					  		<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
								<button type="button" class="btn btn-primary" onclick="aprobar()">S&iacute;</button>
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
	HttpSession sesion = request.getSession();
	String insertarOK = (String)sesion.getAttribute("INSERTAR_OK");
	String aprobarOK = (String)sesion.getAttribute("APROBAR_OK");
	String rechazarOK = (String)sesion.getAttribute("RECHAZAR_OK");
				
	if (insertarOK == "SI") {
	%>
	<div class="alert alert-success alert-dismissible fade in" role="alert" id="msjInsertarOk">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
	  <strong>Felicitaciones! </strong>La Politica de Calidad se grabó correctamente.
	</div>
	
	<script>
		$("#msjInsertarOk").slideDown("slow").delay(3000).fadeOut(2000, function(){
	        $(this).remove();
	    });
		bootbox.alert("La Politica de Calidad se grabó correctamente.");
	</script>
	<%
	sesion.setAttribute("INSERTAR_OK","NO");
	}
	if (aprobarOK == "SI") {
	%>
	<script>
		bootbox.alert("El Plan de Trabajo Anual se aprobó correctamente.");
	</script>
	<%
	sesion.setAttribute("APROBAR_OK","NO");
	}
	if (aprobarOK == "NO_PLAN") {
	%>
	<script>
		bootbox.alert("La Politica de Calidad se encuentra asignada a uno o más Planes de Trabajo Anuales. No podrá eliminarla.");
	</script>
	<%
	sesion.setAttribute("APROBAR_OK","NO");
	}
	if (rechazarOK == "SI") {
		%>
		<script>
			bootbox.alert("El Plan de Trabajo Anual se rechazó.");
		</script>
		<%
		sesion.setAttribute("RECHAZAR_OK","NO");
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
		
		function aprobar() { 
			$('input[name="txtaccion"] ').val('aprobar');
			$('form#formAprobar').submit();
		};
		
		function mostrarIdAprobar(idPlan) {
			$('input[name="txtPlanAprueba"] ').val(idPlan);
		}
		
		function rechazar(idPlan) { 
			//$('input[name="txtaccion"] ').val('rechazar');
			//$('form#formRechazar').submit();
			
			bootbox.prompt("¿ Está seguro de Rechazar el Plan? De ser así ingrese el Motivo de Rechazo.", function(result) {                
				if (result === null) {                                             
					bootbox.alert("Debe ingresar un motivo de rechazo");                              
				} else {
					//$('input[name="txtPlanRechaza"] ').val(idPlan);
					//$('input[name="txtaccion"] ').val('rechazar');
					//$('form#formAprobar').submit();
				}
			});
		};
		
		function mostrarIdRechazar(idPlan) {
			$('input[name="txtPlanRechaza"] ').val(idPlan);
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
