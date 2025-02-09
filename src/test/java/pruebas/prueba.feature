Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  # Background:
  #   Given url urlBase

  # Scenario: get all users

      # FUZZY MATCHING

  #   Given path 'users'
  #   When method get
  #   Then status 200
   
  #   And match response == '#[10]'
  #   And match each response[*].name == '#string'
    

  #   * print "hola"

  
  # Scenario: get the first user by id

       # SCHEMA VALIDATION
    
  #   Given path 'users/1'
  #   When method get
  #   Then status 200
   
  #   And match response == '#object'
  #   And match response.phone contains '770'
  #   And match response.address.geo.lat contains '-37'
  #   And match response.address.geo.lat == '#regex\-\[0-9]{2}\.[0-9]{4}'