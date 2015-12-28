package model;

import java.util.ArrayList;
import java.io.*;
import java.sql.*;
import javax.sql.*;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author sabry_ragab
 */
public class DBAccess {

    private Connection con;

    public DBAccess() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            System.err.println("Error loading driver: " + cnfe);
        }

        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/fci_mail",
                "root", "root");
    }

    public void closeConnection() throws SQLException {
        con.close();
    }

    public boolean isValidUser(String userEmail, String password) throws SQLException {

        Statement stmt = con.createStatement();
        ResultSet resultSet = stmt.executeQuery("SELECT * FROM User;");

        while (resultSet.next()) {
            if (userEmail.equals(resultSet.getString("userEmail"))
                    && password.equals(resultSet.getString("password"))) {
                resultSet.close(); //release resources
                stmt.close(); //release resources             
                return true;
            }
        }
        resultSet.close(); //release resources
        stmt.close(); //release resources
        return false;
    }

    public User getUser(String userEmail) throws SQLException {

        String name = "", password = "", country = "";
        Blob profilePic = null;

        Statement stmt = con.createStatement();
        ResultSet resultSet = stmt.executeQuery("SELECT * FROM User;");

        while (resultSet.next()) {
            if (userEmail.equals(resultSet.getString("userEmail"))) {
                name = resultSet.getString("name");
                password = resultSet.getString("password");
                country = resultSet.getString("country");
                profilePic = resultSet.getBlob("profilePic");
                break;
            }
        }
        resultSet.close(); //release resources
        stmt.close(); //release resources

        ArrayList<Email> inbox = new ArrayList<>();
        inbox.addAll(getUserInbox(userEmail));
        ArrayList<Email> archive = new ArrayList<>();
        archive.addAll(getUserArchive(userEmail));

        User user = new User(userEmail, name, password, country,
                profilePic, inbox, archive);

        return user;
    }

    
    public ArrayList<Email> getUserInbox(String userEmail) throws SQLException {
        ArrayList<Email> inbox = new ArrayList<Email>();
        Statement stmt = con.createStatement();
        ResultSet resultSet = stmt.executeQuery("SELECT * FROM Email;");
        while (resultSet.next()) {
            if (userEmail.equals(resultSet.getString("receiver"))
                    && resultSet.getBoolean("isArchieved") == false) {

                int emailID = resultSet.getInt("emailID");
                String sender = resultSet.getString("sender");
                String receiver = resultSet.getString("receiver");
                String subject = resultSet.getString("subject");
                String body = resultSet.getString("body");
                int replyID = resultSet.getInt("replyID");
                int isArchieved = resultSet.getInt("isArchieved");
                Date emailDateTime = resultSet.getDate("emailDateTime");
                if (replyID == 0) {
                    
                    inbox.add(new Email(emailID, sender, receiver, subject, body, replyID, isArchieved, emailDateTime));
                }

            }
        }
        resultSet.close(); //release resources
        stmt.close(); //release resources

        return inbox;
    }
    
    public ArrayList<Email> getUserArchive(String userEmail) throws SQLException {
        ArrayList<Email> archive = new ArrayList<Email>();
        Statement stmt = con.createStatement();
        ResultSet resultSet = stmt.executeQuery("SELECT * FROM Email;");
        while (resultSet.next()) {

            if ((userEmail.equals(resultSet.getString("sender")) || userEmail.equals(resultSet.getString("receiver")))
                    && resultSet.getBoolean("isArchieved") == true) {
                int emailID = resultSet.getInt("emailID");
                String sender = resultSet.getString("sender");
                String receiver = resultSet.getString("receiver");
                String subject = resultSet.getString("subject");
                String body = resultSet.getString("body");
                int replyID = resultSet.getInt("replyID");
                int isArchieved = resultSet.getInt("isArchieved");
                Date emailDateTime = resultSet.getDate("emailDateTime");
                if (replyID == 0) {
                    archive.add(new Email(emailID, sender, receiver, subject, body, replyID, isArchieved, emailDateTime));
                } 
            }
        }
        resultSet.close(); //release resources
        stmt.close(); //release resources

        return archive;
    }

    /************************ BY Shady ****************************/

    public Email getEmail(int EmailID) throws SQLException {

        Statement stmt = con.createStatement();
        String query = "SELECT * FROM Email WHERE emailID=" + EmailID + " OR ReplyID=" + EmailID+";";
        Email email = null;
        ArrayList<Email> emailReplies = new ArrayList<Email>();
        ResultSet resultSet = stmt.executeQuery(query);

        while (resultSet.next()) {
            int emailID = resultSet.getInt("emailID");
            String sender = resultSet.getString("sender");
            String receiver = resultSet.getString("receiver");
            String subject = resultSet.getString("subject");
            String body = resultSet.getString("body");
            int replyID = resultSet.getInt("replyID");
            int isArchieved = resultSet.getInt("isArchieved");
            Date emailDateTime = resultSet.getDate("emailDateTime");

            if (emailID == EmailID) {
                email = new Email(emailID, sender, receiver, subject, body, replyID, isArchieved, emailDateTime);
            } else {
                emailReplies.add(new Email(emailID, sender, receiver, subject, body, replyID, isArchieved, emailDateTime));
            }
        }

        email.setReplies(emailReplies);
        resultSet.close();  //release resources
        stmt.close();       //release resources
        return email;
    }

    /**
     * ********************** BY Shady ***************************
     */
    public int addReply(Email email) throws SQLException {

        Statement stmt = con.createStatement();
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String date = "";
        date = dateFormat.format(cal.getTime());
        
        String query = "Insert into email (sender, receiver, subject, body, replyID, isArchieved, emailDateTime)"
                + " values('" + email.getSender() + "' , '" + email.getReceiver() + "' , '" + email.getSubject() + "' , "
                + "'" + email.getBody() + "' , " + email.getReplyID() +","+ 0 + ",'" + date + "')" ;

        int affectedRows = stmt.executeUpdate(query);
        stmt.close();       //release resources
        return affectedRows;
    }
    
    
    
    public boolean addNewEmail(Email email) throws SQLException {
        Statement stmt = con.createStatement();
        String sender = email.getSender();
        String receiver = email.getReceiver();
        String subject = email.getSubject();
        String body = email.getBody();

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String date = "";
        date = dateFormat.format(cal.getTime());
        String query = "INSERT INTO email (sender,receiver,subject,body,replyID,isArchieved,emailDateTime,deleted)"
                + "values('" + sender + "','" + receiver + "','"
                + subject + "','" + body + "'," + null + "," + 0 + ",'" + date + "'," + 0 + ")";

        int affectedRows = stmt.executeUpdate(query);

        if (affectedRows > 0) {
            return true;
        } else {
            return false;
        }

    }
    
    
        public boolean forwardEmail(Email email) throws SQLException {
        Statement stmt = con.createStatement();
        String sender = email.getSender();
        String receiver = email.getReceiver();
        String subject = email.getSubject();
        String body = email.getBody();

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String date = "";
        date = dateFormat.format(cal.getTime());
        String query = "INSERT INTO email (sender,receiver,subject,body,replyID,isArchieved,emailDateTime,deleted)"
                + "values('" + sender + "','" + receiver + "','"
                + subject + "','" + body + "'," + null + "," + 0 + ",'" + date + "'," + 0 + ")";

        int affectedRows = stmt.executeUpdate(query);

        if (affectedRows > 0) {
            return true;
        } else {
            return false;
        }

    }

}
