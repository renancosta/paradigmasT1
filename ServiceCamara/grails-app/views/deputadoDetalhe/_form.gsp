<%@ page import="servicecamara.DeputadoDetalhe" %>



<div class="fieldcontain ${hasErrors(bean: deputadoDetalheInstance, field: 'deputado', 'error')} required">
	<label for="deputado">
		<g:message code="deputadoDetalhe.deputado.label" default="Deputado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deputado" name="deputado.id" from="${servicecamara.Camara.list()}" optionKey="id" required="" value="${deputadoDetalheInstance?.deputado?.id}" class="many-to-one"/>
</div>

