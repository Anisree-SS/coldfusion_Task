<cfcomponent>
    <cffunction name = "checkUserName" access = "remote" returnFormat="json">
        <cfargument name="strUserName" required="true" type="string">
        <cfquery name="qryCheckUserName" datasource = "demo">
            select 1 from loginTable
            where userName=<cfqueryparam value="#arguments.strUserName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif qryCheckUserName.recordCount>
            <cfreturn {"success":false, "msg":"User name is already present"}>
        <cfelse>
            <cfreturn {"success":true}>
        </cfif>
    </cffunction>

    <cffunction name="doSave" access="remote" returnFormat="json">
        <cfargument name="strUserName" required="true" type="string">
        <cfargument name="strPassword" required="true" type="string">
        <cfargument name="strRole" required="true" type="string">
        <cfargument name="strFullName" required="true" type="string">
        <cfquery name="qrySaveUser" datasource = "demo">
            insert into loginTable(userName,password,role,fullName)
            values(
                <cfqueryparam value="#arguments.strUserName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strPassword#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strRole#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.strFullName#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfreturn {"success":true,"msg":"successfully added "&"#arguments.strUserName#"&" as "&"#arguments.strRole#"}>
    </cffunction>
</cfcomponent>