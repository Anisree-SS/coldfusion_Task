<cfcomponent>
    <cffunction name = "getData" access = "public" returnType="query">
        <cfquery name="checkLogin" datasource = "demo">
            select userId,userName,password,role from loginTable
        </cfquery>
        <cfreturn checkLogin>
    </cffunction>
</cfcomponent>