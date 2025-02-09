Feature: sample karate test script
  #for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:

    # llamamos así a la función Java que está en helpers
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url urlPlayas

  
  @ignore
  Scenario: get playas
    
    Given path '/beaches'
    When method get
    Then status 200

    And match response.data == '#[]'
   
  @ignore
  Scenario: new user register

    # TEST DATA GENERATOR

    # llamamos así a las funciones static de la clase java
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomName = dataGenerator.getRandomName()

    #si la función de la clase java no es static tenemos que hacer una función:
    * def jsFunction =

    """
      function () {

        var DataGenerator = Java.type('helpers.DataGenerator')
        var generator = new DataGenerator()
        return generator.getRandomName2()
        
      }
    
    """
    #Ahora creamos la variable y llamamos a la función con call:

    * def randomName2 = call jsFunction
    
    Given path '/beach/users'
    Given request 
    """
      { "name" : #(randomName2),
        "email" : #(randomEmail),
        "password" : '12345678'
      }

    """
    When method post
    Then status 200

    And match response ==

    """

    {
      status: "ok",
      message:  "#string",
      user: "#number"
    }
    
    """
    
  Scenario Outline: new user with errors

    #DATA DRIVEN

    Given path '/beach/users'
    Given request 
    """
      { "name" : <name>,
        "email" : <email>,
        "password" : <password>
      }

    """
    When method post

    Then status 409
    
    And match response == <errorResponse>

    Examples:

         | email                | name           | password | errorResponse                                                                         |
         | graciela72@test.com  | juanito        | 12345678 |  {"status":"error","message":"Ya existe un usuario en la base de datos con ese email"}|
       
         