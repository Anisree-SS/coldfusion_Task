<cfcomponent>
    <cffunction name = "checkUserExists" access = "remote" returnType="boolean">
        <cfargument name="strUserName" required="true" type="string">
        <cfquery name="qryCheckUserName" datasource = "demo">
            select 1 from loginTable
            where userName=<cfqueryparam value="#arguments.strUserName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif qryCheckUserName.recordCount>
            <cfreturn false>
        <cfelse>
            <cfreturn true>
        </cfif>
    </cffunction>

    <cffunction name="addUser" access="remote" returnType="string">
        <cfargument name="strUserName" required="true" type="string">
        <cfargument name="strPassword" required="true" type="string">
        <cfargument name="strRole" required="true" type="string">
        <cfargument name="strFullName" required="true" type="string">
        <cfset local.success = ''>
        <cfquery name="qrySaveUser" datasource = "demo" result="qryAddUser">
            insert into loginTable(userName,password,role,fullName)
            values(
                <cfqueryparam value="#arguments.strUserName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strPassword#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strRole#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strFullName#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cftry>
            <cfif qryAddUser.recordCount>
                <cfset local.success = "true">
            </cfif>
            <cfcatch type="any"> 
                <cfset local.success = "false">
            </cfcatch>
        </cftry>
        <cfreturn local.success>
    </cffunction>
</cfcomponent>