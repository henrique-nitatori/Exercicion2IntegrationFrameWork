/**
* @author Henrique Nitatori - Topi
*/
public class SistemaLegadoFailHttpMock implements HttpCalloutMock {
    String payload;

    public SistemaLegadoFailHttpMock (String payload) {
        this.payload = payload;
    }
    public HttpResponse respond (HttpRequest request) {
        HttpResponse response = new HttpResponse();

        response.setBody (payload);
        response.setStatusCode (400);

        return response;
    }

}