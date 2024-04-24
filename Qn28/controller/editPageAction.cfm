<cfset variables.intPageId=0>
<cfset variables.strName=''>
<cfset variables.strDescription=''>
<cfset variables.strEditMsg=''>
<cfset variables.strError =''> 
<cfif structKeyExists(url,"pageId")>
    <cfset variables.intPageId=url.pageId>
    <cfset variables.qryCheckRow=createObject("component","CFC.pages").getPages(url.pageId)>
    <cfset variables.strName=variables.qryCheckRow.pageName>
    <cfset variables.strDescription=variables.qryCheckRow.pageDes>
</cfif>
<cfset variables.strHeading=structKeyExists(variables,"intPageId") AND variables.intPageId GT 0 ?"Edit Page":"Add Page">