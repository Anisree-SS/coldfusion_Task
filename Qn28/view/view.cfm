<cfset variables.qryGetData=createObject("component","CFC.pages").getPages(url.pageId)>
<cfinclude template = "header.cfm">
<body class="container-fluid p-0">
    <cfoutput>
        <cfinclude template = "navbar.cfm">
        <div class="d-flex justify-content-center">
            <h3>#pageName#</h3>
        </div>
        <div class="d-flex-column align-items-center p-3 border border border-light mx-5 ">
            <p class="heights">#pageDes#</p>
        </div>        
        <div class="back">
            <a href="list.cfm"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
        </div>
    </cfoutput>
</body>
</html>