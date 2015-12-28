<%-- 
    Document   : newEmail
    Created on : Dec 26, 2015, 2:09:04 PM
    Author     : Sherif Diab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>New Email Page</title>
        <script>
            function checkForm(form) {
                if (form.receiver.value == "") {
                    alert("please enter received email");
                    return false;

                }
                else if (form.subject.value == "") {
                    alert("please enter subject email");
                    return false;
                }
                else {
                    return true;

                }
            }
        </script>
    </head>
    <body>
        
        
         <nav class="navbar ">

                <div class="navbar-header">
                    <a class="navbar-brand bg-primary" href="#">FCI CU Mail</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="new_email.jsp">Compose</a></li>
                        <li><a href="#">Show Archive</a></li>
                        <li><a href="#">Inbox</a></li> 
                        <li><a href="#">Edit profile</a></li> 
                        <li><a href="../../LogoutServlet">LogOut</a></li>
                    </ul>
                </div>

            </nav>

        <form name="New-email-form" method="post" action="../../NewEmailServlet" onsubmit="return checkForm(this);">
            
            <table  border="1">
                <header style="background-color:gray;color: white;width: 407px"> New Message</header>
                <tr>
                    <td>TO:</td>
                    <td> <input type="text" name="receiver" style="width: 303px"> </td>
                </tr>
                
                <tr>
                    <td> Subject:</td>
                    <td> <input type="text" name="subject" style="width: 303px"> </td>
                </tr>
                
                
                <tr>
                    <td> Message: </td>
                    <td> <textarea name="msg" rows="20" cols="40"></textarea> </td>
                </tr>
                
                <tr> 
                    <td> <input type="submit" name="send_btn" value="Send" style="width: 100px"> </td>
                </tr>
            </table>
                
                
        </form>
    </body>
</html>
