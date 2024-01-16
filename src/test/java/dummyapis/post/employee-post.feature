Feature: Como usuario de "http://dummy.restapiexample.com/"
  quiero registrar un nuevo empleado en el sistema,
  para registrar su informacion personal como sueldo y edad

  Background:
    * def dataToSend = read('classpath:ui/models/employeeRequest.json')
    * def responseValidate = read('classpath:ui/assertions/responseBody/postResponse.json')
    * def messageValidate = read('classpath:ui/questions/apimessage.json')

  @Integracion
  Scenario Outline: [TEST-03] Crear un nuevo registro de empleado en el sistema
    Given url host
    And path '/create'
    And request dataToSend.employeeData
    When method POST
    Then status 200
    Then match $.status == 'success'
    Then match $.message == messageValidate.postMessage.message
    Then match response == responseValidate
    * print response

    Examples:
      | name    | salary | age |
      | Juanito | 3000   | 40  |
      ##| Pepito  | 1000   | 20  |

