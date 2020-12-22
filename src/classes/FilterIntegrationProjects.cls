/**
* @author Henrique Nitatori - Topi
*/
global class FilterIntegrationProjects {

    @future (callout=true)
    public static void filterProjectTypeAndStatus(Set<Id> projectsId) {
        List<Project__c> projectsUpdated = new List<Project__c>();
        String typeFilter = 'Enterprise';
        String statusFilter = 'Iniciado';

        ProjectRepository projectRepository = new ProjectRepository();

        for(Project__c project : projectRepository.findProjectBydId(projectsId)) {
            if(project.Status__c.equals(statusFilter) && project.Type__c.equals(typeFilter)) {
                projectsUpdated.add( new PutProjectOutBoundService().sendProject(project) );
            }
        }
        projectRepository.projectUpdate(projectsUpdated);
    }   
}