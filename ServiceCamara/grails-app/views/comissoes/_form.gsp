<%@ page import="servicecamara.Comissoes" %>



<div class="fieldcontain ${hasErrors(bean: comissoesInstance, field: 'siglaComissao', 'error')} ">
	<label for="siglaComissao">
		<g:message code="comissoes.siglaComissao.label" default="Sigla Comissao" />
		
	</label>
	<g:textField name="siglaComissao" value="${comissoesInstance?.siglaComissao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comissoesInstance, field: 'nomeComissao', 'error')} ">
	<label for="nomeComissao">
		<g:message code="comissoes.nomeComissao.label" default="Nome Comissao" />
		
	</label>
	<g:textField name="nomeComissao" value="${comissoesInstance?.nomeComissao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comissoesInstance, field: 'condicaoMembro', 'error')} ">
	<label for="condicaoMembro">
		<g:message code="comissoes.condicaoMembro.label" default="Condicao Membro" />
		
	</label>
	<g:textField name="condicaoMembro" value="${comissoesInstance?.condicaoMembro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comissoesInstance, field: 'dataEntrada', 'error')} ">
	<label for="dataEntrada">
		<g:message code="comissoes.dataEntrada.label" default="Data Entrada" />
		
	</label>
	<g:textField name="dataEntrada" value="${comissoesInstance?.dataEntrada}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comissoesInstance, field: 'dataSaida', 'error')} ">
	<label for="dataSaida">
		<g:message code="comissoes.dataSaida.label" default="Data Saida" />
		
	</label>
	<g:textField name="dataSaida" value="${comissoesInstance?.dataSaida}"/>
</div>

