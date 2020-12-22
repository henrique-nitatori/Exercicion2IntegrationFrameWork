/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class ProjectRepositoryTest {
    @isTest
    public static void givenCreateWhenObjectProjectWhenExpectedListProjetc() {
        List<Project__c> projects = new List<Project__c> {
            ProjectFixeFactory.newProject()
        };

        List<Project__c> projectsCreated = new ProjectRepository().create(projects);

        System.assertEquals(1, projectsCreated.size());
    }

    @isTest
    public static void givenProjectUpdateWhenObjectProjectWhenExpectedListProjetc() {
        String payload = '{ "projectId" : "01932190123" ,"externalId" : "01232139123812" }';

        Project__c project = ProjectFixeFactory.createProject(ProjectFixeFactory.newProject('TestProject', 'Iniciado'));

        project.ProjectName__c = 'TestProjectUpdated';
        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new SistemaLegadoSuccessHttpMock(payload));
        List<Project__c> projectsCreated = new ProjectRepository().projectUpdate(new List<Project__c>{project});
        Test.stopTest();

        System.assertEquals('TestProjectUpdated', projectsCreated[0].ProjectName__c);
    }

    @isTest
    public static void givenProjectUpdateWhenUpdateTypeAndStatusWhenExpectedProjectObject() {
        Project__c project = ProjectFixeFactory.createProject(ProjectFixeFactory.newProject('TestProject', 'Iniciado'));
        String payload = '{ "projectId" : "01932190123" ,"externalId" : "01232139123812" }';

        project.Status__c = 'Iniciado';
        project.Type__c = 'Enterprise';

        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new SistemaLegadoSuccessHttpMock(payload));
        List<Project__c> projectsUpdated = new ProjectRepository().projectUpdate(new List<Project__c>{project});
        Test.stopTest();

        System.assertEquals(1, projectsUpdated.size());

    }
}