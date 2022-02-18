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
public class Product {
    private int id;
    private String name,image;
    private float price;
    private float PriceAfter;
    private String describe;
    private int rest;


    public Product() {
    }

  

    public Product(int id, String name, String image, float price, float PriceAfter, String describe) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.PriceAfter = PriceAfter;
        this.describe = describe;
    }

    public Product(int id, String name, String image, float price, float PriceAfter, String describe, int rest) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.PriceAfter = PriceAfter;
        this.describe = describe;
        this.rest = rest;
    }

    
  

    public int getRest() {
        return rest;
    }

    public void setRest(int rest) {
        this.rest = rest;
    }

    public float getPriceAfter() {
        return PriceAfter;
    }

    public void setPriceAfter(float PriceAfter) {
        this.PriceAfter = PriceAfter;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

   
    
}
