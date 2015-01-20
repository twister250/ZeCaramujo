<%@ page import="br.com.zecaramujo.hostel.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'born', 'error')} required">
	<label for="born">
		<g:message code="client.born.label" default="Born" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="born" precision="day"  value="${clientInstance?.born}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="client.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${clientInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${clientInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="client.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${clientInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="client.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gender" required="" value="${clientInstance?.gender}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="client.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${clientInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'phone1', 'error')} required">
	<label for="phone1">
		<g:message code="client.phone1.label" default="Phone1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone1" required="" value="${clientInstance?.phone1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'phone2', 'error')} required">
	<label for="phone2">
		<g:message code="client.phone2.label" default="Phone2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone2" required="" value="${clientInstance?.phone2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="client.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" required="" value="${clientInstance?.rg}"/>

</div>

