public with sharing class LookupCtrl {


	public SObject recordAttr {get;set;}
	public String fieldAttr {get;set;}
	public String componentId {get;set;}

	public LookupCtrl() {
		this.componentId = 'custom_lookup_' + LookupLocator.id++;
	}

	public String getSObjectName(){
		return this.recordAttr
						.getSObjectType()
							.getDescribe()
							.fields
							.getMap()
								.get(fieldAttr)
								.getDescribe()
								.getReferenceTo()[0]
								.getDescribe().getName();
		}

}
