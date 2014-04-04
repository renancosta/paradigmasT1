package servicecamara

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
 
@Secured(['IS_AUTHENTICATED_FULLY'])
class DeputadoDetalheController {

    def deputados = new DeputadoDetalhe()

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    

    def apagar(String cam){
        DeputadoDetalhe deputadoDetalheInstance = new DeputadoDetalhe()
        //printf(Camara.findAllByIde(cam))
        deputadoDetalheInstance.deputado = Camara.findByIde(cam)

        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        try {
            deputadoDetalheInstance.delete(flush: true)
            //flash.message = message(code: 'default.deleted.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "show", id: id)
        }
    }

    def show(Long id) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        def base = "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?"
        def qs = []
        qs << "ideCadastro=" + URLEncoder.encode(deputadoDetalheInstance.deputado.ide)
        qs << "numLegislatura=" + URLEncoder.encode("53")
        def url = new URL(base + qs.join("&"))
        def connection = url.openConnection()
        def i=0
        def comissoes = new Comissoes()
        //def result = [:]
        if(connection.responseCode == 200){
            def xml = connection.content.text
            def Deputados = new XmlSlurper().parseText(xml)
            def allComicoes = Deputados.Deputado.comissoes.comissao

            deputadoDetalheInstance.deputado.numLegislatura = Deputados.Deputado.numLegislatura as String 
            deputadoDetalheInstance.deputado.nomeProfissao = Deputados.Deputado.nomeProfissao as String
            deputadoDetalheInstance.deputado.dataNascimento = Deputados.Deputado.dataNascimento as String
            //printf(allComicoes.size())
            while(i<allComicoes.size()) {
                deputadoDetalheInstance.comissoes.siglaComissao = Deputados.Deputado.comissoes.comissao[i].siglaComissao as String
                deputadoDetalheInstance.comissoes.nomeComissao = Deputados.Deputado.comissoes.comissao[i].nomeComissao as String
                deputadoDetalheInstance.comissoes.condicaoMembro = Deputados.Deputado.comissoes.comissao[i].condicaoMembro as String
                deputadoDetalheInstance.comissoes.dataEntrada = Deputados.Deputado.comissoes.comissao[i].dataEntrada as String
                deputadoDetalheInstance.comissoes.dataSaida = Deputados.Deputado.comissoes.comissao[i].dataSaida as String
                printf(deputadoDetalheInstance.comissoes.siglaComissao)
                deputadoDetalheInstance.comissoes.save()
                i++
            }

            //deputadoDetalheInstance.comissoes = comissoes
            
            //log.info("URL: $url")
        
        }
        else{
            log.error("CamaraService.camaraDeputado FAILED $url")
            log.error(url)
            log.error(connection.responseCode)
            log.error(connection.responseMessage)
        }

        [deputadoDetalheInstance: deputadoDetalheInstance]
    }

    def save() {
        def deputadoDetalheInstance = new DeputadoDetalhe(params)
        if (!deputadoDetalheInstance.save(flush: true)) {
            render(view: "create", model: [deputadoDetalheInstance: deputadoDetalheInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), deputadoDetalheInstance.id])
        redirect(action: "show", id: deputadoDetalheInstance.id)
    }

    def edit(Long id) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        [deputadoDetalheInstance: deputadoDetalheInstance]
    }

    def scaffold = deputados

    /*def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deputadoDetalheInstanceList: DeputadoDetalhe.list(params), deputadoDetalheInstanceTotal: DeputadoDetalhe.count()]
    }

    def create() {
        [deputadoDetalheInstance: new DeputadoDetalhe(params)]
    }

    def save() {
        def deputadoDetalheInstance = new DeputadoDetalhe(params)
        if (!deputadoDetalheInstance.save(flush: true)) {
            render(view: "create", model: [deputadoDetalheInstance: deputadoDetalheInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), deputadoDetalheInstance.id])
        redirect(action: "show", id: deputadoDetalheInstance.id)
    }

    def show(Long id) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        [deputadoDetalheInstance: deputadoDetalheInstance]
    }

    def edit(Long id) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        [deputadoDetalheInstance: deputadoDetalheInstance]
    }

    def update(Long id, Long version) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deputadoDetalheInstance.version > version) {
                deputadoDetalheInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe')] as Object[],
                          "Another user has updated this DeputadoDetalhe while you were editing")
                render(view: "edit", model: [deputadoDetalheInstance: deputadoDetalheInstance])
                return
            }
        }

        deputadoDetalheInstance.properties = params

        if (!deputadoDetalheInstance.save(flush: true)) {
            render(view: "edit", model: [deputadoDetalheInstance: deputadoDetalheInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), deputadoDetalheInstance.id])
        redirect(action: "show", id: deputadoDetalheInstance.id)

        def delete(Long id) {
        def deputadoDetalheInstance = DeputadoDetalhe.get(id)
        if (!deputadoDetalheInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
            return
        }

        try {
            deputadoDetalheInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'deputadoDetalhe.label', default: 'DeputadoDetalhe'), id])
            redirect(action: "show", id: id)
        }
    }
    }*/
}
