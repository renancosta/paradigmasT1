package servicecamara

class DeputadoDetalhe {

	Camara deputado
	Comissoes comissoes

    static constraints = {
        
    	deputado()
    	comissoes()
    }

   	String toString(){
    	"${ide} - ${nomeParlamentarAtual}"
  	}
}
