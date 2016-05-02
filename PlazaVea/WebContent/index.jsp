<!DOCTYPE html>
<html lang="es-419">
<head>
	<meta charset="utf-8" />
	<meta name="description" content="Pagina inicial del Modulo de Calidad del Sistema de Supermercados">
	<meta name="author" content="Ivan Baraybar Delgado">
	
	<%@include file="include/header.jsp" %> 	
</head>

<body>
 	<%@include file="include/menu.jsp" %>

<div class="container">
	<div class="hero-unit">
    	<h2><strong>M&oacute;dulo de Gesti&oacute;n de Calidad</strong></h2><br>
    </div>
<section>
	<div id="carrusel_principal" class="carousel slide">
	
	  <!-- Carousel items -->
	  <div class="carousel-inner">
		<div class="active item" align="center">
		<img src="img/plazavea1.jpg" width="900"/>
			
		</div>
		<div class="item" align="center">
			<img src="img/plazavea2.jpg"  width="900"/>		
		</div>
	  </div>
	  <!-- Carousel nav -->
	  <a class="carousel-control left" href="#carrusel_principal" data-slide="prev">&lsaquo;</a>
	  <a class="carousel-control right" href="#carrusel_principal" data-slide="next">&rsaquo;</a>
	</div>
</section>

</div>

<div id="footer">
        Todos los Derechos Reservados 2016
    </div>

	<script>
	$('#ventana_modal').modal( {
		keyboard : true,
		show : false,
		backdrop : 'static'		
	} );
	
	 $(function () {
		$('#menuTab a:last').tab('show');
	 });

	$('#carrusel_principal').carousel({
		interval : 2000
	});
	
	</script>
</body>
</html>