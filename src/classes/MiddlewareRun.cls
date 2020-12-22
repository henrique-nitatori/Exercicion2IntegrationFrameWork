/**
* @author Henrique Nitatori - Topi
*/
public class MiddlewareRun {

    public Project__c run(Integer statusCode, String response, Project__c project) {
        Middleware middleware = new SistemaLegaResponseSuccess();
        middleware.linkWith(new SistemaLegaResponseFail());
        return middleware.check(statusCode, response, project);
    }
}