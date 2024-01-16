Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero poder eliminar un registro de empleado del sistema,
  para realizar un mantenimiento de la base de datos

  Background:
    * def responseValidate = read('classpath:ui/assertions/responseBody/deleteResponse.json')
    * def messageValidate = read('classpath:ui/questions/apimessage.json')

  @Integracion
  Scenario Outline: [TEST-05] Eliminar un registro de empleado en el sistema
    Given url host
    And path '/delete/<id>'
    When method DELETE
    Then status 200
    Then match $.status == 'success'
    Then match $.message == messageValidate.deleteMessage.message
    Then match response == responseValidate
    * print response

    Examples:
      | id |
      | 24 |
      ##| 22 |
      ##| 16 |