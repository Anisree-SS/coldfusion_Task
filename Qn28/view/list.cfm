<cfset variables.qryGetData = createObject("component","CFC.pages").getPages()>
<cfoutput>
<cfinclude template = "header.cfm">
<body class="container-fluid p-0">
<cfinclude template="navbar.cfm">
<cfif session.role EQ "admin" OR session.role EQ "editor">
    <div class="labelStyle">
        <h3>Page List</h3>
    </div>
    <div class="labelStyle">
        <table class="table table-hover table-hover table-striped" id="listTable">
            <thead>
                <tr>
                    <th>Page Name</th>
                    <th>Page Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <cfloop query="#variables.qryGetData#" >
                <tbody>
                    <tr id="#pageId#">
                        <td>#pageName#</td>
                        <td class="text-wrap">#pageDes#</td>
                        <td>
                            <a href="editPage.cfm?pageId=#pageId#"  title="Edit page"><img src="../assets/images/editIcon.png" class="ImgStyle" alt='Edit'></a>
                            <button class="border-0 deleteBtn"  type="submit" data-id="#pageId#"><img src="../assets/images/deleteIcon.png" class="ImgStyle" alt='Delete' title="Delete page"></button>
                        </td>
                    </tr>   
                </tbody>  
            </cfloop>      
        </table>
    </div>
    <div class="back">
        <a href="homePage.cfm" title="Back to home"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
    </div>
    <cfelse>
        <div class="m-5">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>PageName</th>
                        <th></th>
                    </tr>
                </thead>
                <cfloop query="#variables.qryGetData#">
                    <tbody>
                        <tr>
                            <td class="">#pageName#</td>
                            <td><a href="view.cfm?pageId=#pageId#"><img src="../assets/images/viewIcon.png" class="ImgStyle" title="View page" alt='view'></a></td>
                        </tr> 
                    </tbody>          
                </cfloop>
            </table>
        </div>
        <div class="back">
            <a href="homePage.cfm" title="Back to home"><img src="../assets/images/arrow.png" alt="back" class="backStyle"></a>
        </div>
</cfif>
<cfinclude template="footer.cfm">
</cfoutput>
</body>
</html>