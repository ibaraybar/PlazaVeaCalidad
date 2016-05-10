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
		
		<form role="form" method="post" id="formPlan" name="formPlan" action="PlanAnualServlet" >
			
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
			<br>
			<input type="hidden" name="txtaccion" value=" "/>
			
			<!-- Inicio del Panel de Politicas de Calidad -->			
			<div class="panel-group">
			<div class="panel panel-info">
			<div class="panel-heading clearfix">
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#modal-crear-politica">
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
					<table class="table table-striped table-bordered table-hover">
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
			
			<br>
			<!-- Inicio del Panel de Inspecciones -->			
			<div class="panel-group">
			<div class="panel panel-info">
			<div class="panel-heading clearfix">
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#modal-crear-politica">
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
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th># Item</th>
							<th>Fecha Inspecci&oacute;n</th>
							<th>Local Inspecci&oacute;n</th>
							<th>Tipo Inspecci&oacute;n</th>
							<th>Responsable</th>
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
					<button type="button" class="btn btn-primary btn-block" onclick="buscar()">
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span> Grabar
					</button>
				</div>
			</div>
		</form>
	</div>
		
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
</body>
</html>