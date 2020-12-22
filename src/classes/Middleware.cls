/**
* @author Henrique Nitatori - Topi
*/
public abstract class Middleware {
    private Middleware next;

    public Middleware linkWith(Middleware next) {
        this.next = next;
        return next;
    }


    public abstract Project__c check(Integer statusCode, String payload, Project__c project);


    protected Project__c checkNext(Integer statusCode, String payload, Project__c project) {
        if (next == null) {
            return project;
        }
        return next.check(statusCode, payload, project);
    }
}