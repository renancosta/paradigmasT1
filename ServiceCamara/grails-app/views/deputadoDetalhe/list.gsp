
<%@ page import="servicecamara.DeputadoDetalhe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deputadoDetalhe.label', default: 'Deputado Detalhe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-deputadoDetalhe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-deputadoDetalhe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="ide" title="${message(code: 'deputadoDetalhe.deputado.ide.label', default: 'ID')}" />
					
						<g:sortableColumn property="nomeParlamentarAtual" title="${message(code: 'deputadoDetalhe.deputado.nomeParlamentarAtual.label', default: 'Nome Parlamentar')}" />
					
						<g:sortableColumn property="nomeCivil" title="${message(code: 'deputadoDetalhe.deputado.nomeCivil.label', default: 'Nome Civil')}" />
					
						<g:sortableColumn property="partido" title="${message(code: 'deputadoDetalhe.deputado.partido.label', default: 'Partido')}" />
					
						<g:sortableColumn property="ufRepresentacaoAtual" title="${message(code: 'deputadoDetalhe.deputado.ufRepresentacaoAtual.label', default: 'UF')}" />
					
						<g:sortableColumn property="condicao" title="${message(code: 'deputadoDetalhe.deputado.condicao.label', default: 'Condicao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${deputadoDetalheInstanceList}" status="i" var="deputadoDetalheInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<%--<td><g:link action="show" id="${deputadoDetalheInstance.id}">${fieldValue(bean: deputadoDetalheInstance, field: "deputado")}</g:link></td>--%>

						<td><g:link action="show" id="${deputadoDetalheInstance.id}">${fieldValue(bean: deputadoDetalheInstance.deputado, field: "ide")}</g:link></td>
					
						<td>${fieldValue(bean: deputadoDetalheInstance.deputado, field: "nomeParlamentarAtual")}</td>
					
						<td>${fieldValue(bean: deputadoDetalheInstance.deputado, field: "nomeCivil")}</td>
					
						<td>${fieldValue(bean: deputadoDetalheInstance.deputado, field: "partido")}</td>
					
						<td>${fieldValue(bean: deputadoDetalheInstance.deputado, field: "ufRepresentacaoAtual")}</td>
					
						<td>${fieldValue(bean: deputadoDetalheInstance.deputado, field: "condicao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${deputadoDetalheInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
