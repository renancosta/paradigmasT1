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
}
