<%-- 
    Document   : AdminPage
    Created on : 19-10-2020, 23:04:05
    Author     : Dell
--%>

<%@page import="model.Account"%>
<%@page import="model.Bill"%>
<%@page import="dal.BillDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            table,td,th{
                border : solid chocolate 1px;
                border-collapse: collapse; 
            }

            .header {
                overflow: hidden;
                background-color: #474e5d;
                padding: 20px 10px;
            }

            /* Style the header links */
            .header a {
                float: left;
                color: white;
                text-align: center;
                padding: 12px;
                text-decoration: none;
                font-size: 18px;
                line-height: 25px;
                border-radius: 4px;
            }

            /* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
            .header a.logo {
                font-size: 25px;
                font-weight: bold;
            }

            /* Change the background color on mouse-over */
            .header a:hover {
                background-color: #9C9C9C;
                color: black;
            }

            /* Style the active/current link*/
            .header a.active {
                background-color: white;
                color: black;
            }

            /* Float the link section to the right */
            .header-right {
                float: right;
            }
            /* Change the background color on mouse-over */
            .header a:hover {
                background-color: #9C9C9C;
                color: black;
            }

            /* Style the active/current link*/
            .header a.active {
                background-color: white;
                color: black;
            }

            /* Float the link section to the right */
            .header-right {
                float: right;
            }
            *{
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
            }
            body{
                font-family: Helvetica;
                -webkit-font-smoothing: antialiased;
                background: rgba( 71, 147, 227, 1);
            }
            h2{
                text-align: center;
                font-size: 18px;
                text-transform: uppercase;
                letter-spacing: 1px;
                color: white;
                padding: 30px 0;
            }

            /* Table Styles */

            .table-wrapper{
                margin: 10px 70px 70px;
                box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
            }

            .fl-table {
                border-radius: 5px;
                font-size: 12px;
                font-weight: normal;
                border: none;
                border-collapse: collapse;
                width: 100%;
                max-width: 100%;
                white-space: nowrap;
                background-color: white;
            }

            .fl-table td, .fl-table th {
                text-align: center;
                padding: 8px;
            }

            .fl-table td {
                border-right: 1px solid #f8f8f8;
                font-size: 12px;
            }

            .fl-table thead th {
                color: #ffffff;
                background: #4FC3A1;
            }


            .fl-table thead th:nth-child(odd) {
                color: #ffffff;
                background: #324960;
            }

            .fl-table tr:nth-child(even) {
                background: #F8F8F8;
            }

            /* Responsive */

            @media (max-width: 767px) {
                .fl-table {
                    display: block;
                    width: 100%;
                }
                .table-wrapper:before{
                    content: "Scroll horizontally >";
                    display: block;
                    text-align: right;
                    font-size: 11px;
                    color: white;
                    padding: 0 0 10px;
                }
                .fl-table thead, .fl-table tbody, .fl-table thead th {
                    display: block;
                }
                .fl-table thead th:last-child{
                    border-bottom: none;
                }
                .fl-table thead {
                    float: left;
                }
                .fl-table tbody {
                    width: auto;
                    position: relative;
                    overflow-x: auto;
                }
                .fl-table td, .fl-table th {
                    padding: 20px .625em .625em .625em;
                    height: 60px;
                    vertical-align: middle;
                    box-sizing: border-box;
                    overflow-x: hidden;
                    overflow-y: auto;
                    width: 120px;
                    font-size: 13px;
                    text-overflow: ellipsis;
                }
                .fl-table thead th {
                    text-align: left;
                    border-bottom: 1px solid #f7f7f9;
                }
                .fl-table tbody tr {
                    display: table-cell;
                }
                .fl-table tbody tr:nth-child(odd) {
                    background: none;
                }
                .fl-table tr:nth-child(even) {
                    background: transparent;
                }
                .fl-table tr td:nth-child(odd) {
                    background: #F8F8F8;
                    border-right: 1px solid #E6E4E4;
                }
                .fl-table tr td:nth-child(even) {
                    border-right: 1px solid #E6E4E4;
                }
                .fl-table tbody td {
                    display: block;
                    text-align: center;
                }
            }
            /* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
            @media screen and (max-width: 500px) {
                .header a {
                    float: none;
                    display: block;
                    text-align: left;
                }
                .header-right {
                    float: none;
                }
            }

            body{
                background-color:#6b4764;
            }

        </style>
        <style>
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                text-align: center;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: white;
            }


        </style>
    </head>
    <body>
        <header>
            <div class="header">
                <img src="img/logo.png" alt="">
                <div class="header-right">
                    <%
                        Integer s = new Integer(0);
                        if (session.getAttribute("num") != null) {
                            s = (Integer) session.getAttribute("num");
                        }
                    %>
                    <a href="MainPage.jsp">MainPage</a>
                    <a href="Home.jsp">Home</a>
                    <a href="AboutPage.jsp">About</a>
                    <a href="/web/logout">Logout</a>
                    <a href="UserCart.jsp">Cart (<%=s%>)items</a>
                </div>
            </div>
        </header>

        <%

            Account a = (Account) session.getAttribute("account");

            String name = a.getUsername();
            BillDAO b = new BillDAO();

            List<Bill> lst = b.getAllBillByName(name);

            if (lst != null) {


        %>
        <section>
            <h2>Sales information management</h2>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Phone</th>
                            <th>Cart</th>
                            <th>Ship To</th>
                            <th>Notice</th>
                            <th>Total</th>

                            <th>Date</th>
                            <th>Option</th>
                            

                        </tr>
                    </thead>
                    <tbody>
                        <%                       for (Bill x : lst) {

                        %>
                        <tr>
                            <td><a href="ListProductBuy.jsp?idbill=<%=x.getId() %>"><%=x.getId()%></a></td>

                            <td><%=x.getPhone()%> </td>
                            <td> <%=x.getCard()%></td>
                            <td> <%=x.getShipaddress()%></td>
                            <td> <%=x.getNotice()%></td>
                            <td> <%=x.getTotal()%></td>

                            <td> <%=x.getDate()%></td>
                         <td><a href="/web/deletebill?id=<%=x.getId() %>">Cancel</a></td>


                        </tr>

                        <%
                                }
                            }
                        %>
                    <tbody>
                </table>
              

            </div>





            <footer class="footer spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__about__logo">
                                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                                </div>
                                <ul>
                                    <li>Address: 60-49 Road 11378 New York</li>
                                    <li>Phone: +65 11.188.888</li>
                                    <li>Email: hello@colorlib.com</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                            <div class="footer__widget">
                                <h6>Useful Links</h6>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">About Our Shop</a></li>
                                    <li><a href="#">Secure Shopping</a></li>
                                    <li><a href="#">Delivery infomation</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Our Sitemap</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">Who We Are</a></li>
                                    <li><a href="#">Our Services</a></li>
                                    <li><a href="#">Projects</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">Innovation</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="footer__widget">
                                <h6>Join Our Newsletter Now</h6>
                                <p>Get E-mail updates about our latest shop and special offers.</p>
                                <form action="#">
                                    <input type="text" placeholder="Enter your mail">
                                    <button type="submit" class="site-btn">Subscribe</button>
                                </form>
                                <div class="footer__widget__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer__copyright">
                                <div class="footer__copyright__text"><p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                        Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p></div>
                                <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer> 

            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
            <script src="js/jquery-ui.min.js"></script>
            <script src="js/jquery.slicknav.js"></script>
            <script src="js/mixitup.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/main.js"></script>
    </body>
</html>
