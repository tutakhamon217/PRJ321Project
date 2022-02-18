package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("        <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <!------ Include the above in your HEAD tag ---------->\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                /*                background-image: url('../img/login.jpg');\n");
      out.write("                                background-repeat: no-repeat;*/\n");
      out.write("                background-color:#89b0a8; \n");
      out.write("                height: 100vh;\n");
      out.write("            }\n");
      out.write("            #login .container #login-row #login-column #login-box {\n");
      out.write("                margin-top: 180px;\n");
      out.write("                max-width: 680px;\n");
      out.write("                height: 380px;\n");
      out.write("                border: 1px solid #9C9C9C;\n");
      out.write("                background-color: white;\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .text-info{\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            #login .container #login-row #login-column #login-box #login-form {\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("            #login .container #login-row #login-column #login-box #login-form #register-link {\n");
      out.write("                margin-top: -85px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header {\n");
      out.write("                overflow: hidden;\n");
      out.write("                background-color: #474e5d;\n");
      out.write("                padding: 20px 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Style the header links */\n");
      out.write("            .header a {\n");
      out.write("                float: left;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 12px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                font-size: 18px;\n");
      out.write("                line-height: 25px;\n");
      out.write("                border-radius: 4px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */\n");
      out.write("            .header a.logo {\n");
      out.write("                font-size: 25px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Change the background color on mouse-over */\n");
      out.write("            .header a:hover {\n");
      out.write("                /*                background-color: #9C9C9C;*/\n");
      out.write("                color: black;\n");
      out.write("                background-color: #89b0a8;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* Style the active/current link*/\n");
      out.write("            .header a.active {\n");
      out.write("                background-color: white;\n");
      out.write("                color: black;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Float the link section to the right */\n");
      out.write("            .header-right {\n");
      out.write("                float: right;\n");
      out.write("            }\n");
      out.write("            .btnsubmit{\n");
      out.write("                margin-left: 200px;\n");
      out.write("            }\n");
      out.write("            /* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */\n");
      out.write("            @media screen and (max-width: 500px) {\n");
      out.write("                .header a {\n");
      out.write("                    float: none;\n");
      out.write("                    display: block;\n");
      out.write("                    text-align: left;\n");
      out.write("                }\n");
      out.write("                .header-right {\n");
      out.write("                    float: none;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            .container{\n");
      out.write("                position: relative;\n");
      out.write("                top : -20vh;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <div class=\"header\">\n");
      out.write("\n");
      out.write("                <div class=\"header-right\">\n");
      out.write("                    <a  href=\"Home.jsp\">Home</a>\n");
      out.write("                    <a href=\"AboutPage.jsp\">About</a>\n");
      out.write("                    <a class=\"active\" href=\"Login.jsp\">Login</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <main>\n");
      out.write("            ");

                Cookie[] list = request.getCookies();
                String u = "";
                String p = "";
                String r = "";
                for (int i = 0; i < list.length; i++) {
                    if (list[i].getName().equals("user")) {
                        u = list[i].getValue();
                    }
                    if (list[i].getName().equals("pass")) {
                        p = list[i].getValue();
                    }
                    if (list[i].getName().equals("rem")) {
                        r = list[i].getValue();
                    }
                }


            
      out.write("\n");
      out.write("            <div id=\"login\">\n");
      out.write("\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div id=\"login-row\" class=\"row justify-content-center align-items-center\">\n");
      out.write("                        <div id=\"login-column\" class=\"col-md-6\">\n");
      out.write("                            <div id=\"login-box\" class=\"col-md-12\">\n");
      out.write("                                <form id=\"login-form\" class=\"form\" action=\"/web/login\" method=\"post\">\n");
      out.write("                                    <h3 class=\"text-center\" >Login</h3>\n");
      out.write("\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"username\"  >Username:</label><br>\n");
      out.write("                                        <input type=\"text\" name=\"username\"  class=\"form-control\"value=\"");
      out.print(u);
      out.write("\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"password\" >Password:</label><br>\n");
      out.write("                                        <input type=\"password\" name=\"password\"  class=\"form-control\"value=\"");
      out.print(p);
      out.write("\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <input type=\"checkbox\" ");
      out.print(("on".equals(r)) ? "checked" : "");
      out.write(" name=\"rem\" value=\"on\"/> remember me<br/>\n");
      out.write("                                    <h6 style=\" color: red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.mess}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h6>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("\n");
      out.write("                                        <input type=\"submit\" name=\"submit\" class=\"btnsubmit\" value=\"submit\">\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <a href=\"Register.jsp\" style=\"color:red;  \" >Register here</a>\n");
      out.write("                                </form>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>  \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
