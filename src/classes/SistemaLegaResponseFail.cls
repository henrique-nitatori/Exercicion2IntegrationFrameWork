/**
* @author Henrique Nitatori - Topi
*/
public class SistemaLegaResponseFail extends Middleware {

    override
    public Project__c check(Integer statusCode, String payload, Project__c project) {
        if(statusCode == 400) {
            ResponseSistemaLegadoFail responseFail = (ResponseSistemaLegadoFail) 
                JSON.deserialize(payload, ResponseSistemaLegadoFail.class);
            project.ErrorMessage__c = responseFail.errorMessage;
            return  project;
        }
        return checkNext(statusCode, payload, project);
    }

}