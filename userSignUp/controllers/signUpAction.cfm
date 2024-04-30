<cfscript>
variables.errorMsg={};
variables.errorMsg.class='';
variables.errorMsg.msg='';
variables.errorObj = createObject("component","controllers.signUp");
if(StructKeyExists(form,"submit")){
    local.resultfrt = variables.errorObj.validation(strFullName = form.strFullName,strUserName = form.strUserName,strPassword = form.strPassword,strConfirmPassword = form.strConfirmPassword,strRole = form.strRole);
    if(local.resultfrt.success){
        local.resultSnd = variables.errorObj.checkUserExists(strUserName = form.strUserName);
        if (local.resultSnd.success){
            local.resultTrd = variables.errorObj.addUser(strUserName = form.strUserName,strPassword = form.strPassword,strRole = form.strRole,strFullName = form.strFullName);
            variables.errorMsg = local.resultTrd;
        }
        else
            variables.errorMsg = local.resultSnd;
    }
    else
        variables.errorMsg = local.resultfrt;
}
</cfscript>

