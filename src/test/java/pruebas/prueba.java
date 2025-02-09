package pruebas;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUser() {
        return Karate.run("prueba").relativeTo(getClass());
    }    

}