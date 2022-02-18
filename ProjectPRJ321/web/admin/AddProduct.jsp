<%-- 
    Document   : AddProduct
    Created on : 18-10-2020, 16:27:36
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <style>
            .contact100-form-title{
               color: #d4ca72;  
            }
            .container-contact100{
                background-color: #6b4764;
            }
            body{
                background-color: #6b4764;
            }
        </style>
    </head>
    <body>


        <div class="container-contact100">

            <div class="wrap-contact100">
                <%
                    if (request.getAttribute("error") != null) {
                %>
                <h2 style="color: red"><%= request.getAttribute("error")%></h2>
                <% }%>
                <form action="/web/save" method="post" class="contact100-form validate-form" >
                    <span class="contact100-form-title">
                        Add a new Product

                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Please enter ID Product">
                        <input class="input100" type="text" name="id" placeholder="ID Product"/>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Please enter name Product">
                        <input class="input100" type="text" name="name" placeholder="Name Product"/>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Please enter price Producte">
                        <input class="input100" type="number" name="price" placeholder="Price of Product"/>
                        <span class="focus-input100"></span>
                    </div>
                     <div class="wrap-input100 validate-input" data-validate = "Please enter price Producte">
                        <input class="input100" type="number" name="priceafter" placeholder="Price before of Product"/>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Please enter price Producte">
                          <input class="input100" type="text" name="describe" placeholder="Describe of Product"/>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Please enter link image Product">
                        <input class="input100" type="text" name="image" placeholder="Link Image"/>
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Please enter price Producte">
                        <input class="input100" type="number" name="rest" placeholder="Quantity of products in stock"/>
                        <span class="focus-input100"></span>
                    </div>

                    

                    <div class="container-contact100-form-btn">
                        <button class="contact100-form-btn">

                            <span>
                                <i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
                                <input type="submit" value="Save"/>
                            </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>



        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main1.js"></script>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
    </body>
</html>
