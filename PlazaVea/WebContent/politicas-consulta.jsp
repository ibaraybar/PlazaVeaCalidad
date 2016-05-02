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

	<div class="container-fluid">
        	
		<!-- Inicio del contenido -->
		<div class="page-header">
			<h2>Pol&iacute;ticas Internas de Calidad</h2>
			Criterios de B&uacute;squeda
		</div>

		<form>
			<div class="row form-group">
				<label for="numero" class="col-sm-2 control-label">Nro de Ticket</label>
				<div class="col-sm-10">
					<input type="text" name="numero" class="form-control" />
				</div>
			</div>
			
			<div class="row form-group">
				<label for="fecha" class="col-sm-2 control-label">Fecha de asignación</label>
				<div class="col-sm-10">
					<input type="text" name="fecha" class="form-control" />
				</div>
			</div>
			
			<div class="row form-group">
				<div class="col-sm-2">
					
				</div>
				<div class="col-sm-10">
					<input type="submit" value="Grabar Documento" class="btn btn-primary" />
				</div>
			</div>
		</form>
		
		<hr/>
		
		<div class="table-responsive">
			<table class="table table-hover">
				<colgroup>
					<col width="100"/>
					<col />
					<col />
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<td>Número</td>
						<td>Nombre</td>
						<td>Correo</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>MD-1481</td>
						<td>Jorge Bernardo</td>
						<td>jbernardo@gmail.com</td>
						<td><a href="#" class="btn btn-info">Mostrar</a></td>
						<td><a href="#" class="btn btn-warning">Editar</a></td>
						<td><a href="#" class="btn btn-danger">Eliminar</a></td>
					</tr>
					<tr>
						<td>MD-1481</td>
						<td>Jorge Bernardo</td>
						<td>jbernardo@gmail.com</td>
						<td><a href="#" class="btn btn-info">Mostrar</a></td>
						<td><a href="#" class="btn btn-warning">Editar</a></td>
						<td><a href="#" class="btn btn-danger">Eliminar</a></td>
					</tr>
					<tr>
						<td>MD-1481</td>
						<td>Jorge Bernardo</td>
						<td>jbernardo@gmail.com</td>
						<td><a href="#" class="btn btn-info">Mostrar</a></td>
						<td><a href="#" class="btn btn-warning">Editar</a></td>
						<td><a href="#" class="btn btn-danger">Eliminar</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<hr/>
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-ejemplo-1">
			Ejemplo de ventana modal
		</button>

		<!-- Modal -->
		<div class="modal fade" id="modal-ejemplo-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Título del Modal</h4>
			  </div>
			  <div class="modal-body">
			  
				Algún contneido ...
				
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				<button type="button" class="btn btn-primary">Aceptar</button>
			  </div>
			</div>
		  </div>
		</div>
		
		<!-- Fin de contenido -->
			
			
    </div>

    <div id="footer">
        Todos los Derechos Reservados 2016
    </div>

    <div id="modal-alert" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Advertencia</h4>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
