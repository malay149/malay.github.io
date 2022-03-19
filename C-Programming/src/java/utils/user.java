/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.ArrayList;

/**
 *
 * @author theth
 */
public class user {
    public String login;
	public String type;
	public String status;
        public String user_id;
	// Parameterized Constructor to set Student
	// name, age, course enrolled in.
	public user(String user_id,String login, String type, String status)
	{
		this.login = login;
		this.type = type;
		this.status = status;
                this.user_id = user_id;
	}

    public user() {
    }

    
	// Setter Methods to set table data to be
	// displayed

    public String getLogin() {
        return login;
    }

    public String getType() {
        return type;
    }

    public String getStatus() {
        return status;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
	
    public static int indexOf(user tempUser,ArrayList<user> users) {
        int index = -1;

        for (user user : users) {
            if ((user.getLogin()).equals(tempUser.getLogin())) {
                index = Integer.parseInt(user.getUser_id());
                break;

            }
        }

        return index;
    }
    
}
