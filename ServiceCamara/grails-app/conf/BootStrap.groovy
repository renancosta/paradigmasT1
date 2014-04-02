import seguranca.*

class BootStrap {
 
    def init = { servletContext ->
        /* If there are no Persons in the record. */
        if (!Person.count()) {
            createData()
        }
    }
    def destroy = {
    }
 
    private void createData() {
        def userRole = new Authority(authority: 'ROLE_USER').save()
 
        /* The default password for all user. No need to encode here to avoid double encoding. */
        String password = 'password'
 
        [hebert: 'Hebert Douglas', renan: 'Renan Costa', max: 'Maxxwel'].each { userName, realName ->
            def user = new Person(username: userName, realName: realName, password: password, enabled: true).save()
            PersonAuthority.create user, userRole, true
        }
    }
}