public with sharing class Create2GPPackage{

    public static Id createAccount(){
        Account accToCreate = new Account(Name='Test');
        try{
            Insert accToCreate;
        }Catch(Exception ex){
            System.debug('Error '+ex.getMessage());
        }
        return accToCreate.Id;
    }

}