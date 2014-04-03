package servicecamara

class DeputadoDetalhe {

	String nomeParlamentarAtual
 	String ide
 	String numLegislatura
 	String nomeProfissao
 	String dataNascimento
 	String nomeCivil
 	String partido
 	String ufRepresentacaoAtual

    static constraints = {
    	nomeParlamentarAtual()
    	id(maxSize:5)
    	numLegislatura()
    	dataNascimento()
    	nomeCivil()
    	nomeProfissao()
    	partido()
    	ufRepresentacaoAtual()
    }

   	String toString(){
    	"${ide} - ${nomeParlamentarAtual}"
  	}
}
