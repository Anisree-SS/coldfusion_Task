<cfset variables.errorMsg={}>
<cfset variables.errorMsg.class=''>
<cfset variables.errorMsg.msg=''>

<cfset variables.msg={}>
<cfif StructKeyExists(form,"submit")>
    <cfset local.errorObj=createObject("component","controllers.signUp")>
    <cfset local.msg=local.errorObj.validation(form.strFullName,form.strUserName,form.strPassword,form.strConfirmPassword,form.strRole)>
    <cfif local.msg.success>
        <cfset local.msg=local.errorObj.checkUserExists(form.strUserName)>
        <cfif local.msg.success>
            <cfset local.msg=local.errorObj.addUser(form.strUserName,form.strPassword,form.strRole,form.strFullName)>
            <cfset variables.errorMsg=local.msg>
        <cfelse>
            <cfset variables.errorMsg=local.msg>
        </cfif>
    <cfelse>
        <cfset variables.errorMsg=local.msg>
    </cfif>
</cfif>

