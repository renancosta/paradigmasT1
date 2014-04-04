package servicecamara

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
 
@Secured(['IS_AUTHENTICATED_FULLY'])
class ComissoesController {

    def comissoes = new Comissoes()

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [comissoesInstanceList: Comissoes.list(params), comissoesInstanceTotal: Comissoes.count()]
    }

    def create() {
        [comissoesInstance: new Comissoes(params)]
    }

    def save() {
        def comissoesInstance = new Comissoes(params)
        if (!comissoesInstance.save(flush: true)) {
            render(view: "create", model: [comissoesInstance: comissoesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), comissoesInstance.id])
        redirect(action: "show", id: comissoesInstance.id)
    }

    def show(Long id) {
        def comissoesInstance = Comissoes.get(id)
        if (!comissoesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "list")
            return
        }

        [comissoesInstance: comissoesInstance]
    }

    def edit(Long id) {
        def comissoesInstance = Comissoes.get(id)
        if (!comissoesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "list")
            return
        }

        [comissoesInstance: comissoesInstance]
    }

    def update(Long id, Long version) {
        def comissoesInstance = Comissoes.get(id)
        if (!comissoesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (comissoesInstance.version > version) {
                comissoesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comissoes.label', default: 'Comissoes')] as Object[],
                          "Another user has updated this Comissoes while you were editing")
                render(view: "edit", model: [comissoesInstance: comissoesInstance])
                return
            }
        }

        comissoesInstance.properties = params

        if (!comissoesInstance.save(flush: true)) {
            render(view: "edit", model: [comissoesInstance: comissoesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), comissoesInstance.id])
        redirect(action: "show", id: comissoesInstance.id)
    }

    def delete(Long id) {
        def comissoesInstance = Comissoes.get(id)
        if (!comissoesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "list")
            return
        }

        try {
            comissoesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comissoes.label', default: 'Comissoes'), id])
            redirect(action: "show", id: id)
        }
    }

    def scaffold = comissoes
}
