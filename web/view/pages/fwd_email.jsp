<%-- 
    Document   : fwd_email
    Created on : Dec 28, 2015, 2:25:09 AM
    Author     : Sherif Diab
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Email"%>
<%@page import="model.DBAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forward Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
        <%
            
            String sender = "";
            sender = session.getAttribute("userEmail").toString();
            String emailID = request.getParameter("id");
            int emID = Integer.parseInt(emailID);
             DBAccess database = new DBAccess();
             Email email =  database.getEmail(emID);
             String subject = email.getSubject();
             String fwdMessage = "";
             
             
        %>

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
             <%
            // Check to be done

           fwdMessage += "From: " + email.getSender()+"\n" + "To:" + email.getReceiver() + "\n" +
                         "Subject: " + email.getSubject()+ "\n" + "Date: " + email.getEmailDateTime() +  "\nMessage: " + email.getBody() + "\n";
           
            
            
            ArrayList<Email> replies = email.getReplies();
            String repSender = "";
            String repRec = "";
            String repSubject = "";
            for (Email rep : replies) {
                repSubject = rep.getSubject();
                fwdMessage+="#######################" + "\n";
                
           fwdMessage += "From: " + rep.getSender()+"\n" + "To:" + rep.getReceiver() + "\n" +
                         "Subject" + rep.getSubject()+ "\n" + "Message: " + rep.getBody() + "\n";
              
            }
           // out.println(fwdMessage);
            %>

        <form name="fwd email form" method="post" action="../../fwdEmailServlet" onsubmit="return checkForm(this)">

            <table  border="1">
                <header style="background-color:gray;color: white;width: 472px"> Forward</header>
                <tr>
                    <td>TO:</td>
                    <td> <input type="text" name="receiver" style="width: 303px"> </td>
                </tr>

                <tr>
                    <td> Fwd:</td>
                    <td> <input type="text" name="subject"  value="<%=subject%>" style="width: 303px"> </td>
                </tr>


                <tr>
                    
                    <td> Forwarded Message: </td>
                    <td> <textarea name="fwdmsg" rows="20" cols="40" readonly><%=fwdMessage%></textarea> </td>
                </tr>
                
                <tr>
                    
                    <td> Message: </td>
                    <td> <textarea name="msg" rows="20" cols="40"></textarea> </td>
                </tr>
                <tr> 
                    <td> <input type="submit" name="send_btn" value="Send" style="width: 150px"> </td>
                </tr>
            </table>


        </form>
       
    </body>
</html>
