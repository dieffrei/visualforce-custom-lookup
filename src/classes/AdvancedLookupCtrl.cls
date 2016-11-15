public with sharing class AdvancedLookupCtrl {
	
	public LookupValue valueAttr {get;set;}
	public String componentId {get;set;}

	public AdvancedLookupCtrl() {
		this.componentId = 'custom_lookup_' + LookupLocator.id++;
	}

}