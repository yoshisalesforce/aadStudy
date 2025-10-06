public class AccountServices {
    public static Boolean firstRun = true;
    public static void PrimaryAccountChecker(Set<Id> accId){
        List<Account> accList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :accId];
        List<Account> primaryAccount = new List<Account>();
        // Annual Revenueが1,000,000以上の場合、Account Nameの先頭に星をつける
        for(Account ad : accList){
            if(ad.AnnualRevenue >= 1000000){
                ad.Name = '*' + ad.Name;
                primaryAccount.add(ad);
            }
        }
        firstRun = false;
        if(!primaryAccount.isEmpty()){
            update primaryAccount;
        }
    }
}