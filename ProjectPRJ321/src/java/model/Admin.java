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
public class Admin {
    private String adname;
    private String adpass;

    public Admin() {
    }

    public Admin(String adname, String adpass) {
        this.adname = adname;
        this.adpass = adpass;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public String getAdpass() {
        return adpass;
    }

    public void setAdpass(String adpass) {
        this.adpass = adpass;
    }

    
}
