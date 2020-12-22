/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class MiddlewareRunTest {
    @isTest
    public static void givenMiddlewareRunWhenSetResponseCode200ThenExpectedProject() {
        String payload = '{ "name" : "TopiRun2020" "code" : "2424232" "status" : "Iniciado" "startDate" : "2020-01-01" "endDate" : "2020-12-01" "budget" : 200000.00 }';
        Project__c project = new MiddlewareRun().run(200, payload, ProjectFixeFactory.newProject());

        System.assertEquals('Integrado com sucesso', project.SynchronizationStatus__c);
        System.assertEquals(DateTime.now(), project.LastSyncDate__c);
    }

    @isTest
    public static void givenMiddlewareRunWhenSetResponseCode400ThenExpectedProject() {
        String payload = '{ "errorMessage" : "Invalid Start Date" }';
        Project__c project = new MiddlewareRun().run(400, payload, ProjectFixeFactory.newProject());

        System.assertEquals('Invalid Start Date', project.ErrorMessage__c);
    }
}