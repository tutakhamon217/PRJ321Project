/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Cart {
    private List<Item> cart;
    public Cart(){
        cart=new ArrayList<>();
    }
    
    public Item getItemById(int id){
        for(Item i:cart){
            if(i.getProduct().getId()==id)
                return i;
        }
        return null;
    }
    
    public void addItem(Item t) {
        //nếu có món này trong giỏ thì cập nhật lại số lượng
        if (getItemById(t.getProduct().getId())!=null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity()+ t.getQuantity());
        } else//nếu chưa có món này trong giỏ thì thêm mới
            cart.add(t);
    }   
    public void deleteItem(int id) {
        if (getItemById(id)!=null) {
            cart.remove(getItemById(id));
        }
    }
    public List<Item> getCart() {
        return cart;
    }    
    public double totalMoney(){
        double tt=0;
        for(Item i:cart){
            tt += i.getProduct().getPrice()*i.getQuantity();
        }
        return tt;
    }  
    public double totalInterest(){
        double tt=0;
        for(Item i:cart){
            tt += (i.getProduct().getPrice()-i.getProduct().getPriceAfter())*i.getQuantity();
        }
        return tt;
    }
    
}
