
<%@ page import="servicecamara.Camara" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camara.label', default: 'Camara')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-camara" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-camara" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list camara">
			
				<g:if test="${camaraInstance?.nomeParlamentarAtual}">
				<li class="fieldcontain">
					<span id="nomeParlamentarAtual-label" class="property-label"><g:message code="camara.nomeParlamentarAtual.label" default="Nome Parlamentar Atual" /></span>
					
						<span class="property-value" aria-labelledby="nomeParlamentarAtual-label"><g:fieldValue bean="${camaraInstance}" field="nomeParlamentarAtual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.numLegislatura}">
				<li class="fieldcontain">
					<span id="numLegislatura-label" class="property-label"><g:message code="camara.numLegislatura.label" default="Num Legislatura" /></span>
					
						<span class="property-value" aria-labelledby="numLegislatura-label"><g:fieldValue bean="${camaraInstance}" field="numLegislatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.dataNascimento}">
				<li class="fieldcontain">
					<span id="dataNascimento-label" class="property-label"><g:message code="camara.dataNascimento.label" default="Data Nascimento" /></span>
					
						<span class="property-value" aria-labelledby="dataNascimento-label"><g:fieldValue bean="${camaraInstance}" field="dataNascimento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.nomeCivil}">
				<li class="fieldcontain">
					<span id="nomeCivil-label" class="property-label"><g:message code="camara.nomeCivil.label" default="Nome Civil" /></span>
					
						<span class="property-value" aria-labelledby="nomeCivil-label"><g:fieldValue bean="${camaraInstance}" field="nomeCivil"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.nomeProfissao}">
				<li class="fieldcontain">
					<span id="nomeProfissao-label" class="property-label"><g:message code="camara.nomeProfissao.label" default="Nome Profissao" /></span>
					
						<span class="property-value" aria-labelledby="nomeProfissao-label"><g:fieldValue bean="${camaraInstance}" field="nomeProfissao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${camaraInstance?.id}" />
					<g:link class="edit" action="edit" id="${camaraInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
