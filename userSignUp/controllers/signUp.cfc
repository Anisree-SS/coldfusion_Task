component {
    remote any function validation() returnFormat="json"{

        local.errorMsg='';
        var regexPassword = '^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]+$';
        if(len(trim(strFullName)) EQ 0 OR len(trim(strUserName)) EQ 0 OR len(trim(strPassword)) EQ 0 OR len(trim(strConfirmPassword)) EQ 0 OR len(trim(strRole)) EQ 0){
            local.errorMsg &="All fields required<br>";
        }
        if(REFind('\d', strFullName)){
            local.errorMsg &="Full name should be in string<br>";
        }
        if(REFind('\d', strUserName)){
            local.errorMsg &="User name should be in string<br>";
        }
        if(!REfind(regexPassword,strPassword) AND (len(trim(strPassword)))NEQ 0){
            local.errorMsg &="Password should contain all type values<br>";
        }

        if(strPassword NEQ strConfirmPassword AND len(trim(strConfirmPassword) NEQ 0)){
            local.errorMsg &="Password is not matching<br>";
        }
        if(local.errorMsg EQ ''){
           return {"success":true};
        }
        else{
            return {"success":false,"msg":local.errorMsg,class:"error"};
        }
    }

    remote any function checkUserExists(strUserName) returnFormat="json"{
        local.checkObj=createObject("component","models.signUp").checkUserExists(strUserName);
        if(local.checkObj){
            return {"success":true};
        }
        else{
            return {"success":false,"msg":"User name already present", class:"error"};
        }
    }

    remote any function addUser(strUserName,strPassword,strRole,strFullName) returnFormat="json"{
        local.strPassword=Hash(arguments.strPassword,"MD5");
        local.checkObj=createObject("component","models.signUp").addUser(strUserName,local.strPassword,strRole,strFullName);
        if(local.checkObj){
            return {"success":true,"msg":"successfully added",class:"success"};
        }
        else{
            return {"success":true};
        }
    }
}