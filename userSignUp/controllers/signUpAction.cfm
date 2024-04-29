<cfset variables.errorMsg={}>
<cfset variables.errorMsg.msg=''>
<cfset variables.errorMsg.class=''>
<cfif StructKeyExists(form, "submit")>
    <cfset local.errorObj=createObject("component","controllers.signUp").validation(form.strFullName,form.strUserName,form.strPassword,form.strConfirmPassword,form.strRole)>
    <cfif local.errorObj.success>
        <cfset variables.errorMsg.msg=''>
        <cfset local.errorObj=createObject("component","controllers.signUp").checkUserExists(form.strUserName)>
        <cfdump var="#local.errorObj#">
        <cfif local.errorObj.success>
            <cfset variables.errorMsg.msg=''>
            <cfset local.errorObj=createObject("component","controllers.signUp").addUser(form.strUserName,form.strPassword,form.strRole,form.strFullName)>
            <cfset variables.errorMsg=local.errorObj>
            <cfelse>
                <cfset variables.errorMsg=local.errorObj>
        </cfif>
        <cfelse>
            <cfset variables.errorMsg=local.errorObj>
    </cfif>
</cfif>

