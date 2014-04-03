
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
				<%--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
				<g:if test="${camaraInstance.favorito == true}">
					<li><g:link class="favorito" action="favorito" id="${camaraInstance.id}"><g:message code="Favorito OK"/></g:link></li>
				</g:if>
				<g:else>
    				<li><g:link class="favorito" action="favorito" id="${camaraInstance.id}"><g:message code="Favorito"/></g:link></li>
				</g:else>
				<%--<g:checkBox name="check" value="${camaraInstance.favorito}"/>--%>

			</ul>
		</div>
		<div id="show-camara" class="content scaffold-show" role="main">
			<h1><g:message code="Deputado" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
				
			<table>
			<tr>
			<td>
			</td>
			<td>
			</td>
			<td>
			</td>
			<td>
					<%--<span id="urlFoto-label" class="property-label"><g:message code="camara.urlFoto.label" default="Url Foto" /></span>
						<span class="property-value" aria-labelledby="urlFoto-label"><g:fieldValue bean="${camaraInstance}" field="urlFoto"/></span>--%>
						<g:img uri="${camaraInstance.urlFoto}"/>
			</td>
			<td width=80%>			
			<ol class="property-list camara">		
				

				<g:if test="${camaraInstance?.ide}">
				<li class="fieldcontain">
					<span id="ide-label" class="property-label"><g:message code="camara.ide.label" default="ID" /></span>
					
						<span class="property-value" aria-labelledby="ide-label"><g:fieldValue bean="${camaraInstance}" field="ide"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.nomeParlamentarAtual}">
				<li class="fieldcontain">
					<span id="nomeParlamentarAtual-label" class="property-label"><g:message code="camara.nomeParlamentarAtual.label" default="Nome Parlamentar" /></span>
					
						<span class="property-value" aria-labelledby="nomeParlamentarAtual-label"><g:fieldValue bean="${camaraInstance}" field="nomeParlamentarAtual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.nomeCivil}">
				<li class="fieldcontain">
					<span id="nomeCivil-label" class="property-label"><g:message code="camara.nomeCivil.label" default="Nome Civil" /></span>
					
						<span class="property-value" aria-labelledby="nomeCivil-label"><g:fieldValue bean="${camaraInstance}" field="nomeCivil"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.partido}">
				<li class="fieldcontain">
					<span id="partido-label" class="property-label"><g:message code="camara.partido.label" default="Partido" /></span>
					
						<span class="property-value" aria-labelledby="partido-label"><g:fieldValue bean="${camaraInstance}" field="partido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.ufRepresentacaoAtual}">
				<li class="fieldcontain">
					<span id="ufRepresentacaoAtual-label" class="property-label"><g:message code="camara.ufRepresentacaoAtual.label" default="UF" /></span>
					
						<span class="property-value" aria-labelledby="ufRepresentacaoAtual-label"><g:fieldValue bean="${camaraInstance}" field="ufRepresentacaoAtual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.condicao}">
				<li class="fieldcontain">
					<span id="condicao-label" class="property-label"><g:message code="camara.condicao.label" default="Condição" /></span>
					
						<span class="property-value" aria-labelledby="condicao-label"><g:fieldValue bean="${camaraInstance}" field="condicao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.dataNascimento}">
				<li class="fieldcontain">
					<span id="dataNascimento-label" class="property-label"><g:message code="camara.dataNascimento.label" default="Data Nascimento" /></span>
					
						<span class="property-value" aria-labelledby="dataNascimento-label"><g:fieldValue bean="${camaraInstance}" field="dataNascimento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="camara.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${camaraInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.fone}">
				<li class="fieldcontain">
					<span id="fone-label" class="property-label"><g:message code="camara.fone.label" default="Fone" /></span>
					
						<span class="property-value" aria-labelledby="fone-label"><g:fieldValue bean="${camaraInstance}" field="fone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="camara.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${camaraInstance}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.nomeProfissao}">
				<li class="fieldcontain">
					<span id="nomeProfissao-label" class="property-label"><g:message code="camara.nomeProfissao.label" default="Nome Profissão" /></span>
					
						<span class="property-value" aria-labelledby="nomeProfissao-label"><g:fieldValue bean="${camaraInstance}" field="nomeProfissao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camaraInstance?.numLegislatura}">
				<li class="fieldcontain">
					<span id="numLegislatura-label" class="property-label"><g:message code="camara.numLegislatura.label" default="Num Legislatura" /></span>
					
						<span class="property-value" aria-labelledby="numLegislatura-label"><g:fieldValue bean="${camaraInstance}" field="numLegislatura"/></span>
					
				</li>
				</g:if>
			
			</ol>
			</td>
			</tr>
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${camaraInstance?.id}" />
					<%--<g:link class="edit" action="edit" id="${camaraInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--%>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
