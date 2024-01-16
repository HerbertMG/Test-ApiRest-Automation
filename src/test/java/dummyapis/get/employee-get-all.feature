Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero obtener la lista completa de usuarios registrados en el sistema,
  para generar un reporte de empleados

  Background:
    * def messageValidate = read('classpath:ui/questions/apimessage.json')

  @Integracion
  Scenario: [TEST-01] Obtener la lista de empleados registrados en el sistema
    Given url host
    And path '/employees'
    When method GET
    Then status 200
    Then match $.status == 'success'
    Then match $.message == messageValidate.getAllMessage.message
    * print response.message
    * print response
