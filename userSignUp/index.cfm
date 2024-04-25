<cfscript>
    cfparam(name="url.action", default="", pattern="");
    switch(lcase(url.action)){
        case "main":
            include "/views/main.cfm";
        break;
        default:
           include "/views/main.cfm";
        break;
    }
</cfscript>