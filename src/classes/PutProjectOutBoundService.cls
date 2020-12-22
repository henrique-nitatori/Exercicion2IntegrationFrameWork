/**
* @author Henrique Nitatori - Topi
*/
public class PutProjectOutBoundService {

    RequestProjectTransformer requestProjectTransformer;

    public PutProjectOutBoundService() {
        this.requestProjectTransformer = new RequestProjectTransformer();
    }

    public Project__c sendProject(Project__c project) {
        return postProject(project);
    }

    private Project__c postProject(Project__c project) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://run.mocky.io/v3/58d750c1-31bf-45ae-b361-bedecacf55a2');
        request.setMethod('PUT');
        request.setBody(JSON.serialize(this.requestProjectTransformer.toRequestProject(project)));
        Http htpp = new Http();
        
        HttpResponse response = htpp.send(request);

        String payload = response.getBody();

        return new MiddlewareRun().run(response.getStatusCode(), payload, project);
    }

}