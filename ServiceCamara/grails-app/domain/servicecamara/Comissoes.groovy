package servicecamara

class Comissoes {

	String siglaComissao
	String nomeComissao
	String condicaoMembro
	String dataEntrada
	String dataSaida
	static belongsTo = [dep: DeputadoDetalhe]

    static constraints = {
    	siglaComissao()
    	nomeComissao()
    	condicaoMembro()
    	dataEntrada()
    	dataSaida()
    }

    String toString(){
    	"${id} - ${nomeComissao}"
  	}

}
