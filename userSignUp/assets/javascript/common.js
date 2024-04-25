$(document).ready(function() {
    $('#signUpForm').on("submit",function() {
        var strUserName = $('#strUserName').val().trim();
        $("#successMsg").text(""); 
        if(validation()){
            $.ajax({
                url: 'controllers/main/main.cfc?method=checkUserName',
                type: 'post',
                data: {strUserName : strUserName},
                dataType:"json",
                success: function(response) {
                    if(response.success){
                        doSave();
                    }
                    else{
                        $("#successMsg").html(response.msg).css("color", "red");    
                        return false;
                    }
                },
            });
        }
        return false;
    });

    function doSave(){
        var strFullName = $('#strFullName').val().trim(); 
        var strUserName = $('#strUserName').val().trim();
        var strPassword = $('#strPassword').val().trim();
        var strRole = $('#strRole').val().trim();
        $("#successMsg").text(""); 
        $.ajax({
            url:'controllers/main/main.cfc?method=doSave',
            type: 'post',
            data:{strUserName:strUserName,strPassword:strPassword,strRole:strRole,strFullName:strFullName},
            dataType:"json",
            success: function(response) {
                if(response.success){
                    $("#successMsg").html(response.msg).css("color","green");
                    setTimeout(function() {
                        $("#successMsg").html("");
                        $("form")[0].reset();
                    },1000);
                }
                else{
                    $("#successMsg").html("something went wrong!!").css("color", "red");    
                }
            },
        });
        return false;
    }

    function validation(){
        var strFullName = $('#strFullName').val().trim(); 
        var strUserName = $('#strUserName').val().trim();
        var strPassword = $('#strPassword').val().trim();
        var strConfirmPassword = $('#strConfirmPassword').val().trim();
        var strRole = $('#strRole').val().trim();
        var specialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
        var alphabets = /[A-z]/g;
        var number = /[0-9]/g;
        errorMsg='';
        $("#successMsg").text(""); 
        var specialCharName = specialChar.test(strFullName);
        var numberName = number.test(strFullName);
        var specialCharUserName = specialChar.test(strFullName);
        var numberUserName = number.test(strFullName);
        if((strFullName=='')||(strUserName=="")||(strPassword=="")||(strConfirmPassword=='')||(strRole=='')){
            errorMsg+="All fields required<br>";
        }
        if(((specialCharName) || (numberName))){
            errorMsg+="Full name should be in string<br>"; 
        }
        if (((specialCharUserName) || (numberUserName))){
            errorMsg+="User name should be in string<br>"; 
        }
        if(strPassword!=''){
            if(strPassword.match(" "))
                errorMsg+="Space is not allowed<br>";
            else{
                var specialChar = specialChar.test(strPassword);
                var  alphabets= alphabets.test(strPassword);
                var number = number.test(strPassword);
                if(!((specialChar) && (alphabets) && (number))){
                    errorMsg+="Password should contain all type values";
                }
            }
        }
        if((strConfirmPassword!='')&&(strConfirmPassword!=strPassword)){
            errorMsg+="Password is not matching<br>";
        }
        if(errorMsg !==''){
            $("#successMsg").html(errorMsg).css("color", "red");
            return false;
        }
        else{
            return true;
        }
    }
});
