package servicecamara

class Camara {

  //nomeParlamentarAtual, nomeCivil, id, partido, ufRepresentacaoAtual
 	String nomeParlamentarAtual
 	String ide
 	String numLegislatura
 	String nomeProfissao
 	String dataNascimento
 	String nomeCivil
  String partido
  String ufRepresentacaoAtual
  String condicao
  String matricula
  String urlFoto
  String email
  String fone

    static constraints = {
    	nomeParlamentarAtual()
    	ide(maxSize:5)
    	numLegislatura()
    	dataNascimento()
    	nomeCivil()
    	nomeProfissao()
    }

   	String toString(){
    	"${ide} - ${nomeParlamentarAtual}"
  	}
  	/* Este parâmetro torna true o acesso do método searchable aos 
  	atributos da classe de domínio persistidos no banco de dados.*/
	static searchable = true

}
