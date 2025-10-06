public with sharing class ContactServices {
    public class MyException extends Exception {}
    @InvocableMethod
    public static void createRelatedTaskAndOpportunity(List<Contact> contacts){
        List<Task> tasks = new List<Task>();
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Contact con : contacts){
            Task task = new Task();
            task.WhatId = con.Id;
            task.Subject = 'Contact Task';
            task.Status = 'Not Started';
            tasks.add(task);
            Opportunity opportunity = new Opportunity();
            if(con.Name != 'Yoshida'){
                opportunity.Name = 'Contact Opportunity';
            }
            opportunity.AccountId = con.AccountId;
            opportunity.StageName = 'Prospecting';
            opportunity.CloseDate = Date.today();
            opportunities.add(opportunity);
            }
        SavePoint sp = Database.setSavepoint();
        try{
            insert tasks;
            insert opportunities;
        }catch(DmlException e){
            Database.rollback(sp);
            throw new MyException('お前は吉田だ！', e);
        }
    }
}