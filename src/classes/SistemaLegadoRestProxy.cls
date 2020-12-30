public class SistemaLegadoRestProxy extends RestProxy {

    ProjectRepository projectRepository;

    public SistemaLegadoRestProxy() {
        this.projectRepository = new ProjectRepository();
    }

    public SistemaLegadoRestProxy(EventQueue event) {
        super(event);
    }

    override
    public void handleIntegrationErrorResponse(HttpResponse response){

        if(response.getStatusCode() > 400) {
            ResponseSistemaLegadoFail responseFail = (ResponseSistemaLegadoFail) 
            JSON.deserialize(response.getBody(), ResponseSistemaLegadoFail.class);

            List<Project__c> projects = this.projectRepository.findBydId(event.getBusinessDocumentNumber());
            projects[0].ErrorMessage__c = responseFail.errorMessage;
            this.projectRepository.projectUpdate(projects);
        }
    }
}