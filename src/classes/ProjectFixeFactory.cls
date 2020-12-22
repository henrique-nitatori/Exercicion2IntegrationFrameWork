/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class ProjectFixeFactory {
  
  public static Project__c newProject() {
        return newDefaultProject();
    }

    public static Project__c newProject(String projectName, String projectStatus) {
        return new Project__c( 
            ProjectName__c = projectName
            , Status__c = projectStatus
            , StartDate__c = Date.today()
            , EndDate__c = Date.today().addDays(30)
            , Budget__c = 200000.00
            , ErrorMessage__c = ''
            , Type__c = 'Enterprise'
            , ExternalId__c	 = '01232139123812'
        );
    }

    public static Project__c createProject() {
        return createProject(newProject());
    }

    public static Project__c createProject(String projectName, String projectStatus) {
        return createProject(newProject(projectName, projectStatus));
    }

    public static Project__c createProject(Project__c project) {
        insert project;
        return project;
    }
    public static Project__c newDefaultProject () {
        String payload = '{ "ProjectName__c" : "TopiRun2020", "code" : "2424232", "Status__c" : "Iniciado", "StartDate__c" : "2020-01-01", "EndDate__c" : "2020-12-01", "Budget__c" : 200000.00, "ErrorMessage__c" : "", "ExternalId__c" : "01232139123812", "LastSyncDate__c" : "",  "SynchronizationStatus__c" : "", "Type__c" : "Enterprise"}';
        return fromJson(payload);
    }

    public static Project__c fromJson(String payload) {
        return (Project__c) JSON.deserialize(payload, Project__c.class);
    }

}