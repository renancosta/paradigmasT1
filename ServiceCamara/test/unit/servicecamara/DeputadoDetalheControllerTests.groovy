package servicecamara



import org.junit.*
import grails.test.mixin.*

@TestFor(DeputadoDetalheController)
@Mock(DeputadoDetalhe)
class DeputadoDetalheControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deputadoDetalhe/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deputadoDetalheInstanceList.size() == 0
        assert model.deputadoDetalheInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deputadoDetalheInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deputadoDetalheInstance != null
        assert view == '/deputadoDetalhe/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deputadoDetalhe/show/1'
        assert controller.flash.message != null
        assert DeputadoDetalhe.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deputadoDetalhe/list'

        populateValidParams(params)
        def deputadoDetalhe = new DeputadoDetalhe(params)

        assert deputadoDetalhe.save() != null

        params.id = deputadoDetalhe.id

        def model = controller.show()

        assert model.deputadoDetalheInstance == deputadoDetalhe
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deputadoDetalhe/list'

        populateValidParams(params)
        def deputadoDetalhe = new DeputadoDetalhe(params)

        assert deputadoDetalhe.save() != null

        params.id = deputadoDetalhe.id

        def model = controller.edit()

        assert model.deputadoDetalheInstance == deputadoDetalhe
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deputadoDetalhe/list'

        response.reset()

        populateValidParams(params)
        def deputadoDetalhe = new DeputadoDetalhe(params)

        assert deputadoDetalhe.save() != null

        // test invalid parameters in update
        params.id = deputadoDetalhe.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deputadoDetalhe/edit"
        assert model.deputadoDetalheInstance != null

        deputadoDetalhe.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deputadoDetalhe/show/$deputadoDetalhe.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deputadoDetalhe.clearErrors()

        populateValidParams(params)
        params.id = deputadoDetalhe.id
        params.version = -1
        controller.update()

        assert view == "/deputadoDetalhe/edit"
        assert model.deputadoDetalheInstance != null
        assert model.deputadoDetalheInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deputadoDetalhe/list'

        response.reset()

        populateValidParams(params)
        def deputadoDetalhe = new DeputadoDetalhe(params)

        assert deputadoDetalhe.save() != null
        assert DeputadoDetalhe.count() == 1

        params.id = deputadoDetalhe.id

        controller.delete()

        assert DeputadoDetalhe.count() == 0
        assert DeputadoDetalhe.get(deputadoDetalhe.id) == null
        assert response.redirectedUrl == '/deputadoDetalhe/list'
    }
}
