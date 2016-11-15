public with sharing class ContactCtrl 
{

    public LookupValue orderValue {get;set;}
    public LookupValue contractValue {get;set;}
	public LookupValue carValue {get;set;}

	public Contact record;

    public ContactCtrl(ApexPages.StandardController stdController) 
    {
    	stdController.addFields(new List<String>{'AccountId', 'Name'});
        this.record = (Contact)stdController.getRecord();

        //initialize advanced lookup's value
        this.orderValue = new LookupValue();
        this.carValue = new LookupValue();
        this.contractValue = new LookupValue();
    }

    public void refresh()
    {

    }

}