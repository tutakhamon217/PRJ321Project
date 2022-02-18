/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Dell
 */
    public class Bill {
        private int id;
    private String name,phone,card,shipaddress,notice;
    private float interest;
    private String total;
    private Date date;

    public Bill() {
    }
 public Bill(String name, String phone, String card, String shipaddress, String notice,  String total,float interest,int id) {
        this.name = name;
        this.phone = phone;
        this.card = card;
        this.shipaddress = shipaddress;
        this.notice = notice;
        this.interest = interest;
        this.total = total;
         this.id = id;

    }
    public Bill(String name, String phone, String card, String shipaddress, String notice,  String total,float interest, Date date) {
        this.name = name;
        this.phone = phone;
        this.card = card;
        this.shipaddress = shipaddress;
        this.notice = notice;
        this.interest = interest;
        this.total = total;
        this.date = date;
    }

    public Bill( String name, String phone, String card, String shipaddress, String notice,  String total,float interest, Date date,int id) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.card = card;
        this.shipaddress = shipaddress;
        this.notice = notice;
        this.interest = interest;
        this.total = total;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   

   

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    

    public float getInterest() {
        return interest;
    }

    public void setInterest(float interest) {
        this.interest = interest;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getShipaddress() {
        return shipaddress;
    }

    public void setShipaddress(String shipaddress) {
        this.shipaddress = shipaddress;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    
    
    
}
