Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero estar notificado si ocurrio un error,
  para validar el correcto funcionamiento de los servicios

  Background:
    * def messageValidate = read('classpath:ui/questions/apimessage.json')

  @Integracion
  Scenario: [TEST-06] Validar el metodo GET en el servicio de creacion de registro de usuario
    Given url host
    And path '/create'
    When method GET
    Then status 404
    Then match $.message == messageValidate.errorMessage.message
    * print response

  @Integracion
  Scenario: [TEST-07] Validar el metodo GET en el servicio de eliminar registro de usuario
    Given url host
    And path '/delete/2'
    When method GET
    Then status 404
    Then match $.message == messageValidate.errorMessage.message
    * print response