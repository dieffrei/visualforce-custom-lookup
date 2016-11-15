# Custom Lookup for Visualforce
This visualforce component allows you to add lookup field widget without have a Sobject field reference and add new button feature

<a href="https://githubsfdeploy.herokuapp.com?owner=dieffrei&repo=visualforce-custom-lookup">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

## Dynamic visualforce lookup using lookup field

```
<c:Lookup record="{!record}" 
	field="AccountId" 
	searchFields="Name,Rating,BillingCity" 
	formFields="Name,Rating,BillingStreet,BillingState,BillingPostalCode,BillingCountry"
	canCreate="true"/>
```

## Dynamic visualforce lookup without field
```
<c:AdvancedLookup 
	sObjectName="Lead"
	value="{!leadValue}" 
	searchFields="Name,LastName,Company" 
	formFields="Name,LastName,Company"
	canCreate="true"/>

```

## Visualforce example
```
<apex:page showHeader="true" sidebar="false" standardController="Contact" extensions="ContactCtrl">
	<apex:form>
		<apex:sectionHeader title="Contact Edit" subtitle="New Contact" />
		<apex:pageBlock title="Contact Edit" mode="edit">
			<apex:pageBlockButtons location="top">
				<apex:commandButton value="Save" action="{!save}" />
				<apex:commandButton value="Cancel" action="{!cancel}" />
			</apex:pageBlockButtons>
			<apex:pageBlockSection title="Contact Information" columns="2">
				
				<apex:inputField value="{!Contact.FirstName}"/>
				<apex:inputField value="{!Contact.LastName}"/>

				<apex:pageBlockSectionItem>
					<apex:outputLabel>{!$ObjectType.Contact.fields.AccountId.Label}</apex:outputLabel>
					<c:Lookup record="{!record}" 
						field="AccountId" 
						searchFields="Name,Rating,BillingCity" 
						formFields="Name,Rating,BillingStreet,BillingState,BillingPostalCode,BillingCountry"
						canCreate="true"/>
				</apex:pageBlockSectionItem>


				<apex:pageBlockSectionItem>
					<apex:outputLabel>Lead</apex:outputLabel>
					<c:AdvancedLookup 
						sObjectName="Lead"
						value="{!leadValue}" 
						searchFields="Name,LastName,Company" 
						formFields="Name,LastName,Company"
						canCreate="true"/>
				</apex:pageBlockSectionItem>
				

			</apex:pageBlockSection>
		</apex:pageBlock>
	</apex:form>
</apex:page>
```

## Visualforce controller example
```
public with sharing class ContactCtrl {

	public LookupValue leadValue {get;set;}

	public Contact record;

    public ContactCtrl(ApexPages.StandardController stdController) {
    	stdController.addFields(new List<String>{'AccountId', 'Name'});
        this.record = (Contact)stdController.getRecord();

        //initialize advanced lookup value
        this.leadValue = new LookupValue('Lead Test', 'lead_test_value');
    }

}
```

# Knowed issues
> No such column 'LastViewedDate' on entity

According to salesforce support, LastViewedDate is only available for those Custom Objects has custom tab,
So to enable recent viewed record, you need to do this workaround
https://help.salesforce.com/apex/HTViewSolution?id=000230533&language=en_US
