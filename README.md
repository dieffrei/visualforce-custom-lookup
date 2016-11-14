# Custom Lookup for Visualforce

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
		<apex:sectionHeader title="MyHeaderTitle" subtitle="MyHeaderSubTitle" />
		<apex:pageBlock title="MyPageBlockTitle" mode="edit">
			<apex:pageBlockButtons location="top">
				<apex:commandButton value="Salvar" action="{!save}" />
			</apex:pageBlockButtons>
			<apex:pageBlockSection title="MyPageBlockSectionTitle" columns="2">
				
				<apex:inputField value="{!Contact.FirstName}"/>
				<apex:inputField value="{!Contact.LastName}"/>

				<apex:pageBlockSectionItem>
					<apex:outputLabel>Nome da conta</apex:outputLabel>
					<c:Lookup record="{!record}" field="AccountId" searchFields="Id,Name,Rating" formFields="Name,Rating"/>
				</apex:pageBlockSectionItem>
				
			</apex:pageBlockSection>
		</apex:pageBlock>
	</apex:form>
</apex:page>
```
