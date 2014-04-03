import seguranca.*
import servicecamara.*

class BootStrap {
 
    def init = { servletContext ->
        /* If there are no Persons in the record. */
        if (!Person.count()) {
            createData()
        }
        camaraDeputados()
    }
    def destroy = {
    }
 
    private void createData() {
        def userRole = new Authority(authority: 'ROLE_USER').save()
 
        /* The default password for all user. No need to encode here to avoid double encoding. */
        String password = 'password'
 
        [hebert: 'Hebert Douglas', renan: 'Renan Costa', max: 'Maxxwel'].each { userName, realName ->
            def user = new Person(username: userName, realName: realName, password: password, enabled: true).save()
            PersonAuthority.create user, userRole, true
        }
    }

    private void camaraDeputados() {
     	def base = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados?"
     	def url = new URL(base)
     	def connection = url.openConnection()
     	def i=0

     	def camara = [:]
     	def result = [:]

     	if(connection.responseCode == 200){
        	def xml = connection.content.text
        	def deputados = new XmlSlurper().parseText(xml)
        	def allDeputados = deputados.deputado

        	while(i<allDeputados.size()) {
        		camara.numLegislatura = "" 
                camara.ide = deputados.deputado[i].ideCadastro as String
        		camara.nomeProfissao =  ""
        		camara.dataNascimento = ""
        		camara.nomeParlamentarAtual = deputados.deputado[i].nomeParlamentar as String
        		camara.nomeCivil = deputados.deputado[i].nome as String
        	    camara.partido = deputados.deputado[i].partido as String
                camara.ufRepresentacaoAtual = deputados.deputado[i].uf as String
                camara.condicao = deputados.deputado[i].condicao as String
                camara.matricula = deputados.deputado[i].matricula as String
                camara.urlFoto = deputados.deputado[i].urlFoto as String
                camara.email = deputados.deputado[i].email as String
                camara.fone = deputados.deputado[i].fone as String
        		
                result = new Camara(camara)
                
        		if(!result.hasErrors() && result.save()) {
        		}
        		i++
        	}
    	}
    	else{
        	log.error("CamaraService.camaraDeputado FAILED $url")
        	log.error(url)
        	log.error(connection.responseCode)
        	log.error(connection.responseMessage)
    	}      
    }
}