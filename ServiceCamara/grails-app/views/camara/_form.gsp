<%@ page import="servicecamara.Camara" %>



<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'nomeParlamentarAtual', 'error')} ">
	<label for="nomeParlamentarAtual">
		<g:message code="camara.nomeParlamentarAtual.label" default="Nome Parlamentar Atual" />
		
	</label>
	<g:textField name="nomeParlamentarAtual" value="${camaraInstance?.nomeParlamentarAtual}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'ide', 'error')} ">
	<label for="ide">
		<g:message code="camara.ide.label" default="Ide" />
		
	</label>
	<g:textField name="ide" maxlength="5" value="${camaraInstance?.ide}"/>
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

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'condicao', 'error')} ">
	<label for="condicao">
		<g:message code="camara.condicao.label" default="Condicao" />
		
	</label>
	<g:textField name="condicao" value="${camaraInstance?.condicao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="camara.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${camaraInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'fone', 'error')} ">
	<label for="fone">
		<g:message code="camara.fone.label" default="Fone" />
		
	</label>
	<g:textField name="fone" value="${camaraInstance?.fone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'matricula', 'error')} ">
	<label for="matricula">
		<g:message code="camara.matricula.label" default="Matricula" />
		
	</label>
	<g:textField name="matricula" value="${camaraInstance?.matricula}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'partido', 'error')} ">
	<label for="partido">
		<g:message code="camara.partido.label" default="Partido" />
		
	</label>
	<g:textField name="partido" value="${camaraInstance?.partido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'ufRepresentacaoAtual', 'error')} ">
	<label for="ufRepresentacaoAtual">
		<g:message code="camara.ufRepresentacaoAtual.label" default="Uf Representacao Atual" />
		
	</label>
	<g:textField name="ufRepresentacaoAtual" value="${camaraInstance?.ufRepresentacaoAtual}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camaraInstance, field: 'urlFoto', 'error')} ">
	<label for="urlFoto">
		<g:message code="camara.urlFoto.label" default="Url Foto" />
		
	</label>
	<g:textField name="urlFoto" value="${camaraInstance?.urlFoto}"/>
</div>

