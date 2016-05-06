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
					<input type="button" value="Agregar Detalle de Política" class="btn btn-primary" data-toggle="modal" data-target="#modal-agregar-detalle-politica" />
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
								out.println("<td align='center'>" + x.getDescripcionTipo() + "</td>");
								out.println("<td align='center'>" + x.getDescripcionAlerta() + "</td>");
								out.println("<td align='center'><a href='#' class='btn btn-warning' data-toggle='modal' data-target='#modal-editar-detalle-politica' onclick='mostrarPoliticaEditar(" + x.getIdDetallePolitica() + ",\"" + x.getIdPolitica() + ",\"" + x.getNombre() + "\",\"" + x.getDescripcion() + "\",\"" + x.getTipo() + "\",\"" + x.isAlerta() + "\")'>Editar</a> <a href='#' class='btn btn-danger' data-toggle='modal' data-target='#modal-confirm-delete' onclick='mostrarIdEliminar(" + x.getIdDetallePolitica() + ", " + x.getIdPolitica() + ")'>Eliminar</a> </td>");
								out.println("</tr>");
							}
						} 	
					%>
					
				</table>
				</div>
				
				<div class="modal fade" id="modal-agregar-detalle-politica" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Agregar Detalle de Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  <form class="form-horizontal" role="form" method="post" id="formInsertar" name="formInsertar" action="DetallePoliticaCalidadServlet">
					  		<div class="form-group">
					        	<label for="lbl01" class="col-sm-3 control-label" id=lbl01>C&oacute;digo Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtcodpolitica" name="txtcodpolitica" value="<%=request.getParameter("idPolitica")%>" disabled>
					            </div>
					        	<label for="lbl04" class="col-sm-3 control-label" id=lbl04>Item nro.:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtitem" name="txtitem" disabled>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl02" class="col-sm-3 control-label" id=lbl02>Nombre:</label>
					            <div class="col-sm-9">
					            	<input type="text" class="form-control" id="txtnombre" name="txtnombre" required autofocus>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl03>Descripci&oacute;n:</label>
					            <div class="col-sm-9">
					            	<textarea class="form-control" id="txtdescripcion" name="txtdescripcion" rows=5></textarea>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl04>Tipo:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txttipo" name="txttipo">
									  <option value="N">Normal</option>
									  <option value="C">Crítco</option>
									</select>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl05>Alerta:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txtalerta" name="txtalerta">
									  <option value="N">No</option>
									  <option value="S">Si</option>
									</select>
					            </div>
					        </div>
					        <input type="hidden" name="txtidpolitica"  value="<%=request.getParameter("idPolitica")%>"/>
					      <input type="hidden" name="txtaccion" value=" "/>
						  <div class="modal-footer">
							  <button type="button" class="btn btn-primary"  onclick="insertar(<%=request.getParameter("idPolitica")%>)">Grabar</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
						<h4 class="modal-title" id="myModalLabel">Eliminar Detalle de la Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" id="formEliminar" name="formEliminar" action="DetallePoliticaCalidadServlet">
					  		<p>¿ Est&aacute; seguro de Eliminar el Detalle de la Pol&iacute;tica de Calidad seleccionada ?</p>
					  		<input type="hidden" name="txtHiddenIdDPC" value=" "/>
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
				
				<div class="modal fade" id="modal-editar-detalle-politica" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-md">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Editar Detalle Pol&iacute;tica Interna de Calidad</h4>
					  </div>
					  <div class="modal-body">
					  	<form class="form-horizontal" role="form" method="post" id="formEditar" name="formEditar" action="DetallePoliticaCalidadServlet">
					  		<div class="form-group">
					        	<label for="lbl01" class="col-sm-3 control-label" id=lbl01>C&oacute;digo Pol&iacute;tica:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtcodpolitica2" name="txtcodpolitica2" disabled>
					            </div>
					        	<label for="lbl04" class="col-sm-3 control-label" id=lbl04>Item nro.:</label>
					            <div class="col-sm-3">
					            	<input type="text" class="form-control" id="txtitem2" name="txtitem2" disabled>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl02" class="col-sm-3 control-label" id=lbl02>Nombre:</label>
					            <div class="col-sm-9">
					            	<input type="text" class="form-control" id="txtnombre2" name="txtnombre2" required autofocus>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl03>Descripci&oacute;n:</label>
					            <div class="col-sm-9">
					            	<textarea class="form-control" id="txtdescripcion2" name="txtdescripcion2" rows=5></textarea>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl04>Tipo:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txttipo2" name="txttipo2">
									  <option value="N">Normal</option>
									  <option value="C">Crítco</option>
									</select>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl03" class="col-sm-3 control-label" id=lbl05>Alerta:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txtalerta2" name="txtalerta2">
									  <option value="N">No</option>
									  <option value="S">Si</option>
									</select>
					            </div>
					        </div>
					        <input type="hidden" name="txtiddetallepolitica"  value=" "/>
					         <input type="hidden" name="txtidpolitica"  value=" "/>
					      <input type="hidden" name="txtaccion" value=" "/>
					        
					        <input type="hidden" name="txtaccion" value=" "/>
					        <div class="modal-footer">
					        	<button type="button" class="btn btn-primary" onclick="editar()">Grabar</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
	  <strong>Felicitaciones! </strong>El Detalle de la Politica de Calidad has sido eliminada.
	</div>
	
	<script>
		$("#lyMensajeOk").delay(1000).fadeTo(1000, 0);
	</script>
	<%
	}
	%>
	
	<script type="text/javascript">
		
		function insertar(idPolitica) { 
			$('input[name="txtaccion"] ').val('insertar');
			$('input[name="txtidpolitica"] ').val(idPolitica);
			$('form#formInsertar').submit();
		};
		
		function eliminar() { 
			$('input[name="txtaccion"] ').val('eliminar');
			$('form#formEliminar').submit();
		};
		
		function mostrarPoliticaEditar(pIdDPC, pIdPC, pNomPC, pDesPC, pTipPC, pAlePC) {
			$('input[name="txtitem2"] ').val(pIdDPC);
			$('input[name="txtiddetallepolitica"] ').val(pIdDPC);
			$('input[name="txtcodpolitica2"] ').val(pIdPC);
			$('input[name="txtidpolitica"] ').val(pIdPC);
			$('input[name="txtnombre2"] ').val(pNomPC);
			$('textarea[name="txtdescripcion2"] ').val(pDesPC);
			$('select[name="txttipo2"] ').val(pTipPC);
			int val_alerta = "N";
			if (pAlePC ==  "1")
				val_alerta ="S";
			$('select[name="txtalerta2"] ').val(val_alerta);
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
