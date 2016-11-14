# visualforce-custom-lookup

## Dynamic visualforce lookup

```
<c:Lookup record="{!record}" 
        field="AccountId" 
        searchFields="Id,Name,Rating" 
        formFields="Name,Rating"/>
```

## visualforce example
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
