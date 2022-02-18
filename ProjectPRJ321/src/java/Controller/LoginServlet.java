/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.AccountDAO;
import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Admin;

/**
 *
 * @author Dell
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        response.sendRedirect("view/Login.jsp");
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
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        String rem = request.getParameter("rem");
        AccountDAO adb = new AccountDAO();
        Account a = adb.getAccount(u, p);
        AdminDAO ddb = new AdminDAO();
        Admin d = ddb.getAdmin(u, p);
        if (a == null && d == null) {
            String ms = "user or password are not correct";
            request.setAttribute("mess", ms);
            request.getRequestDispatcher("view/Login.jsp").forward(request, response);
        } else if (a != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("account", a);
            Cookie cu = new Cookie("user", u);
            Cookie cp = new Cookie("pass", p);
            Cookie cr = new Cookie("rem", rem);

            if (rem != null) {
                cu.setMaxAge(60 * 60 * 24 * 10);
                cp.setMaxAge(60 * 60 * 24 * 10);
                cr.setMaxAge(60 * 60 * 24 * 10);
            } else {
                cu.setMaxAge(0);
                cr.setMaxAge(0);
                cp.setMaxAge(0);
            }
            //luu ve phia nguoi dung
            response.addCookie(cr);
            response.addCookie(cu);
            response.addCookie(cp);
//request.getRequestDispatcher("view/MainPage.jsp").forward(request, response);
          response.sendRedirect("view/MainPage.jsp");
        } else if (d != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("adminaccount", d);
             Cookie cu = new Cookie("user", u);
            Cookie cp = new Cookie("pass", p);
            Cookie cr = new Cookie("rem", rem);

            if (rem != null) {
                cu.setMaxAge(60 * 60 * 24 * 10);
                cp.setMaxAge(60 * 60 * 24 * 10);
                cr.setMaxAge(60 * 60 * 24 * 10);
            } else {
                cu.setMaxAge(0);
                cr.setMaxAge(0);
                cp.setMaxAge(0);
            }
            //luu ve phia nguoi dung
            response.addCookie(cr);
            response.addCookie(cu);
            response.addCookie(cp);

            response.sendRedirect("admin/AdminPage.jsp");
        }
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
