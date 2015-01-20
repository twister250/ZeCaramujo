
<%@ page import="br.com.zecaramujo.hostel.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="born" title="${message(code: 'client.born.label', default: 'Born')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'client.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'client.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'client.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'client.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'client.lastName.label', default: 'Last Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "born")}</g:link></td>
					
						<td>${fieldValue(bean: clientInstance, field: "cpf")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
