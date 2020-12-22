/**
* @author Henrique Nitatori - Topi
*/
public with sharing class ProjectTH extends TriggerHandler{
    List<Project__c> newProjects;
    Map<Id, Project__c> oldProjects;

    public ProjectTH() {
        this ( (List<Project__c>) Trigger.new, (Map<Id, Project__c>) Trigger.oldMap );
    }

    public ProjectTH(List<Project__c> newProjects, Map<Id, Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;
    }

    virtual 
    override 
    public void afterUpdate() {
        if (! System.isFuture () &&! System.isBatch ()) {

            FilterIntegrationProjects.filterProjectTypeAndStatus(oldProjects.keySet());

        }  
    }

}