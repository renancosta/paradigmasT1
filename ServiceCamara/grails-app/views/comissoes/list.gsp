
<%@ page import="servicecamara.Comissoes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comissoes.label', default: 'Comissoes')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comissoes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comissoes" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siglaComissao" title="${message(code: 'comissoes.siglaComissao.label', default: 'Sigla Comissao')}" />
					
						<g:sortableColumn property="nomeComissao" title="${message(code: 'comissoes.nomeComissao.label', default: 'Nome Comissao')}" />
					
						<g:sortableColumn property="condicaoMembro" title="${message(code: 'comissoes.condicaoMembro.label', default: 'Condicao Membro')}" />
					
						<g:sortableColumn property="dataEntrada" title="${message(code: 'comissoes.dataEntrada.label', default: 'Data Entrada')}" />
					
						<g:sortableColumn property="dataSaida" title="${message(code: 'comissoes.dataSaida.label', default: 'Data Saida')}" />
					
						<th><g:message code="comissoes.dep.label" default="Dep" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${comissoesInstanceList}" status="i" var="comissoesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${comissoesInstance.id}">${fieldValue(bean: comissoesInstance, field: "siglaComissao")}</g:link></td>
					
						<td>${fieldValue(bean: comissoesInstance, field: "nomeComissao")}</td>
					
						<td>${fieldValue(bean: comissoesInstance, field: "condicaoMembro")}</td>
					
						<td>${fieldValue(bean: comissoesInstance, field: "dataEntrada")}</td>
					
						<td>${fieldValue(bean: comissoesInstance, field: "dataSaida")}</td>
					
						<td>${fieldValue(bean: comissoesInstance, field: "dep")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${comissoesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
