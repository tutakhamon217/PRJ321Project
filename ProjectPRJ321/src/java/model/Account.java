/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Dell
 */
public class Account {
    private String username;
    private String pass;
    private String email;
    private String phone;

    public Account() {
    }

    public Account(String username, String pass) {
        this.username = username;
        this.pass = pass;
    }

    public Account(String username, String pass, String email, String phone) {
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.phone = phone;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
