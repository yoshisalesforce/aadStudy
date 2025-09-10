public with sharing class sendMail {
    public static void AppExchangeTrialTemplate() {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>{'yr.980827@gmail.com'};
        mail.setToAddresses(toAddresses); // 送信先(String[])
        mail.setSubject('Hello!'); // 件名(String)
        mail.setPlainTextBody('こんにちは');
        //mail.setOrgWideEmailAddressId('1122yoshiryu@gmail.com'); // 送信元に設定する組織のアドレスID(設定しない場合はApexの実行者が設定される)
        // mail.setSenderDisplayName(displayName); // 送信者表示名。組織のメールアドレス使用時は設定不可。
        mail.setUseSignature(false); // 著名の有無。デフォルトはtrue。
        //mail.setBccSender(true); // 送信者をBCCに追加
        //mail.setReplyTo(replyAddress); // 返信先メールアドレス(String)
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});

    }
}