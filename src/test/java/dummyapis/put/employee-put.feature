Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero poder actualizar un registro de empleado por su ID,
  para actualizar informacion registrada con errores

  Background:
    * def dataToSend = read('classpath:ui/models/employeeRequest.json')
    * def responseValidate = read('classpath:ui/assertions/responseBody/putResponse.json')
    * def messageValidate = read('classpath:ui/questions/apimessage.json')

  @Integracion
  Scenario Outline: [TEST-04] Actualizar un registro de empleado en el sistema
    Given url host
    And path '/update/<id>'
    And request dataToSend.employeeData
    When method PUT
    Then status 200
    Then match $.status == 'success'
    Then match $.message == messageValidate.putMessage.message
    Then match response == responseValidate
    * print response

    Examples:
      | name   | salary | age | id |
      | Maria  | 3000   | 25  | 21 |
      ##| Juana  | 2000   | 20  | 11 |
      ##| Josefa | 2500   | 22  | 12 |
