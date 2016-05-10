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
				<label class="col-sm-2 control-label" for="lbldesc" id="lbldesc">Descripci&acute;n Plan:</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="txtdescrip" name="txtdescrip" rows=3></textarea>
				</div>
			</div>
			
			<input type="hidden" name="txtaccion" value=" "/>
			<div class="row form-group">
				<label class="col-sm-3 control-label" for="lbltitulo1" id="lbltitulo1">Pol&iacute;ticas Internas de Calidad:</label>
				<div class="col-sm-offset-6 col-sm-3">
					<input type="button" value="Asignar Políticas de Calidad" class="btn btn-primary" data-toggle="modal" data-target="#modal-crear-politica" />
				</div>
			</div>
			
			<div class="row">
		   		<div class="col-md-12">
		   			<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>C&oacute;digo</th>
							<th>Pol&iacute;tica de Calidad</th>
							<th>Año</th>
							<th>Descripci&oacute;</th>
							<th>Acciones</th>
						</tr>
					</table>
					</div>
				</div>
			</div>
			
			<div class="row form-group">
				<label class="col-sm-3 control-label" for="lbltitulo2" id="lbltitulo2">Lista de Inspecciones a realizar:</label>
				<div class="col-sm-offset-6 col-sm-3">
					<input type="button" value="Agregar Inspección" class="btn btn-primary" data-toggle="modal" data-target="#modal-crear-politica" />
				</div>
			</div>
			
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
	</div>
		
    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>
</body>
</html>