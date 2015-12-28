<%-- 
    Document   : show-email
    Created on : Dec 26, 2015, 1:30:11 PM
    Author     : Shady
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Email"%>
<%@page import="model.Email"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Email</title>
    </head>
    <body>
        <%
            // Check to be done
            User user = (User) session.getAttribute("user");
            Email email = (Email) session.getAttribute("showEmail");

            out.print("<table>");
            out.print("<tr> <td>From</td> <td>" + email.getSender() + "</td> </tr>");
            out.print("<tr> <td>To</td> <td>" + email.getReceiver() + "</td> </tr>");
            out.print("<tr> <td>Subject</td> <td>" + email.getSubject() + "</td> </tr>");
            out.print("<tr> <td>Message</td> <td>" + email.getBody() + "</td> </tr>");
            out.print("</table>");
            out.print("<br>");

            ArrayList<Email> replies = email.getReplies();
            String repSender = "";
            String repRec = "";
            String repSubject = "";
            for (Email rep : replies) {
                repSubject = rep.getSubject();
                out.print("<table>");
                out.print("<tr> <td>From</td> <td>" + rep.getSender() + "</td> </tr>");
                out.print("<tr> <td>To</td> <td>" + rep.getReceiver() + "</td> </tr>");
                out.print("<tr> <td>Subject</td> <td>" + rep.getSubject() + "</td> </tr>");
                out.print("<tr> <td>Message</td> <td>" + rep.getBody() + "</td> </tr>");
                out.print("<br>");
            }
            out.print("</table>");
            out.print("<br>");
            out.print("<br>");

            repSender = user.getUserEmail();
            if (email.getSender().equals(repSender)) {
                repRec = email.getReceiver();
            } else {
                repRec = email.getSender();
            }
            if (repSubject.equals("")) {
                repSubject = "Re: " + email.getSubject();
            }
        %>

        <form action="reply.jsp" method="post">
            <input type="hidden" name="basicID" value="<%=email.getEmailID()%>">
            <input type="hidden" name="sender" value="<%=repSender%>">
            <input type="hidden" name="reciever" value="<%=repRec%>">
            <input type="hidden" name="subject" value="<%=repSubject%>">
            <input type="submit" name="submit" value="Reply">
        </form>
        <br>
        <!-- For Shrioo -->
        <form action="forword.jsp" method="post">
            <input type="hidden" name="id" value="<%=email.getEmailID()%>">
            <input type="submit" name="submit" value="Forword">
        </form>


    </body>
</html>
