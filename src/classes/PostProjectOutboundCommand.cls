/**
* @author Henrique Nitatori - Topi
*/
public class PostProjectOutboundCommand extends AbstractUpdateableOutboundCommand {

    RequestProjectTransformer requestProjectTransformer;
    ProjectRepository projectRepository;
    Project__c project;

    public PostProjectOutboundCommand() {
        this.requestProjectTransformer = new RequestProjectTransformer();
        this.projectRepository = new ProjectRepository();
    }

    override
    public void preExecute() {
        List<Project__c> projects = this.projectRepository.findBydId(event.getBusinessDocumentNumber());
        this.project = projects[0];
        targetObject = transformToSend();
    }

    override
    public Object transformToSend() {
        return this.requestProjectTransformer.toRequestProject(project);
    }

    override
    public void processResult(Object responseObject) {
    }

    override
    public void postUpdateExecute() {
        String projectUpdatedStatus = 'Integrado com sucesso';
        this.project.SynchronizationStatus__c = projectUpdatedStatus;
        this.projectRepository.projectUpdate(new List<Project__c>{project});
    }

    override
    public BaseRestProxy getHttpRequestProxy(EventQueue eventQueue) {
        return new RestProxy( event );
    }
}