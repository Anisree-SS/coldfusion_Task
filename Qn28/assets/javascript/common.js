$(document).ready(function() {
    $('#login').click(function() {
        $("#loginFailMsg").text("");
        var name = $('#name').val().trim(); 
        var password = $('#password').val().trim();
        if (name == ''|| password =='' ){
            $("#loginFailMsg").html('Required user name and password');
            return false;
        }
        $.ajax({
            url: '../controller/pages.cfc?method=doLogin',
            type: 'post',
            data:  {userName: name , password:password},
            dataType:"json",
            success: function(response) {
                if (response.success){
                    $("#success").text('Login successfull !!!!');
                    setTimeout(function() {
                        window.location.href="../view/homePage.cfm";
                    },1000);

                } else {
                    $("#loginFailMsg").text('Invalid user name or password !!!!'); 
                }
            },
        });
        return false;
    });

    $('#editForm').on("submit",function() {
        var pageId = $('#pageId').val().trim(); 
        var pageName = $('#pageName').val().trim();
        $("#editSuccess").text(""); 
        if(validation()){
            $.ajax({
                url: '../models/pages.cfc?method=checkPage',
                type: 'post',
                data: {pageId : pageId, pageName : pageName},
                dataType:"json",
                success: function(response) {
                    if(response.success){
                        doSave();
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

    $('.deleteBtn').click(function() {
        var pageId =$(this).attr("data-id"); 
        var row=$(this);
        if(confirm("Are you sure you want delete the page ?")){
            $.ajax({
                url: '../models/pages.cfc?method=deletePage',
                type: 'post',
                data:  {pageId: pageId},
                dataType:"json",
                success: function(response) {
                    if(response.success){
                        row.parents('tr').remove();
                        //$("#"+pageId).remove();
                    } 
                }, 
            });
            return true;
        }
        else{
            return false;
        }
    });

    function validation(){
        var errorMsg="";
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        if(pageName==''){  
            errorMsg+="<br>Page name is required"; 
        }
        else if (/\d/.test(pageName)) {
            errorMsg+="<br>Page name should be string values";              
        }
        if(pageDes==''){
            errorMsg+="<br>Page description is required";
        }
        else if(!isNaN(pageDes)){
            errorMsg+="<br>Page description required strings also";
        }
        if(errorMsg!==""){
            $("#error").html(errorMsg);
            return false; 
        }
        return true;
    } 

    function delayRedirect(){
        setTimeout(function() {
            window.location.href="../view/list.cfm";
        },1000);
    }

    function doSave(){
        var pageId = $('#pageId').val().trim(); 
        var pageName = $('#pageName').val().trim();
        var pageDes = $('#pageDes').val().trim();
        $("#editSuccess").text(""); 
        $.ajax({
            url:'../controller/pages.cfc?method=savePage',
            type: 'post',
            data:{ pageId : pageId, pageName : pageName, pageDes : pageDes},
            dataType:"json",
            success: function(response) {
                $("#error").html("");
                if(response.success){
                    $("#editSuccess").html(response.msg);
                    delayRedirect();
                }
                else{
                    $("#error").html(response.msg);    
                }
            },
        });
        return false;
    }
});
