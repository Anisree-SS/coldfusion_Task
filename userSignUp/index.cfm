<cfscript>
    cfparam(name="url.action", default="", pattern="");
    switch(lcase(url.action)){
        case "signUp":
            include "/controllers/signUpAction.cfm";
            include '/views/header.cfm';
            include "/views/signUp.cfm";
        break;
        default:
            include "/views/signUp.cfm";
        break;
    }
</cfscript>