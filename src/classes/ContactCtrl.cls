public with sharing class ContactCtrl 
{

	public LookupValue carValue {get;set;}

	public Contact record;

    public ContactCtrl(ApexPages.StandardController stdController) 
    {
    	stdController.addFields(new List<String>{'AccountId', 'Name'});
        this.record = (Contact)stdController.getRecord();
        this.record.FirstName = 'Diéffrei';
        this.record.LastName = 'Quadros';
        this.record.Email = 'dieffrei@gmail.com';

        //initialize advanced lookup's value
        this.carValue = new LookupValue();
    }

    public void refresh()
    {

    }

}