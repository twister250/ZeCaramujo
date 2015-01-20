<%@ page import="br.com.zecaramujo.hostel.Image" %>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="image.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'description', 'error')}">
	<label for="description">
		<g:message code="image.description.label" default="Description" />
	</label>
	<g:textField name="description" value="${imageInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'published', 'error')} ">
	<label for="published">
		<g:message code="article.published.label" default="Published" />		
	</label>
	<g:checkBox name="published" value="${imageInstance?.published}" />
</div>