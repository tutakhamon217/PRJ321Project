/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Dell
 */
public class ProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(true);

            ProductDAO db = new ProductDAO();
// nếu đã có cart
            Cart cart = null;
            Object obj = session.getAttribute("cart");
            Product pd = null;
//nếu chuaw cod cart
            if (obj != null) {
                cart = (Cart) obj;
            }
            String action = request.getParameter("action");

            if (action.equals("buyitem")) {
                int id = Integer.parseInt(request.getParameter("id"));//lấy ms sản phẩm được chọn
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product p = db.getProductByID(id);//Lấy sản phẩm từ cơ sở dữ liệu
                Item t = new Item(p, quantity);
                if (cart == null) {//mua lần đầu
                    cart = new Cart();
                }
                cart.addItem(t);
            } else if (action.equals("returnitem")) {
                int id = Integer.parseInt(request.getParameter("id"));//lấy ms sản phẩm cần xóa
                //Item t=new Item(new Product(id, "", 0), 0);
                cart.deleteItem(id);
                response.sendRedirect("view/UserCart.jsp");
            } else if (action.equals("saveQuantity")) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int id = Integer.parseInt(request.getParameter("id"));
                Item h = cart.getItemById(id);
                h.setQuantity(quantity);
                response.sendRedirect("view/UserCart.jsp");
            } else if (action.equals("detail")) {
                int id = Integer.parseInt(request.getParameter("id"));
                pd = db.getProductByID(id);
                response.sendRedirect("view/DetailProduct.jsp");

            }
            // đến lúc này mới set attribute cho cart(1 vòng tròn)
            session.setAttribute("product", pd);
            session.setAttribute("cart", cart);
            List<Item> list = cart.getCart();
            int num = 0;
            for (Item item : list) {
                num += item.getQuantity();
            }
            session.setAttribute("num", num);

            //chuyển lại trang mua hàng
            response.sendRedirect("view/MainPage.jsp");
        } catch (Exception e) {
            //e.printStackTrace();
            response.getWriter().print(e.getMessage());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
