/**
* @author Henrique Nitatori - Topi
*/
public class SistemaLegaResponseSuccess extends Middleware {

    override
    public Project__c check(Integer statusCode, String payload, Project__c project) {
        if(statusCode == 200) {
            project.LastSyncDate__c = DateTime.now();
            project.SynchronizationStatus__c = 'Integrado com sucesso';
            return project;
        }
        return checkNext(statusCode, payload, project);
    }

}