@isTest
public with sharing class Create2GPPackageTest{
    @isTest
    static void createAccountTest(){
        // Setup test data
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='standardextentiauser@squirro.com');
        Test.startTest();
        System.runAs(u) {
            // The following code runs as user 'u' 
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());
            Id accId = Create2GPPackage.createAccount();
            System.assertNotEquals(null, accId);
        }
        Test.stopTest();
    }
        
}