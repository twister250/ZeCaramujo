<%@ page import="br.com.zecaramujo.hostel.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="site">
		<g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="image/image.js"/>
	</head>
	<body>
		<a href="#list-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-image" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="image" title="${message(code: 'image.image.label', default: 'Image')}" />
						<th>File</th>
						<th>Width</th>
						<th>Height</th>
						<th>Published</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${imageInstanceList}" status="i" var="imageInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								<g:link action="show" id="${imageInstance.id}">
									<img src="${createLink(controller: 'image', action:'displayImage', id: imageInstance.id, params: [type: 'thumb'])}"/>
								</g:link>
							</td>
							<td>${imageInstance.originalFilename}</td>
							<td>${imageInstance.width}</td>
							<td>${imageInstance.height}</td>							
							<td>
								<g:checkBox 
									id="image${imageInstance.id}"
									name="published" value="${imageInstance.published}"									
									onchange="${remoteFunction(action: 'publish', id: imageInstance.id)}"
								/>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate next="Próximo" prev="Anterior" total="${imageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>