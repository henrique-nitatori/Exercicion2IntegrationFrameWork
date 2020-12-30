/**
* @author Henrique Nitatori - Topi
*/
public class FilterProject {

    ProjectRepository projectRepository;

    public FilterProject() {
        this.projectRepository = new ProjectRepository();
    }

    public void filterIntegrationProject(Set<Id> projectsId) {
        String typeFilter = 'Enterprise';
        String statusFilter = 'Iniciado';

        for(Project__c project : projectRepository.findProjectBydId(projectsId)) {
            if(project.Status__c.equals(statusFilter) && project.Type__c.equals(typeFilter)) {

                new EventBuilder().createOutboundEventFor('POST_PROJECT')
                .forObjectId('a054x000000ampaAAA')
                .withReceiver('GATEWAY')
                .withBusinessDocumentNumber(project.Id)
                .buildAndSave();

            }
        }
    }
}