package servicecamara

import org.springframework.dao.DataIntegrityViolationException

import grails.plugin.springsecurity.annotation.Secured
 
@Secured(['IS_AUTHENTICATED_FULLY'])
class CamaraController {

    def springSecurityService
    def camaraService = new Camara()

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [camaraInstanceList: Camara.list(params), camaraInstanceTotal: Camara.count()]
    }

    def create() {
        [camaraInstance: new Camara(params)]
    }

    def favorito(){
        //printf("nhe")
        
        //printf(params.id)

        def camaraInstance2 = Camara.get(params.id.toInteger())
        //def comissoes = new Comissoes()
        //comissoes = Comissoes.get(params.id.toInteger())



        DeputadoDetalhe deputados = new DeputadoDetalhe()
        deputados.comissoes = new Comissoes()
        deputados.comissoes.dep = deputados

        deputados.comissoes.siglaComissao= ""
        deputados.comissoes.nomeComissao = ""
        deputados.comissoes.condicaoMembro = ""
        deputados.comissoes.dataEntrada = ""
        deputados.comissoes.dataSaida = ""

        //DeputadoDetalheController depC = new DeputadoDetalheController()
        //print(camaraInstance2.favorito);
        if(camaraInstance2.favorito==false){
            camaraInstance2.favorito = true
            deputados.deputado = camaraInstance2
            //deputados.comissoes = comissoes
            deputados.save()
        }else{
            camaraInstance2.favorito = false
            //deputados.delete(camaraInstance2.ide)
            //depC.params.cam = camaraInstance2.ide
            //depC.apagar()
            //depC.save()
        }

        redirect(action:"show", params:params)
    }

    def show(Long id) {
        def camaraInstance = Camara.get(id)

        if (!camaraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'camara.label', default: 'Camara'), id])
            redirect(action: "list")
            return
        }

        [camaraInstance: camaraInstance]
    }
    /*def save() {
        def results = camaraService.camaraDeputado(params.id,params.numLegislatura)    
        def camara = new Camara(params + results)
        if(!camara.hasErrors() && camara.save()) {
            flash.message = "Camara ${camara.id} created"
            redirect(action:show,id:camara.id)
        }
        else {
            render(view:'create',model:[camara:camara])
        }
    }*/

    def search= {
        def query =params.q
        if(query){
            def srchResults = Camara.search('*'+query+'*')
            render(view:"list",model:[camaraInstanceList:srchResults.results,camaraInstanceTotal:srchResults.total])}
        else{
            redirect(action:"list")
        }
    }

    def scaffold = camaraService

    
}
