@isTest
public with sharing class AccountProcessorTest {
    @TestSetup
    static void makeData(){
        List<Account> accs = new List<Account>();
        Integer size = 3;
        for(Integer i;i<size;i++){
            Account acc = new Account(Name = 'Test Account'+i);
            accs.add(acc);
        }
        insert accs;
    }
    @isTest
    public static void countContactsTest(){
        Map<Id,Account> accMap = new Map<Id,Account>([SELECT Id FROM Account]);
        List<Id> accIds = new List<Id>(accMap.keySet());
        AccountProcessor.countContacts(accIds);
    }

}