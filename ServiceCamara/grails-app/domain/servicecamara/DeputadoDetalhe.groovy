package servicecamara

class DeputadoDetalhe {

	//def listaDeputados

    static constraints = {
    	//ide(maxSize:5)
        //nomeParlamentarAtual()
        //nomeCivil()
        //partido()
        //ufRepresentacaoAtual()
    }

   	String toString(){
    	"${ide} - ${nomeParlamentarAtual}"
  	}
}
