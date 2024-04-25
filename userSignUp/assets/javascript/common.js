$(document).ready(function() {
    $('#signUpForm').on("submit",function() {
        var strFullName = $('#strFullName').val().trim(); 
        var strUserName = $('#strUserName').val().trim();
        var strPassword = $('#strPassword').val().trim();
        var strRole = $('#strRole').val().trim();
        $("#editSuccess").text(""); 
        if(validation()){
            $.ajax({
                url: '../models/pages.cfc?method=checkPage',
                type: 'post',
                data: {strFullName : strFullName,strUserName : strUserName,strPassword : strPassword,strRole:strRole},
                dataType:"json",
                success: function(response) {
                    if(response.success){
    
                    }
                    else{
                        $("#error").html(response.msg);    
                        return false;
                    }
                },
            });
        }
        return false;
    });

    function validation(){
        var strFullName = $('#strFullName').val().trim(); 
        var strUserName = $('#strUserName').val().trim();
        var strPassword = $('#strPassword').val().trim();
        var strRole = $('#strRole').val().trim();
        errorMsg='';
        $("#success").text(""); 
        $("#failMsg").text(""); 
        if(strFullName==''){
            errorMsg+="<br>Full name is required";
        }
        else if(/\d/.test(strFullName)){
            errorMsg+="<br>Full name should be in string"; 
        }

        if(strUserName==''){
            errorMsg+="<br>User name is required";
        }
        else if (/\d/.test(strUserName)){
            errorMsg+="<br>User name should be in string"; 
        }

        if(strPassword ==''){
            errorMsg+="<br>Password is required"; 
        }

        if(strRole==''){
            errorMsg+="<br>Select role";
        }
    
        if(errorMsg !==''){
            $("#failMsg").html(errorMsg);
            return false;
        }
        else{
            $("#success").html(""); 
            return true;
        }
    }
});
