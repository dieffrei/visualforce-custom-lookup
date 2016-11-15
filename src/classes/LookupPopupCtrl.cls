public with sharing class LookupPopupCtrl 
{

	public String mode {get;set;} // RECENT | SEARCH | NEW

	public String searchTerm {get;set;} 
	public List<SObject> records {get;set;}
	public List<String> searchFields {get;set;}
	public List<String> formFields {get;set;}
	public String sObjectName {get;set;}
	public String mainField {get;set;}
	public String whereClause {get;set;}
	public String componentId {get;set;}
	public String selectedId {get;set;}
	public Boolean canCreate {get;set;}

	public SObject recordNew {get;set;}

	public LookupPopupCtrl() 
	{	
		this.mode = 'RECENT';
		this.mainField = 'Name';
		this.sObjectName = ApexPages.currentPage().getParameters().get('sObjectName');
		this.searchFields = ApexPages.currentPage().getParameters().get('searchFields').split(',');
		this.formFields = ApexPages.currentPage().getParameters().get('formFields').split(',');
		this.whereClause = ApexPages.currentPage().getParameters().get('where');
		this.searchTerm = ApexPages.currentPage().getParameters().get('searchTerm');
		this.componentId = ApexPages.currentPage().getParameters().get('componentId');
		this.selectedId = ApexPages.currentPage().getParameters().get('selectedId');
		this.canCreate = Boolean.valueOf(ApexPages.currentPage().getParameters().get('canCreate'));

		if(this.searchTerm != null)
		{
			this.search();
		}
		loadRecentlyViewedRecords();
	}

	public void loadRecentlyViewedRecords()
	{
		String fieldList = String.join(this.searchFields, ',');
		List<String> likeExpressions = new List<String>();
		for (String f : this.searchFields)
		{
			likeExpressions.add(f + ' LIKE \'%' + this.searchTerm + '%\'');
		}
		String query = 'SELECT ' + fieldList + ' FROM ' + this.sObjectName + ' WHERE (LastViewedDate != null) ORDER BY LastViewedDate DESC LIMIT 10';
		System.debug('***' + query);
		this.records = Database.query(query);
	}

	public void search()
	{
		this.mode = 'SEARCH';

		if (String.isEmpty(this.searchTerm))
		{
 			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Digite um termo para efetuar a busca.'));
 			return;
		}

		if (this.searchTerm.length() <= 1)
		{
 			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Termo de pesquisa ter ao menos 2 caracteres.'));
 			return;
		}

		try 
		{
			this.records = Search.query(this.buildQuery())[0];
		}
		catch(DmlException ex)
		{
 			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING, ex.getDmlMessage(0)));
		} catch(Exception ex)
		{
 			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING, ex.getMessage()));
		}

	}

	public String buildQuery()
	{	
		String fieldList = String.join(this.searchFields, ',');
		String fieldListExpr = (this.whereClause != null)  
								? fieldList + ' WHERE ' + this.whereClause 
								: fieldList;
		return 'FIND \'' + this.searchTerm + '\' IN ALL FIELDS RETURNING ' + this.sObjectName + '(' + fieldListExpr + ') LIMIT 10';
	}

	public PageReference newRecord(){
		this.mode = 'NEW';
		this.recordNew = Schema.getGlobalDescribe().get(sObjectName).newSObject();
		return null;
	}

	public PageReference saveNewRecord(){
		insert this.recordNew;
		return null;
	}

}