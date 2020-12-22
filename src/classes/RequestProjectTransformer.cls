/**
* @author Henrique Nitatori - Topi
*/
public class RequestProjectTransformer {

    public RequestProject toRequestProject(Project__c project) {

        RequestProject requestProject = new RequestProject();
        requestProject.name = project.ProjectName__c;
        requestProject.code = project.Id;
        requestProject.status = project.Status__c;
        requestProject.startDate = project.StartDate__c;
        requestProject.endDate = project.EndDate__c;
        requestProject.budget = project.Budget__c;

        return requestProject;
    }
}