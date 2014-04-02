
<%@ page import="servicecamara.Camara" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camara.label', default: 'Camara')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-camara" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<!–Adicionando um botão, com uma action search, que fará um get retornandoos atributos de classe de domínio cadastrados.–>
				<li><span class="menuButton">
					<g:form action="search" method="get" style="display: inline;">
					<g:textField name="q" value="${params.q}"/>
					<g:submitButton name="Buscar"/>
				</g:form></li>
			</ul>
		</div>
		<div id="list-camara" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nomeParlamentarAtual" title="${message(code: 'camara.nomeParlamentarAtual.label', default: 'Nome Parlamentar Atual')}" />
					
						<g:sortableColumn property="numLegislatura" title="${message(code: 'camara.numLegislatura.label', default: 'Num Legislatura')}" />
					
						<g:sortableColumn property="dataNascimento" title="${message(code: 'camara.dataNascimento.label', default: 'Data Nascimento')}" />
					
						<g:sortableColumn property="nomeCivil" title="${message(code: 'camara.nomeCivil.label', default: 'Nome Civil')}" />
					
						<g:sortableColumn property="nomeProfissao" title="${message(code: 'camara.nomeProfissao.label', default: 'Nome Profissao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${camaraInstanceList}" status="i" var="camaraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${camaraInstance.id}">${fieldValue(bean: camaraInstance, field: "nomeParlamentarAtual")}</g:link></td>
					
						<td>${fieldValue(bean: camaraInstance, field: "numLegislatura")}</td>
					
						<td>${fieldValue(bean: camaraInstance, field: "dataNascimento")}</td>
					
						<td>${fieldValue(bean: camaraInstance, field: "nomeCivil")}</td>
					
						<td>${fieldValue(bean: camaraInstance, field: "nomeProfissao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${camaraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
