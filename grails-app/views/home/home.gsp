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
		<div class="gallery autoplay items-${imageCount}">
			<g:each in="${images}" status="i" var="imageInstance">
				<div id="item-${i}" class="control-operator"></div>
				<figure class="item">
					<img src="${createLink(controller: 'image', action:'displayImage', id: imageInstance.id, params: [type: 'image'])}"/>
				</figure>
			</g:each>
			<div class="controls">
				<g:each in="${images}" status="i" var="imageInstance">
					<a href="#item-${i}" class="control-button">•</a>
				</g:each>
			</div>
		</div>
	</body>
</html>