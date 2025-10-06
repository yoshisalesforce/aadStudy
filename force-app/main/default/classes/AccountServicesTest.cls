@isTest
public class AccountServicesTest {
    @TestSetup
    static void makeData(){
        Integer testSize = 3;
        List<Account> acList = new List<Account>();
        for(Integer  i = 0; i < testSize; i++){
            Account ac = new Account(Name = 'Test Account' + i, AnnualRevenue = 1);
            acList.add(ac);
        }
        insert acList;
    }
    @isTest
    static void testPrimaryAccountChecker1(){
        List<Account> acList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Name like 'Test Account%'];
        Test.startTest();
        acList[0].AnnualRevenue = 2;
        acList[1].AnnualRevenue = 10000000;
        update acList;
        Test.stopTest();
        List<Account> updatedAccounts = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :acList];
        System.assertNotEquals(updatedAccounts[0].Name, '*Test Account1');
        System.assertEquals(updatedAccounts[1].Name, '*Test Account2');
    }
    @isTest
    static void testPrimaryAccountChecker2(){
        List<Account> acList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Name like 'Test Account%' limit 1];
        Test.startTest();
        acList[0].AnnualRevenue = 11;
        try {
            update acList;
        } catch (Exception e ) {
            system.assert(e.getMessage().contains('プライマリ取引先判定でエラーが発生しました。'));
        }
        Test.stopTest();
    }
}