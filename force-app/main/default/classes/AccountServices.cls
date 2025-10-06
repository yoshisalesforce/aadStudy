public class AccountServices {
    public static Boolean firstRun = true;
    public class MyException extends Exception {}
    public static void PrimaryAccountChecker(Set<Id> accId){
        firstRun = false;
        List<Account> accList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :accId];
        List<Account> primaryAccount = new List<Account>();
        // Annual Revenueが1,000,000以上の場合、Account Nameの先頭に星をつける
        for(Account ad : accList){
            if(ad.AnnualRevenue >= 1000000){
                ad.Name = '*' + ad.Name;
                primaryAccount.add(ad);
            }
            if(ad.AnnualRevenue == 11){
                ad.Name = '';
                primaryAccount.add(ad);
            }
        }
        if(!primaryAccount.isEmpty()){
            try {
                update primaryAccount;
            } catch (Exception e) {
                System.debug(e.getMessage());
                throw new MyException('プライマリ取引先判定でエラーが発生しました。', e);
            }

        }
    }
}