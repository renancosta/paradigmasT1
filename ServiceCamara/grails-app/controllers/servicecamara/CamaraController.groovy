package servicecamara

import org.springframework.dao.DataIntegrityViolationException

class CamaraController {

    def camaraService = new Camara()

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        //def results = camaraService.camaraDeputados()
        /*def temp = [:]
        
        temp = results
        def camara = [:]
        def i=0
        printf(results[i].nomeCivil)

        while(i<results.size()){
        camara[i] = new Camara(params + results[i])
        if(!camara[i].hasErrors() && camara[i].save()) {
            flash.message = "Camara ${camara[i].id} created"
        }
        else {
            render(view:'create',model:[camara:camara])
        }
        i++
        }*/

        /*camara = new Camara(params + results)
        if(!camara.hasErrors() && camara.save()) {
            flash.message = "Camara ${camara.id} created"
        }
        else {
            render(view:'create',model:[camara:camara])
        }*/

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
