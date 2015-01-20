
<%@ page import="br.com.zecaramujo.hostel.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.born}">
				<li class="fieldcontain">
					<span id="born-label" class="property-label"><g:message code="client.born.label" default="Born" /></span>
					
						<span class="property-value" aria-labelledby="born-label"><g:formatDate date="${clientInstance?.born}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="client.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${clientInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="client.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="client.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${clientInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="client.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${clientInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="client.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${clientInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.phone1}">
				<li class="fieldcontain">
					<span id="phone1-label" class="property-label"><g:message code="client.phone1.label" default="Phone1" /></span>
					
						<span class="property-value" aria-labelledby="phone1-label"><g:fieldValue bean="${clientInstance}" field="phone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.phone2}">
				<li class="fieldcontain">
					<span id="phone2-label" class="property-label"><g:message code="client.phone2.label" default="Phone2" /></span>
					
						<span class="property-value" aria-labelledby="phone2-label"><g:fieldValue bean="${clientInstance}" field="phone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="client.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${clientInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clientInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
