package servicecamara

class Camara {

 	String nomeParlamentarAtual
 	String id
 	String numLegislatura
 	String nomeProfissao
 	String dataNascimento
 	String nomeCivil

    static constraints = {
    	nomeParlamentarAtual()
    	id(maxSize:5)
    	numLegislatura()
    	dataNascimento()
    	nomeCivil()
    	nomeProfissao()
    }

   	String toString(){
    	"${id} - ${nomeParlamentarAtual}"
  	}
  	/* Este parâmetro torna true o acesso do método searchable aos 
  	atributos da classe de domínio persistidos no banco de dados.*/
	static searchable = true

}
