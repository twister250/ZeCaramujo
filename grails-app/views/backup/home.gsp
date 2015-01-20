<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="site">		
		<title>Zé Caramujo Hostel</title>
	</head>
	<body>		
		<div class="nav" role="navigation">
			<g:img file="zecaramujo70.png" class="img70"/>
			<ul>
				<li><a class="menu-button" href="${createLink(uri: '/')}">Home</a></li>
				<!--<li><a class="menu-button" href="">Reservas</a></li>-->
				<li><g:link controller="booking">Reservas</g:link></li>				
				<li><g:link controller="booking">Hostel</g:link></li>
				<li><g:link controller="booking">Bar</g:link></li>
				<li><g:link controller="booking">Fotos</g:link></li>
				<li><g:link controller="booking">Vídeos</g:link></li>
				<li><g:link controller="booking">Blog</g:link></li>
				<li><g:link controller="booking">Contato</g:link></li>
				<li><g:link controller="booking">Locais</g:link></li>
			</ul>
		</div>
		<div id="list-test" class="content scaffold-list" role="main">
			<%--
			<h1>Zé Caramujo Hostel</h1>			
			<img src="/zecaramujo/images/zecaramujo350.png"/>
			--%>
			
			<div id="slider">
				<figure>					
					<img src="/zecaramujo/images/test/surf2.jpg" alt/>
					<img src="/zecaramujo/images/test/surf3.jpg" alt/>
					<img src="/zecaramujo/images/test/surf4.jpg" alt/>
					<img src="/zecaramujo/images/test/surf2.jpg" alt/>
				</figure>
			</div>
			
		</div>
	</body>
</html>