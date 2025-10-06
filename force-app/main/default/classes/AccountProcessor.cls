public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountsId) {
        List<Account> accs = [SELECT Id FROM Account WHERE Id IN:accountsId];
        List<Account> accsToUpdate = new List<Account>();
        for(Account acc : accs){
            Integer num = [SELECT COUNT() FROM Contact WHERE AccountId = :acc.Id];
            acc.Number_Of_Contacts__c = num;
            accsToUpdate.add(acc);
        }
        update accsToUpdate;
    }
}