
<%@ page import="servicecamara.DeputadoDetalhe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deputadoDetalhe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<%-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> --%>
			</ul>
		</div>
		<div id="show-deputadoDetalhe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deputadoDetalhe">
			
				<g:if test="${deputadoDetalheInstance?.deputado}">
				<li class="fieldcontain">
					<span id="deputado-label" class="property-label"><g:message code="deputadoDetalhe.deputado.label" default="Deputado" /></span>
					
						<span class="property-value" aria-labelledby="deputado-label"><g:link controller="camara" action="show" id="${deputadoDetalheInstance?.deputado?.id}">${deputadoDetalheInstance?.deputado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<table>
			<tr>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
					<%--<span id="urlFoto-label" class="property-label"><g:message code="deputadoDetalhe.deputado.urlFoto.label" default="Url Foto" /></span>
						<span class="property-value" aria-labelledby="urlFoto-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="urlFoto"/></span>--%>
						<g:img uri="${deputadoDetalheInstance.deputado.urlFoto}"/>
			</td>
			<td width=80%>			
			<ol class="property-list camara">		
				

				<g:if test="${deputadoDetalheInstance?.deputado?.ide}">
				<li class="fieldcontain">
					<span id="ide-label" class="property-label"><g:message code="deputadoDetalhe.deputado.ide.label" default="ID" /></span>
					
						<span class="property-value" aria-labelledby="ide-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="ide"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.nomeParlamentarAtual}">
				<li class="fieldcontain">
					<span id="nomeParlamentarAtual-label" class="property-label"><g:message code="deputadoDetalhe.deputado.nomeParlamentarAtual.label" default="Nome Parlamentar" /></span>
					
						<span class="property-value" aria-labelledby="nomeParlamentarAtual-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="nomeParlamentarAtual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.nomeCivil}">
				<li class="fieldcontain">
					<span id="nomeCivil-label" class="property-label"><g:message code="deputadoDetalhe.deputado.nomeCivil.label" default="Nome Civil" /></span>
					
						<span class="property-value" aria-labelledby="nomeCivil-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="nomeCivil"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.partido}">
				<li class="fieldcontain">
					<span id="partido-label" class="property-label"><g:message code="deputadoDetalhe.deputado.partido.label" default="Partido" /></span>
					
						<span class="property-value" aria-labelledby="partido-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="partido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.ufRepresentacaoAtual}">
				<li class="fieldcontain">
					<span id="ufRepresentacaoAtual-label" class="property-label"><g:message code="deputadoDetalhe.deputado.ufRepresentacaoAtual.label" default="UF" /></span>
					
						<span class="property-value" aria-labelledby="ufRepresentacaoAtual-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="ufRepresentacaoAtual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.condicao}">
				<li class="fieldcontain">
					<span id="condicao-label" class="property-label"><g:message code="deputadoDetalhe.deputado.condicao.label" default="Condição" /></span>
					
						<span class="property-value" aria-labelledby="condicao-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="condicao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.dataNascimento}">
				<li class="fieldcontain">
					<span id="dataNascimento-label" class="property-label"><g:message code="deputadoDetalhe.deputado.dataNascimento.label" default="Data Nascimento" /></span>
					
						<span class="property-value" aria-labelledby="dataNascimento-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="dataNascimento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="deputadoDetalhe.deputado.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.fone}">
				<li class="fieldcontain">
					<span id="fone-label" class="property-label"><g:message code="deputadoDetalhe.deputado.fone.label" default="Fone" /></span>
					
						<span class="property-value" aria-labelledby="fone-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="fone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="deputadoDetalhe.deputado.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.nomeProfissao}">
				<li class="fieldcontain">
					<span id="nomeProfissao-label" class="property-label"><g:message code="deputadoDetalhe.deputado.nomeProfissao.label" default="Nome Profissão" /></span>
					
						<span class="property-value" aria-labelledby="nomeProfissao-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="nomeProfissao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deputadoDetalheInstance?.deputado?.numLegislatura}">
				<li class="fieldcontain">
					<span id="numLegislatura-label" class="property-label"><g:message code="deputadoDetalhe.deputado.numLegislatura.label" default="Num Legislatura" /></span>
					
						<span class="property-value" aria-labelledby="numLegislatura-label"><g:fieldValue bean="${deputadoDetalheInstance.deputado}" field="numLegislatura"/></span>
					
				</li>
				</g:if>
			
			</ol>
			</td>
			</tr>
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deputadoDetalheInstance?.id}" />
					<%--<g:link class="edit" action="edit" id="${deputadoDetalheInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--%>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
