package model;

import java.sql.Blob;
import java.util.ArrayList;


/**
 *
 * @author sabry_ragab
 */
public class User {

    private String userEmail;
    private String name;
    private String password;
    private String country;
    private Blob profilePic; // to be checked
    private ArrayList<Email> inbox;
    private ArrayList<Email> archive;

    public User(String userEmail, String name, String password, String country,
            Blob profilePic, ArrayList<Email> inbox, ArrayList<Email> archive) {
        this.userEmail = userEmail;
        this.name = name;
        this.password = password;
        this.country = country;
        this.profilePic = profilePic;
        this.inbox = inbox;
        this.archive = archive;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Blob getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(Blob profilePic) {
        this.profilePic = profilePic;
    }

    public ArrayList<Email> getInbox() {
        return inbox;
    }

    public void setInbox(ArrayList<Email> inbox) {
        this.inbox = inbox;
    }

    public ArrayList<Email> getArchive() {
        return archive;
    }

    public void setArchive(ArrayList<Email> archive) {
        this.archive = archive;
    }

}
