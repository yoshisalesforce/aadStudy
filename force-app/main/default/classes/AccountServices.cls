public class AccountServices {
    public static Boolean firstRun = true;
    public static void PrimaryAccountChecker(List<Account> newList){
        // Annual Revenueが1,000,000以上の場合、Account Nameの先頭に星をつける
        for(Account ad : newList){
            if(ad.AnnualRevenue >= 1000000){
                ad.Name = '*' + ad.Name;
            }
        }
        firstRun = false;
    }
}