import servicecamara.*

class BootStrap {

    def init = { servletContext ->
    	
    	camaraDeputados()

    }
    def destroy = {
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
        		camara.numLegislatura = deputados.deputado[i].matricula as String 
        		camara.nomeProfissao = deputados.deputado[i].matricula as String
        		camara.dataNascimento = deputados.deputado[i].matricula as String
        		camara.nomeParlamentarAtual = deputados.deputado[i].nomeParlamentar as String
        		camara.nomeCivil = deputados.deputado[i].nome as String
        	
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
