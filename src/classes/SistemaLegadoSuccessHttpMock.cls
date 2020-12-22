/**
* @author Henrique Nitatori - Topi
*/
public class SistemaLegadoSuccessHttpMock implements HttpCalloutMock {
    String payload;

    public SistemaLegadoSuccessHttpMock (String payload) {
        this.payload = payload;
    }
    public HttpResponse respond (HttpRequest request) {
        HttpResponse response = new HttpResponse();

        response.setBody (payload);
        response.setStatusCode (200);

        return response;
    }

}