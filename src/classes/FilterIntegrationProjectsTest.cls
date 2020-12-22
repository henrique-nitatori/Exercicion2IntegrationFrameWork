/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class FilterIntegrationProjectsTest {
    @isTest
    public static void givenFilterProjectTypeAndStatusWhenStatusIniciadoAndTypeEnterpriseThenReturnModifyObject() {
        Project__c project = ProjectFixeFactory.createProject( ProjectFixeFactory.newProject() );
        project.Status__c = 'Iniciado';
        project.Type__c = 'Enterprise';

        String payload = '{ "projectId" : "01932190123" ,"externalId" : "01232139123812" }';

        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new SistemaLegadoSuccessHttpMock(payload));
        FilterIntegrationProjects.filterProjectTypeAndStatus(new Set<Id>{project.Id});
        Test.stopTest();

        List<Project__c> projects = [ SELECT Id, SynchronizationStatus__c, LastSyncDate__c FROM Project__c WHERE Id = :project.Id LIMIT 1];


        System.assertEquals(1, projects.size());
        System.assertEquals(DateTime.now(), projects[0].LastSyncDate__c);
        System.assertEquals('Integrado com sucesso', projects[0].SynchronizationStatus__c);
    }
}