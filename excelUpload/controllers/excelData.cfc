<cfcomponent>
    <cffunction name="showData" access="public">
        <cfargument name="excelFile" type="any" required="true">
        <cfset local.path=Expandpath("../assets/")>
        <cffile action="upload" destination="#local.path#" nameConflict="MakeUnique">
        <cfset local.file=cffile.clientFile>
        <cfset local.lastPath=local.path&local.file>
        <cfspreadsheet action="read" src="#local.lastPath#" name="csvdata" format = "csv" > 
        <cfreturn csvdata>
    </cffunction>
</cfcomponent>