<cfcomponent>
    <cffunction name="init" returntype="void">
        <cfset i = 1>
    </cffunction>
    
    <!--- Do Login --->
    <cffunction name="doLogin" access="remote" returntype="query">
        <cfargument name="struserName" required="true" type="string">
        <cfargument name="strpassword" required="true" type="string">
        <cfquery name="checkLogin" result="loginCheck">
            select userId,userName,password,role,fullName 
            from loginTable
            where userName=<cfqueryparam value="#arguments.struserName#" cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value="#arguments.strpassword#" cfsqltype="cf_sql_varchar"> 
        </cfquery>
        <cfreturn checkLogin>
    </cffunction>

    <!--- For get Table --->
    <cffunction name="getPages" access="remote" returntype="query">
        <cfargument name="pageId" type="numeric">
        <cfquery name="forDisplay">
            select pageId,pageName,pageDes 
            from page
            <cfif structKeyExists(arguments,"pageId")>
                where pageId =<cfqueryparam value="#arguments.pageId#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfreturn forDisplay>
    </cffunction>

    <!--- Save Page --->
    <cffunction name="savePage" access="remote" returnformat="json">
        <cfargument name="strpageName" required="true" type="string">
        <cfargument name="strpageDes" required="true" type="string">
        <cfargument name="intpageId" required="true" type="numeric">
        <cfif arguments.intpageId GT 0>
            <cfquery name="updatePage">
                update page set pageName=<cfqueryparam value="#arguments.strpageName#" cfsqltype="cf_sql_varchar">,
                pageDes=<cfqueryparam value="#arguments.strpageDes#" cfsqltype="cf_sql_varchar">
                where pageId=<cfqueryparam value="#arguments.intpageId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn {"success":true, "msg":"Page updated successfully"}>
            <cfelse>
                <cfquery name="insertRow">
                    insert into page (pageName,pageDes)
                    values(
                        <cfqueryparam value="#arguments.strpageName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.strpageDes#" cfsqltype="cf_sql_varchar">
                    )
                </cfquery>
                <cfreturn {"success":true,"msg":"Page inserted successfully"}>
        </cfif>
    </cffunction>

    <!--- check Page --->
    <cffunction name='checkPage' access="remote" returnformat="json">
        <cfargument name="intpageId" required="true" type="numeric">
        <cfargument name="strpageName" required="true" type="string">
        <cfquery name="pageCheck">
            select pageName 
            from page
            where pageName=<cfqueryparam value="#arguments.strpageName#" cfsqltype="cf_sql_varchar">
            AND pageID !=<cfqueryparam value="#arguments.intpageId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfif pageCheck.recordCount>
            <cfreturn {"success":false, "msg":"The page is already present"}>
            <cfelse>
            <cfreturn {"success":true, "msg":""}>
        </cfif>
    </cffunction>

    <!--- Delete Row --->
    <cffunction name="deletePage" access="remote" returnformat="json">
        <cfargument name="intpageId" required="true" type="numeric">
        <cfquery name="delete">
            delete from page
            where pageId=<cfqueryparam value="#arguments.intpageId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn {"success":true}>
    </cffunction>
</cfcomponent>