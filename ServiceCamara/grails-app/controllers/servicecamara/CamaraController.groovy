package servicecamara

import org.springframework.dao.DataIntegrityViolationException

class CamaraController {

    def camaraService = new Camara()

    def save = {
        def results = camaraService.camaraDeputado(params.id,params.numLegislatura)    
        def camara = new Camara(params + results)
        if(!camara.hasErrors() && camara.save()) {
            flash.message = "Camara ${camara.id} created"
            redirect(action:show,id:camara.id)
        }
        else {
            render(view:'create',model:[camara:camara])
        }
    }

    /*def buscaDeputados = {
        def resultado = Camara.withCriteria {
            eq(params.nomeParlamentarAtual)
        }
        [resultado:resultado]
    }*/

    def scaffold = camaraService

    
}
