<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es-419">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Pagina de Registro de Plan de Trabajo Anual del Modulo de Calidad">
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
			<li class="active">Registrar Plan de Trabajo Anual</li>
		</ol>

		<div class="page-header">
			<h2>Registrar Plan de Trabajo Anual</h2>
		</div>
		
		<form role="form" method="post" id="formPlan" name="formPlan" action="RegistrarPlanAnualServlet" >
			
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="lblanio" id="lblanio">Año Vigencia:</label>
				<div class="col-sm-2">
					<input type="number" name="txtanio" id="txtanio" class="form-control" value="2016" />
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="lbldesc" id="lbldesc">Descripci&oacute;n Plan:</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="txtdescrip" name="txtdescrip" rows=2></textarea>
				</div>
			</div>
			
			<input type="hidden" name="txtaccion" value=" "/>
			
			<!-- Inicio del Panel de Politicas de Calidad -->			
			<div class="panel-group">
			<div class="panel panel-info">
			<div class="panel-heading clearfix">
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#modal-asignar-politicas">
					<span class="glyphicon glyphicon-check" aria-hidden="true"></span> Asignar Pol&iacute;ticas de Calidad
				</button>
				<h3 class="panel-title" style="padding-top: 7.5px;">
			    	<a data-toggle="collapse" href="#collapse1">Pol&iacute;ticas Internas de Calidad</a>
			    </h3>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
			<div class="panel-body">
			
			<div class="row">
		   		<div class="col-md-12">
		   			<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover" id="tblPCAsignadas">
						<tr>
							<th>C&oacute;digo</th>
							<th>Pol&iacute;tica de Calidad</th>
							<th>Año</th>
							<th>Descripci&oacute;n</th>
							<th>Acciones</th>
						</tr>
					</table>
					</div>
				</div>
			</div>
			
			</div></div></div></div>
			<!-- Fin del Panel de Politicas de Calidad -->
			
			<!-- Inicio del Panel de Inspecciones -->			
			<div class="panel-group">
			<div class="panel panel-info">
			<div class="panel-heading clearfix">
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#modal-agregar-inspeccion">
					<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Agregar Inspecci&oacute;n
				</button>
				<h3 class="panel-title" style="padding-top: 7.5px;">
			    	<a data-toggle="collapse" href="#collapse2">Inspecciones a realizar</a>
			    </h3>
			</div>
			<div id="collapse2" class="panel-collapse collapse in">
			<div class="panel-body">
			
			<div class="row">
		   		<div class="col-md-12">
		   			<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover" id="tblInspecciones">
						<tr>
							<th># Item</th>
							<th>Fecha Inspecci&oacute;n</th>
							<th>Local Inspecci&oacute;n</th>
							<th>Tipo Inspecci&oacute;n</th>
							<th>Responsable</th>
							<th>Observaciones</th>
							<th>Acciones</th>
						</tr>
					</table>
					</div>
				</div>
			</div>
			
			</div></div></div></div>
			<!-- Fin del Panel de Inspecciones -->
			
			<div class="row form-group">
				<div class="col-md-offset-10 col-md-2">
					<button type="button" class="btn btn-primary btn-block" onclick="grabarPlanAnual()">
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span> Grabar
					</button>
				</div>
			</div>
		</form>
		
		<div class="modal fade" id="modal-asignar-politicas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Asignar Pol&iacute;ticas Internas de Calidad</h4>
					</div>
					<div class="modal-body">
					  	<p>Seleccione las Pol&iacute;ticas Internas de Calidad que desee asignar al Plan Anual:</p>
					  	
					  	<div class="row">
		   					<div class="col-md-12">
		   						<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="tblPoliticas">
										<tr>
											<th>C&oacute;digo</th>
											<th>Pol&iacute;tica de Calidad</th>
											<th>Año</th>
											<th>Descripci&oacute;n</th>
											<th></th>
										</tr>
										<%@page import="java.util.ArrayList, plazavea.calidad.modelo.PoliticaCalidad, plazavea.calidad.modelo.Local, plazavea.calidad.modelo.Empleado"%>
										<%
											ArrayList<PoliticaCalidad> pcalidad = (ArrayList<PoliticaCalidad>) request.getAttribute("POLITICAS_ACTIVAS");
											
											if (pcalidad != null) {
												for (PoliticaCalidad x : pcalidad) {							
													out.println("<tr id='trP" + x.getIdPolitica() + "'>");
													out.println("<td align='center'>" + x.getIdPolitica() + "</td>");
													out.println("<td>" + x.getNombre() + "</td>");
													out.println("<td align='center'>" + x.getAnio() + "</td>");
													out.println("<td>" + x.getDescripcion() + "</td>");
													//out.println("<td align='center'><input type='checkbox' name='asigna1' value=''></td>");
													out.println("<td align='center'><button type='button' class='btn btn-primary' onclick='asignarPolitica(" + x.getIdPolitica() + ",\"" + x.getNombre() + "\",\"" + x.getAnio() + "\",\"" + x.getDescripcion() + "\")'>Asignar</button></td>");
													out.println("</tr>");
												}
											} 	
										%>
									</table>
					 			</div>
					 		</div>
					 	</div>
					  	
					    <div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="modal-agregar-inspeccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Agregar Inspecci&oacute;n de Calidad</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form" method="post" id="formInspeccion" name="formInspeccion" action="RegistrarPlanAnualServlet">
					  		<div class="form-group">
					        	<label for="lbl01" class="col-sm-3 control-label" id=lbl01>Fecha Inspecci&oacute;n:</label>
					        	<div class='col-sm-3 input-group date' id='dtpfechaInspeccion'>
				                    <input type='text' class="form-control" id="txtfechaInspeccion" name="txtfechaInspeccion" />
				                    <span class="input-group-addon">
				                        <span class="glyphicon glyphicon-calendar"></span>
				                    </span>
				                </div>
					        </div>
					        <div class="form-group">
					        	<label for="lbl02" class="col-sm-3 control-label" id=lbl02>Local de Inspecci&oacute;n:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txtlocal" name="txtlocal" required>
				            	  		<option value="" disabled selected>Seleccione un Local</option>
						            	  <%
											ArrayList<Local> locales= (ArrayList<Local>)request.getAttribute("LISTA_LOCALES");
											
						            	    if(locales!= null){
												for(Local item : locales){
											%>
											<option value="<%=item.getIdLocal()%>"><%=item.getNombre() %></option>
											<%
												}
											}
										   %>
									</select>
					            </div>
					        </div>
					        <div class="form-group">
					        	<label for="lbl03" class="col-sm-3 control-label" id=lbl03>Tipo de Inspecci&oacute;n:</label>
					            <div class="col-sm-5">
					            	<select class="form-control" id="txttipoinsp" name="txttipoinsp" required>
				            	  		<option value="0" selected>Todo el Local</option>
				            	  		<option value="1" >En Tienda</option>
				            	  		<option value="2" >En Almac&eacute;n</option>
									</select>
					            </div>
					        </div>
					        <div class="form-group">
					        	<label for="lbl04" class="col-sm-3 control-label" id=lbl04>Responsable:</label>
					            <div class="col-sm-9">
					            	<select class="form-control" id="txtresponsable" name="txtresponsable" required>
				            	  		<option value="" disabled selected>Seleccione un Inspector responsable</option>
						            	  <%
											ArrayList<Empleado> resp= (ArrayList<Empleado>)request.getAttribute("LISTA_EMPLEADOS");
											
						            	    if(resp!= null){
												for(Empleado item : resp){
											%>
											<option value="<%=item.getIdEmpleado()%>"><%=item.getNombreCompleto() %></option>
											<%
												}
											}
										   	%>
									</select>
					            </div>
					        </div>
					        <div class="form-group">
					            <label for="lbl05" class="col-sm-3 control-label" id=lbl05>Observaciones:</label>
					            <div class="col-sm-9">
					            	<textarea class="form-control" id="txtobserva" name="txtobserva" rows=3></textarea>
					            </div>
					        </div>
					        
					        <input type="hidden" name="txtaccion" value=" "/>
					        <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
								<button type="button" class="btn btn-primary" onclick="agregarInspeccion()">Aceptar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
    
    <script type="text/javascript">
    	var nroItem = 0;
    	
		function asignarPolitica(pIdPC, pNomPC, pAnioPC, pDesPC){
			//alert(pIdPC + " " + pNomPC + " " + pAnioPC + " " + pDesPC);
			var idTR = "id='trA" + pIdPC + "'"
			var centrado = "align='center'"
			var botones = "<td align='center' style='width: 160px'><a href='DetallePoliticaCalidadServlet?idPolitica=" + pIdPC + " ' class='btn btn-info'>Ver</a> <a href='#' class='btn btn-danger' onclick='removerPolitica(" + pIdPC + ",\"" + pNomPC + "\",\"" + pAnioPC + "\",\"" + pDesPC + "\")'>Remover</a></td>";
			$('#tblPCAsignadas tr:last').after('<tr ' + idTR + '><td ' + centrado + '>' + pIdPC  + '<input type="hidden" name="t_idpc" id="t_idpc" value="'+ pIdPC +'"></td><td>' + pNomPC  + '</td><td ' + centrado + '>' + pAnioPC  + '</td><td>' + pDesPC  + '</td>' + botones + '</tr>');
			$('#trP' + pIdPC).remove();
			$("#tblPCAsignadas").sortTable("number", {column: 1, reverse: false});
		}
		
		function removerPolitica(pIdPC, pNomPC, pAnioPC, pDesPC){
			//alert(pIdPC + " " + pNomPC + " " + pAnioPC + " " + pDesPC);
			var idTR = "id='trP" + pIdPC + "'"
			var botones = "<td align='center'><button type='button' class='btn btn-primary' onclick='asignarPolitica(" + pIdPC + ",\"" + pNomPC + "\",\"" + pAnioPC + "\",\"" + pDesPC + "\")'>Asignar</button></td>";
			var centrado = "align='center'"
			$('#tblPoliticas tr:last').after('<tr ' + idTR + '><td ' + centrado + ' >' + pIdPC  + '</td><td>' + pNomPC  + '</td><td ' + centrado + ' >' + pAnioPC  + '</td><td>' + pDesPC  + '</td>' + botones + '</tr>');
			$('#trA' + pIdPC).remove();
			$("#tblPoliticas").sortTable("number", {column: 1, reverse: false});
		}
		
		function agregarInspeccion(){
			//alert(pIdPC + " " + pNomPC + " " + pAnioPC + " " + pDesPC);
			var fechaInsp = $('#txtfechaInspeccion').val();
			var local = $("#txtlocal option:selected").text();
			var idlocal = $("#txtlocal option:selected").val();
			var tipoInsp = $("#txttipoinsp option:selected").text();
			var idtipoInsp = $("#txttipoinsp option:selected").val();
			var respo = $("#txtresponsable option:selected").text();
			var idrespo = $("#txtresponsable option:selected").val();
			var observa = $('#txtobserva').val();
			
			//alert(idlocal + " " + local);
			
			nroItem++;
			var idINSP = "id='trI" + nroItem + "'"
			
			var centrado = "align='center'"
			var botones = "<td align='center' style='width: 180px'><a href='#' class='btn btn-warning'>Editar</a> <a href='#' class='btn btn-danger' onclick='eliminarInspeccion(" + nroItem + ")'>Eliminar</a></td>";
			$('#tblInspecciones tr:last').after('<tr ' + idINSP + '><td ' + centrado + '>' + nroItem + '<input type="hidden" name="t_item" id="t_item" value="'+ nroItem +'"></td><td ' + centrado + '>' + fechaInsp  + '<input type="hidden" name="t_fecinsp" id="t_fecinsp" value="'+ fechaInsp +'"></td><td>' + local  + '<input type="hidden" name="t_local" id="t_local" value="'+ idlocal +'"></td><td>' + tipoInsp  + '<input type="hidden" name="t_tipinsp" id="t_tipinsp" value="'+ idtipoInsp +'"></td><td>' + respo  + '<input type="hidden" name="t_respo" id="t_respo" value="'+ idrespo +'"></td><td>' + observa  + '<input type="hidden" name="t_observa" id="t_observa" value="'+ observa +'"></td>' + botones + '</tr>');
			limpiarDatosInspeccion();
		}
		
		function eliminarInspeccion(pItem) {
			$('#trI' + pItem).remove();
		}
		
		function limpiarDatosInspeccion() {
			$('input[name="txtfechaInspeccion"] ').val('');
			$('#txtlocal').val('');
			$('#txttipoinsp').val('0');
			$('#txtresponsable').val('');
			$('#txtobserva').val('');
		}
		
		function grabarPlanAnual() {
			bootbox.alert("El Plan Anual se grabó correctamente.", function() {
				$('form#formPlan').submit();	
			});
		}
	</script>
	<script type="text/javascript">
        $(function () {
        	$('#dtpfechaInspeccion').datetimepicker({
        		format: 'DD/MM/YYYY'
        	});
        });
    </script>
</body>
</html>