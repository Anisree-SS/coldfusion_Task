<cfcomponent>
    <cffunction name="showData" access="public" returnType="string">
        <cfargument name="excelFile" type="any" required="true">
        <cfspreadsheet action="read" src="#variables.FilePath#" name="htmldata" format = "html" > 
        <cfreturn htmldata>
    </cffunction>

    <cffunction name="checkData" access="public" returnFormat="Json">
        <cfargument name="excelFile" type="any" required="true">
        <cfset variables.FileUploadpath=Expandpath("./assets/files/")>
        <cffile action="upload" destination="#variables.FileUploadpath#" nameConflict="MakeUnique">
        <cfset variables.fileName=cffile.serverFile>
        <cfset variables.FilePath=variables.FileUploadpath&variables.fileName>
        <cfspreadsheet action="read" src="#variables.FilePath#" name="excelHeader" format ="csv"  rows="1"> 
        <cfset sqlNewList=("Name,Age,Role")>
        <CFSET allHeader = Listappend(trim(excelHeader),sqlNewList)>
        <cfset ListRemoveDuplicate=(ListRemoveDuplicates(allHeader,",",true))>
        <cfif (ListLen(sqlNewList) EQ ListLen(ListRemoveDuplicate)) AND (ListLen(sqlNewList) EQ ListLen(trim(excelHeader)))>
            <cfreturn {"success":true,"data":variables.FilePath}>
            <cfelse>
                <cfreturn {"success":false,"data":"The excel sheet uploaded is wrong"}>            
        </cfif>
    </cffunction>
</cfcomponent>
