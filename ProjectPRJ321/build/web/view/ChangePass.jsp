<%-- 
    Document   : Login
    Created on : Nov 11, 2020, 5:29:27 PM
    Author     : asus
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <style>
            body {
                margin: 0;
                padding: 0;
                /*                background-image: url('../img/login.jpg');
                                background-repeat: no-repeat;*/
                background-color:#89b0a8; 
                height: 100vh;
            }
            #login .container #login-row #login-column #login-box {
                margin-top: 180px;
                max-width: 680px;
                height: 380px;
                border: 1px solid #9C9C9C;
                background-color: white;


            }
            .text-info{
                color: white;
            }
            #login .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
            #login .container #login-row #login-column #login-box #login-form #register-link {
                margin-top: -85px;
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
                /*                background-color: #9C9C9C;*/
                color: black;
                background-color: #89b0a8;
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
            .btnsubmit{
                margin-left: 200px;
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
            .container{
                position: relative;
                top : -20vh;
            }




        </style>
    </head>


    <body>
        <header>
            <div class="header">

                <div class="header-right">
                    <a href="MainPage.jsp">MainPage</a>
                    <a href="Home.jsp">Home</a>
                    <a href="AboutPage.jsp">About</a>
                    <a href="/web/logout">Logout</a>
                </div>
            </div>
        </header>
        <main>
            <%
               Account a = (Account) session.getAttribute("account");

            String name = a.getUsername();
            String pass =a.getPass();
            


            %>
            <div id="login">

                <div class="container">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-6">
                            <div id="login-box" class="col-md-12">
                                <form id="login-form" class="form" action="/web/changepass" method="post">
                                    <h3 class="text-center" >Change Password</h3>

                                    <div class="form-group">
                                        <label for="username"  >Username:</label><br>
                                        <input type="text" name="username"  class="form-control"value="<%=name%>" readonly=""> 
                                    </div>
                                    <div class="form-group">
                                        <label for="password" >Old Password:</label><br>
                                        <input type="text" name="oldpass"  class="form-control"value="<%=pass%>"readonly="">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" >New Password:</label><br>
                                        <input type="text" name="newpass"  class="form-control">
                                    </div>
                                                                     
                                        <input type="submit" name="submit" class="btnsubmit" value="Change">
                                    </div>


                                    
                                </form>

                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </main>
     
    </body>
</html>

