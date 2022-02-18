<%-- 
   Document   : CheckOut
   Created on : 11-10-2020, 21:05:55
   Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.Item"%>
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
                background-color: #89b0a8;
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
                background-color: #89b0a8;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header">
         <img src="img/logo.png" alt="">
                <div class="header-right">
                    <a  href="Home.jsp">Home</a>
                    <a href="AboutPage.jsp">About</a>
                    <a href="/web/logout">Logout</a>
                </div>
            </div>
        </header>

        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Checkout</h2>
                            <div class="breadcrumb__option">
                                <a href="./index.html">Home</a>
                                <span>Checkout</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
            Object obj = session.getAttribute("cart");
            if (obj != null) {
                Cart cart = (Cart) obj;
                List<Item> list = cart.getCart();
        %>

        <section class="checkout spad">
            <div class="container">

                <div class="checkout__form">
                    <h4>Billing Details</h4>
                    <form action="/web/bill" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="row">
                                  
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p style="color:black">Phone<span>*</span></p>
                                            <input type="text" name="phone" required>
                                        </div>
                                    </div>
                                     <div class="col-lg-6">
                                        <div class="checkout__input">
                                             <p style="color:black">Order notes<span>*</span></p>
                                    <input type="text" name="notice"
                                           placeholder="Notes about your order" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p style="color:black">Number Card<span>*</span></p>
                                            <input type="text" name="card" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p style="color:black">Shipping Address<span>*</span></p>
                                            <input type="text" name="ship" required>
                                        </div>
                                    </div>
                                </div>

                              
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h4>Your Order</h4>
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <% int i = 1;
                                        for (Item t : list) {
                                            int id = t.getProduct().getId();
                                            String name = t.getProduct().getName();
                                            double price = t.getProduct().getPrice();
                                            int quantity = t.getQuantity();
                                    %>
                                    <ul>
                                        <li ><%=name%>(<%=quantity%>)<span><%=(quantity * price)%></span></li>

                                    </ul>
                                    <%}
                                    %>

                                    <div class="checkout__order__total">Total <span><%=cart.totalMoney()%></span></div>
<!--                                    // ko hien thi gi nhung van lay ve total va interest-->
                                    <input type="hidden" name="total" value="<%=cart.totalMoney()%>">
                                    <input type="hidden" name="interest" value="<%=cart.totalInterest()%>">

                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>











        <% }
        %>

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
