public with sharing class ContactCtrl {

	public LookupValue leadValue {get;set;}
	public LookupValue carValue {get;set;}

	public Contact record;

    public ContactCtrl(ApexPages.StandardController stdController) {
    	stdController.addFields(new List<String>{'AccountId', 'Name'});
        this.record = (Contact)stdController.getRecord();

        //initialize advanced lookup's value
        this.leadValue = new LookupValue('Lead Test', 'lead_test_value');
        this.carValue = new LookupValue('', '');
    }

}