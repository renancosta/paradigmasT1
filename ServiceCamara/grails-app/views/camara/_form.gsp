<%@ page import="servicecamara.Camara" %>



<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'nomeParlamentarAtual', 'error')} ">
	<label for="nomeParlamentarAtual">
		<g:message code="camara.nomeParlamentarAtual.label" default="Nome Parlamentar Atual" />
		
	</label>
	<g:textField name="nomeParlamentarAtual" value="${camaraInstance?.nomeParlamentarAtual}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'numLegislatura', 'error')} ">
	<label for="numLegislatura">
		<g:message code="camara.numLegislatura.label" default="Num Legislatura" />
		
	</label>
	<g:textField name="numLegislatura" value="${camaraInstance?.numLegislatura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'dataNascimento', 'error')} ">
	<label for="dataNascimento">
		<g:message code="camara.dataNascimento.label" default="Data Nascimento" />
		
	</label>
	<g:textField name="dataNascimento" value="${camaraInstance?.dataNascimento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'nomeCivil', 'error')} ">
	<label for="nomeCivil">
		<g:message code="camara.nomeCivil.label" default="Nome Civil" />
		
	</label>
	<g:textField name="nomeCivil" value="${camaraInstance?.nomeCivil}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'nomeProfissao', 'error')} ">
	<label for="nomeProfissao">
		<g:message code="camara.nomeProfissao.label" default="Nome Profissao" />
		
	</label>
	<g:textField name="nomeProfissao" value="${camaraInstance?.nomeProfissao}"/>
</div>

