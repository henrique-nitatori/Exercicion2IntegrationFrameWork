/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class PutProjectOutBoundServiceTest {
    @isTest
    public static void givenSendProjectWhenPostProjectForSistemaLegadoThenExpectedReturnSucess() {
        String payload = '{ "projectId" : "01932190123" ,"externalId" : "01232139123812" }';

        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new SistemaLegadoSuccessHttpMock(payload));
        Project__c project = new PutProjectOutBoundService().sendProject(ProjectFixeFactory.newProject());
        Test.stopTest();

        System.assertEquals(Datetime.now(), project.LastSyncDate__c);
        System.assertEquals('Integrado com sucesso', project.SynchronizationStatus__c);
    }

    @isTest
    public static void givenSendProjectWhenPostProjectForSistemaLegadoThenExpectedReturnFail() {
        String payload = '{ "errorMessage" : "Invalid Start Date" }';

        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new SistemaLegadoFailHttpMock(payload));
        Project__c project = new PutProjectOutBoundService().sendProject(ProjectFixeFactory.newProject());
        Test.stopTest();

        System.assertEquals('Invalid Start Date', project.ErrorMessage__c);
    }



}