trigger AccountTrigger on Account (after update) {
  if(AccountServices.firstRun){
    AccountServices.PrimaryAccountChecker(Trigger.new);
  }
}