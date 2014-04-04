package servicecamara

class DeputadoDetalhe {

	Camara deputado

    static constraints = {
        
    	deputado()

    }

   	String toString(){
    	"${ide} - ${nomeParlamentarAtual}"
  	}
}
