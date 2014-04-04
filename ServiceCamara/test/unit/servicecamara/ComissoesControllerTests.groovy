package servicecamara



import org.junit.*
import grails.test.mixin.*

@TestFor(ComissoesController)
@Mock(Comissoes)
class ComissoesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/comissoes/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.comissoesInstanceList.size() == 0
        assert model.comissoesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.comissoesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.comissoesInstance != null
        assert view == '/comissoes/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/comissoes/show/1'
        assert controller.flash.message != null
        assert Comissoes.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/comissoes/list'

        populateValidParams(params)
        def comissoes = new Comissoes(params)

        assert comissoes.save() != null

        params.id = comissoes.id

        def model = controller.show()

        assert model.comissoesInstance == comissoes
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/comissoes/list'

        populateValidParams(params)
        def comissoes = new Comissoes(params)

        assert comissoes.save() != null

        params.id = comissoes.id

        def model = controller.edit()

        assert model.comissoesInstance == comissoes
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/comissoes/list'

        response.reset()

        populateValidParams(params)
        def comissoes = new Comissoes(params)

        assert comissoes.save() != null

        // test invalid parameters in update
        params.id = comissoes.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/comissoes/edit"
        assert model.comissoesInstance != null

        comissoes.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/comissoes/show/$comissoes.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        comissoes.clearErrors()

        populateValidParams(params)
        params.id = comissoes.id
        params.version = -1
        controller.update()

        assert view == "/comissoes/edit"
        assert model.comissoesInstance != null
        assert model.comissoesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/comissoes/list'

        response.reset()

        populateValidParams(params)
        def comissoes = new Comissoes(params)

        assert comissoes.save() != null
        assert Comissoes.count() == 1

        params.id = comissoes.id

        controller.delete()

        assert Comissoes.count() == 0
        assert Comissoes.get(comissoes.id) == null
        assert response.redirectedUrl == '/comissoes/list'
    }
}
