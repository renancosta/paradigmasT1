package servicecamara



import org.junit.*
import grails.test.mixin.*

@TestFor(CamaraController)
@Mock(Camara)
class CamaraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/camara/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.camaraInstanceList.size() == 0
        assert model.camaraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.camaraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.camaraInstance != null
        assert view == '/camara/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/camara/show/1'
        assert controller.flash.message != null
        assert Camara.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/camara/list'

        populateValidParams(params)
        def camara = new Camara(params)

        assert camara.save() != null

        params.id = camara.id

        def model = controller.show()

        assert model.camaraInstance == camara
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/camara/list'

        populateValidParams(params)
        def camara = new Camara(params)

        assert camara.save() != null

        params.id = camara.id

        def model = controller.edit()

        assert model.camaraInstance == camara
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/camara/list'

        response.reset()

        populateValidParams(params)
        def camara = new Camara(params)

        assert camara.save() != null

        // test invalid parameters in update
        params.id = camara.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/camara/edit"
        assert model.camaraInstance != null

        camara.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/camara/show/$camara.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        camara.clearErrors()

        populateValidParams(params)
        params.id = camara.id
        params.version = -1
        controller.update()

        assert view == "/camara/edit"
        assert model.camaraInstance != null
        assert model.camaraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/camara/list'

        response.reset()

        populateValidParams(params)
        def camara = new Camara(params)

        assert camara.save() != null
        assert Camara.count() == 1

        params.id = camara.id

        controller.delete()

        assert Camara.count() == 0
        assert Camara.get(camara.id) == null
        assert response.redirectedUrl == '/camara/list'
    }
}
