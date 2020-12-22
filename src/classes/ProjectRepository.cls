/**
* @author Henrique Nitatori - Topi
*/
public class ProjectRepository {

    public List<Project__c> create(List<Project__c> projects) {
        insert projects;
        return projects;
    }

    public List<Project__c> projectUpdate(List<Project__c> projects) {
        update projects;
        return projects;
    }

    public List<Project__c> findProjectBydId(Set<Id> id) {
        return [ SELECT ProjectName__c, Id, Status__c, StartDate__c, EndDate__c, Budget__c, Type__c FROM Project__c
                 WHERE Id IN :id];

    }

}