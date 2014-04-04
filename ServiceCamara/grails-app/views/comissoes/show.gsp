
<%@ page import="servicecamara.Comissoes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comissoes.label', default: 'Comissoes')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comissoes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comissoes" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comissoes">
			
				<g:if test="${comissoesInstance?.siglaComissao}">
				<li class="fieldcontain">
					<span id="siglaComissao-label" class="property-label"><g:message code="comissoes.siglaComissao.label" default="Sigla Comissao" /></span>
					
						<span class="property-value" aria-labelledby="siglaComissao-label"><g:fieldValue bean="${comissoesInstance}" field="siglaComissao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comissoesInstance?.nomeComissao}">
				<li class="fieldcontain">
					<span id="nomeComissao-label" class="property-label"><g:message code="comissoes.nomeComissao.label" default="Nome Comissao" /></span>
					
						<span class="property-value" aria-labelledby="nomeComissao-label"><g:fieldValue bean="${comissoesInstance}" field="nomeComissao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comissoesInstance?.condicaoMembro}">
				<li class="fieldcontain">
					<span id="condicaoMembro-label" class="property-label"><g:message code="comissoes.condicaoMembro.label" default="Condicao Membro" /></span>
					
						<span class="property-value" aria-labelledby="condicaoMembro-label"><g:fieldValue bean="${comissoesInstance}" field="condicaoMembro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comissoesInstance?.dataEntrada}">
				<li class="fieldcontain">
					<span id="dataEntrada-label" class="property-label"><g:message code="comissoes.dataEntrada.label" default="Data Entrada" /></span>
					
						<span class="property-value" aria-labelledby="dataEntrada-label"><g:fieldValue bean="${comissoesInstance}" field="dataEntrada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comissoesInstance?.dataSaida}">
				<li class="fieldcontain">
					<span id="dataSaida-label" class="property-label"><g:message code="comissoes.dataSaida.label" default="Data Saida" /></span>
					
						<span class="property-value" aria-labelledby="dataSaida-label"><g:fieldValue bean="${comissoesInstance}" field="dataSaida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comissoesInstance?.dep}">
				<li class="fieldcontain">
					<span id="dep-label" class="property-label"><g:message code="comissoes.dep.label" default="Dep" /></span>
					
						<span class="property-value" aria-labelledby="dep-label"><g:link controller="deputadoDetalhe" action="show" id="${comissoesInstance?.dep?.id}">${comissoesInstance?.dep?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${comissoesInstance?.id}" />
					<g:link class="edit" action="edit" id="${comissoesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
