Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero buscar un empleado por su ID,
  para visualizar su informacion personal

  Background:
    * def messageValidate = read('classpath:ui/questions/apimessage.json')
    * def responseValidate = read('classpath:ui/assertions/responseBody/getResponse.json')


  @Integracion
  Scenario Outline: [TEST-02] Obtener un empleados registrado en el sistema
    Given url host
    And path '/employee/<id>'
    When method GET
    Then status 200
    Then match $.status == 'success'
    Then match $.message == messageValidate.getByIdMessage.message
    Then match response == responseValidate
    * print response.message
    * print response

    Examples:
      | id |
      | 3  |
      ##| 6  |
      ##| 10 |
      ##| 11 |