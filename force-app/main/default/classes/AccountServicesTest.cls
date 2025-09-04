@isTest
public class AccountServicesTest {
    @TestSetup
    static void makeData(){
        Account ac1 = new Account(Name = 'Test Account1', AnnualRevenue = 1);
        Account ac2 = new Account(Name = 'Test Account2', AnnualRevenue = 1);
        List<Account> acList = new List<Account>{ac1, ac2};
        insert acList;
    }
    @isTest
    static void testPrimaryAccountChecker(){
        List<Account> acList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Name = 'Test Account1' OR  Name = 'Test Account2'LIMIT 2];
        Test.startTest();
        acList[0].AnnualRevenue = 2;
        acList[1].AnnualRevenue = 10000000;
        update acList;
        Test.stopTest();
        List<Account> updatedAccounts = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :acList];
        System.assertNotEquals(updatedAccounts[0].Name, '*Test Account1');
        System.assertEquals(updatedAccounts[1].Name, '*Test Account2');
    }
}