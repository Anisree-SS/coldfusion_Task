<cfscript>
    cfparam(name="url.action", default="", pattern="");

    switch(lcase(url.action)){
        case "main":
            include "/controllers/main/mainAction.cfm";
            include "/views/main.cfm";
        break;

        case "view":
           include "/views/welcome.cfm";
        break;

        case "signUp":
            include "/views/addUser.cfm";
        break;
        // The provided event could not be matched.
        default:
           // throw( type="InvalidEvent" );
           include "/views/welcome.cfm";
        break;
    }
</cfscript>