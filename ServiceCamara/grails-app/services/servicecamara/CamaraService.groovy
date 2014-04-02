package servicecamara

class CamaraService {

    boolean transactional = false

    def camaraDeputado(String id, String numL) {
      def base = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?"
      def qs = []
      qs << "ideCadastro=" + URLEncoder.encode(id)
      qs << "numLegislatura=" + URLEncoder.encode(numL)
      def url = new URL(base + qs.join("&"))
      def connection = url.openConnection()

      def result = [:]
      if(connection.responseCode == 200){
        def xml = connection.content.text
        def Deputados = new XmlSlurper().parseText(xml)
        result.numLegislatura = Deputados.Deputado.numLegislatura as String 
        result.nomeProfissao = Deputados.Deputado.nomeProfissao as String
        result.dataNascimento = Deputados.Deputado.dataNascimento as String
        result.nomeParlamentarAtual = Deputados.Deputado.nomeParlamentarAtual as String
        result.nomeCivil = Deputados.Deputado.nomeCivil as String
        log.info("URL: $url")
        
      }
      else{
        log.error("CamaraService.camaraDeputado FAILED $url")
        log.error(url)
        log.error(connection.responseCode)
        log.error(connection.responseMessage)
      }      
      return result
    }
    def camaraDeputados() {
      def base = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados?"
      def url = new URL(base)
      def connection = url.openConnection()
      def i=0

      //def result = [:]
      //def temp = [:]
      
      //ArrayList<Camara> result = new ArrayList<Camara>();
      def camara = [:]
      def result = [:]

      if(connection.responseCode == 200){
        def xml = connection.content.text
        def deputados = new XmlSlurper().parseText(xml)
        def allDeputados = deputados.deputado

        while(i<allDeputados.size()) {
        //println(i)
        camara.numLegislatura = deputados.deputado[i].matricula as String 
        camara.nomeProfissao = deputados.deputado[i].matricula as String
        camara.dataNascimento = deputados.deputado[i].matricula as String
        camara.nomeParlamentarAtual = deputados.deputado[i].nomeParlamentar as String
        camara.nomeCivil = deputados.deputado[i].nome as String
        //log.info("URL: $url")
        //result.add(camara);
        result = new Camara(camara)

        if(!result.hasErrors() && result.save()) {
            //flash.message = "Camara ${temp.id} created"
            //printf(result.nomeCivil)
        }
        i++
        }

        //printf(result.get(0).nomeCivil)
        //printf(result.get(1).nomeCivil)
        //printf(result.get(2).nomeCivil)
      }
      else{
        log.error("CamaraService.camaraDeputado FAILED $url")
        log.error(url)
        log.error(connection.responseCode)
        log.error(connection.responseMessage)
      }      
      return result
    }
}
