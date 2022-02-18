<%-- 
    Document   : MainPage
    Created on : 15-10-2020, 18:10:49
    Author     : Dell
--%>

<%@page import="dal.CategoriesDAO"%>
<%@page import="model.Categories"%>
<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.ProductDAO"%>
<%@page import="model.Product"%>
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
                background-color:  #474e5d;
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
                background-color: #e6ace1;
            }
            .product spad{
                background-color:#89b0a8;
            }
            
            .hero__search__form{
                margin-left: 500px;
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
                background-color:#89b0a8;
            }

        </style>


    </head>
    <body>

        <header>
            <div class="header">

                <img src="img/logo.png" alt="">
                <%Account u = (Account) session.getAttribute("account");%>


                <div class="header-right">
                    <%
                        Integer s = new Integer(0);
                        if (session.getAttribute("num") != null) {
                            s = (Integer) session.getAttribute("num");
                        }
                    %>
                   <a href="ChangePass.jsp">Account</a>
                    <a href="Manage.jsp">Manage</a>
                    <a href="Home.jsp">Home</a>
                    <a href="AboutPage.jsp">About</a>
                    <a href="/web/logout">Logout</a>
                    <a href="UserCart.jsp">Cart (<%=s%>)items</a>
                </div>
            </div>
        </header>

        <% CategoriesDAO d = new CategoriesDAO();
            List<Categories> listc = d.getAllCategories();
        %>


        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Organi Shop hello <%=u.getUsername()%></h2>
                            <div class="breadcrumb__option">
                                <a href="Home.jsp">Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="hero__search__form">
            <form >
                <div class="hero__search__categories">
                    All Product
                    <span class="arrow_carrot-down"></span>
                </div>
                <input type="text"name="productname" placeholder="What do yo u need?">
                <button type="submit" class="site-btn">SEARCH</button>
            </form>
        </div>



        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar"> 
                            <div class="sidebar__item">
                                <h4 style="color:white;">Categories</h4>
                                <ul>
                                    <li><a href="MainPage.jsp"><p style="color:white;">All</p></a></li>
                                        <%for (Categories c : listc) {%>
                                    <li><a href="MainPage.jsp?id=<%=c.getId()%>"><p style="color:white;"><%=c.getName()%></p></a></li>

                                    <%}%>
                                </ul>
                            </div>
                            <div class="sidebar__item">
                                <h4 style="color:white;">Price</h4>
                                <div class="price-range-wrap">
                                    <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                         data-min="10" data-max="540">
                                        <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    </div>
                                    <div class="range-slider">
                                        <div class="price-input">
                                            <input type="text" id="minamount">
                                            <input type="text" id="maxamount">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar__item sidebar__item__color--option">
                                <h4 style="color:white;">Colors</h4>
                                <div class="sidebar__item__color sidebar__item__color--white">
                                    <label for="white">
                                        <p style="color:white;">
                                            White
                                        </p>
                                        <input type="radio" id="white">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--gray">
                                    <label for="gray">
                                        <p style="color:white;">
                                            Gray
                                        </p>
                                        <input type="radio" id="gray">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--red">
                                    <label for="red">
                                        <p style="color:white;">
                                            Red
                                        </p>
                                        <input type="radio" id="red">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--black">
                                    <label for="black">
                                        <p style="color:white;">
                                            Black
                                        </p>
                                        <input type="radio" id="black">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--blue">
                                    <label for="blue">
                                        <p style="color:white;">
                                            Blue
                                        </p>
                                        <input type="radio" id="blue">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--green">
                                    <label for="green">
                                        <p style="color:white;">
                                            Green
                                        </p>
                                        <input type="radio" id="green">
                                    </label>
                                </div>
                            </div>
                            <div class="sidebar__item">
                                <h4 style="color:white;">Popular Size</h4>
                                <div class="sidebar__item__size">
                                    <label for="large">
                                        <p style="color:black;">
                                            Large
                                        </p>
                                        <input type="radio" id="large">
                                    </label>
                                </div>
                                <div class="sidebar__item__size">
                                    <label for="medium">
                                        <p style="color:black;">
                                            Medium
                                        </p>
                                        <input type="radio" id="medium">
                                    </label>
                                </div>
                                <div class="sidebar__item__size">
                                    <label for="small">
                                        <p style="color:black;">
                                            Small
                                        </p>
                                        <input type="radio" id="small">
                                    </label>
                                </div>
                                <div class="sidebar__item__size">
                                    <label for="tiny">
                                        <p style="color:black;">
                                            Tiny
                                        </p>
                                        <input type="radio" id="tiny">
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div> 
                    <div class="col-lg-9 col-md-7">
                        <div class="row">



                            <input name="action" type="hidden" value="buyitem">
                            <input name="action" type="hidden" value="detail">
                            <%
                                String pn = request.getParameter("productname");
                                ProductDAO pdb = new ProductDAO();
                                ArrayList<Product> arr = pdb.getAllProducts();
                                String x = request.getParameter("id");

                                if (x != null) {
                                    arr = pdb.getProductByCateID(x == null ? 0 : Integer.parseInt(x));
                                }
                                if (pn != null) {
                                    arr = pdb.getAllProductByName(pn);
                                }
                                int start = 0, end = 8;
                                if (arr.size() < 8) {
                                    end = arr.size();
                                }
                                if (request.getParameter("start") != null) {
                                    start = Integer.parseInt(request.getParameter("start"));
                                }
                                if (request.getParameter("end") != null) {
                                    end = Integer.parseInt(request.getParameter("end"));
                                }
                                ArrayList<Product> list = pdb.getListByPage(arr, start, end);
                                for (Product p : list) {
                                    int id = p.getId();

                            %>


                            <div class="col-lg-3 col-md-9 col-sm-9">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%=p.getImage()%>">

                                        <ul class="product__item__pic__hover">

                                            <li><a  href="/web/process?id=<%=id%>&quantity=1&action=buyitem"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6 style="color:white;"><a href="/web/process?id=<%=id%>&action=detail"style="color:white;"><%=p.getName()%></a></h6>
                                        <h5 style="color:white;"><%=p.getPrice()%></h5>

                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>



                        </div>
                        <ul>
                            <%
                                int a, b;
                                int numPage = arr.size() / 8;
                                if ((numPage * 8) < arr.size()) {
                                    numPage += 1;
                                }
                                for (int i = 1; i <= numPage; i++) {
                                    a = (i - 1) * 8;
                                    b = i * 8;
                                    if (b > arr.size()) {
                                        b = arr.size();
                                    }
                            %>

                            <li class="pagination" >

                                <a href="MainPage.jsp?start=<%=a%>&end=<%=b%>"><p style="color:white;"><%=i%></p></a>


                            </li>
                            <%
                                }
                            %> 
                        </ul>
                    </div>
                </div>
            </div>




        </section>

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

