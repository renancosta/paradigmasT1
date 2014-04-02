paradigmasT1
============

Repositório destinado ao primeiro trabalho de paradigmas T1 utilizando Grails

===Plugins

grails install-plugin searchable

===Tutorial Consumir Web Service

grails create-service <nomewebservice>

class <nomewebservice>Service {
    boolean transactional = true
    def serviceMethod() {

    }
}

Realiza chama na Controller e na create.gsp

===Chamada HTTP Web Service Camara

1. http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados?
2. http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=<id>&numLegislatura=<num>
