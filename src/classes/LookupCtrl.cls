public with sharing class LookupCtrl {

	public static Integer id = 0;

	public SObject recordAttr {get;set;}
	public String fieldAttr {get;set;}

	public LookupCtrl() {
		LookupCtrl.id++;
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

	public String getComponentId(){
		return 'custom_lookup_' + LookupCtrl.id;
	}

}