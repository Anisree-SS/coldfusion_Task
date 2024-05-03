<cfscript>
    cfparam(name="url.action", default="upload", pattern="");
    switch(lcase(url.action)){
        case "upload":
            include "/controllers/excelDataAction.cfm";
            include "/views/excelData.cfm";
        break;
    }
</cfscript>