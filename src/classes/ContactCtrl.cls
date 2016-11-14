public with sharing class ContactCtrl {

	public Contact record;

    public ContactCtrl(ApexPages.StandardController stdController) {
    	stdController.addFields(new List<String>{'AccountId', 'Name'});
        this.record = (Contact)stdController.getRecord();
    }

}