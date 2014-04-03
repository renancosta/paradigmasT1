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
