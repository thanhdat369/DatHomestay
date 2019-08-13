package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <!DOCTYPE html>\n");
      out.write("    <html lang=\"en\">\n");
      out.write("        <head>\n");
      out.write("            <meta charset=\"utf-8\">\n");
      out.write("            <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("            <meta name=\"description\" content=\"\">\n");
      out.write("            <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("            <title>Sign Up</title>\n");
      out.write("            <!-- Bootstrap Core CSS -->\n");
      out.write("            <link href=\"/DatHomestay/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("            <!-- MetisMenu CSS -->\n");
      out.write("            <link href=\"/DatHomestay/css/metisMenu.min.css\" rel=\"stylesheet\">\n");
      out.write("            <!-- Custom CSS -->\n");
      out.write("            <link href=\"/DatHomestay/css/startmin.css\" rel=\"stylesheet\">\n");
      out.write("            <!-- Custom Fonts -->\n");
      out.write("            <link href=\"/DatHomestay/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("            <!--[if lt IE 9]>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js\"></script>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("            <![endif]-->\n");
      out.write("            <style type=\"text/css\">\n");
      out.write("                body{\n");
      out.write("                    background-image: url(\"/DatHomestay/image/6.jpg\");\n");
      out.write("                    background-size: cover;\n");
      out.write("                    background-color: lightblue;\n");
      out.write("                }\n");
      out.write("            </style>\n");
      out.write("        </head>\n");
      out.write("        <body>\n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                function checkConfirm()\n");
      out.write("                {\n");
      out.write("                    var a = document.SignUpForm.txtPassword.value;\n");
      out.write("                    var b = document.SignUpForm.txtConfirm.value;\n");
      out.write("                    if (a != b)\n");
      out.write("                    {\n");
      out.write("                        alert(\"Confirm not match\");\n");
      out.write("                        return false;\n");
      out.write("                    } else\n");
      out.write("                        return true;\n");
      out.write("                }\n");
      out.write("            </script>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-4 col-md-offset-4\">\n");
      out.write("                        <div class=\"login-panel panel panel-default\">\n");
      out.write("                            <div class=\"panel-heading\">\n");
      out.write("                                <h3 class=\"panel-title\">Sign Up</h3>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"panel-body\">\n");
      out.write("                                <form role=\"form\" method=\"POST\" action=\"MainController\" name=\"SignUpForm\" onsubmit=\"return(checkConfirm())\">\n");
      out.write("                                    <fieldset>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"Username\" name=\"txtUsername\" type=\"text\" maxlength=\"50\"  value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.txtUsername}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" autofocus required=\"\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.INVALID!=null&&requestScope.INVALID.usernameError!=null}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                                            <div class=\"text-center\">\n");
      out.write("                                                <h5 style=\"color:red;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.INVALID.usernameError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h5>\n");
      out.write("                                            </div>\n");
      out.write("                                        </c:if>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"Password\" name=\"txtPassword\" type=\"password\" value=\"\" maxlength=\"50\" required=\"\">\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"Confirm\" name=\"txtConfirm\" type=\"password\" required=\"\" maxlength=\"50\" value=\"\">\n");
      out.write("                                        </div> \n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"Full Name\" name=\"txtFullname\" type=\"text\"  value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.txtFullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" maxlength=\"100\" required=\"\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"E-mail\" name=\"txtEmail\" type=\"email\"  maxlength=\"100\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.txtEmail}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\">\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input class=\"form-control\" placeholder=\"Phone No (10 number begin by 0)\" name=\"txtPhoneNo\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.txtphoneNo}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" pattern=\"(0)+([0-9]{9})\" type=\"text\" title=\"Must be a phone number\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label>\n");
      out.write("                                                Your Role\n");
      out.write("                                            </label>\n");
      out.write("                                            <select class=\"form-control\" name=\"cmbRole\">\n");
      out.write("                                                <option value=\"admin\"> Admin </option>\n");
      out.write("                                                <option value=\"staff\">Staff</option>\n");
      out.write("                                                <option value=\"user\">User</option>\n");
      out.write("                                            </select>\n");
      out.write("                                        </div>\n");
      out.write("                                        <!-- Change this to a button or input when using this as a form -->\n");
      out.write("                                        <input type=\"submit\" name=\"action\" value=\"Sign Up\" class=\"btn btn-lg btn-outline btn-info btn-block\"/>\n");
      out.write("                                        <br/>\n");
      out.write("                                    </fieldset>\n");
      out.write("                                    <div class=\"text-center alert alert-info\">\n");
      out.write("                                        <span>Already registered? <a href=\"index.jsp\">Sign In</a></span>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- jQuery -->\n");
      out.write("            <script src=\"/DatHomestay/js/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Bootstrap Core JavaScript -->\n");
      out.write("            <script src=\"/DatHomestay/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Metis Menu Plugin JavaScript -->\n");
      out.write("            <script src=\"/DatHomestay/js/metisMenu.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Custom Theme JavaScript -->\n");
      out.write("            <script src=\"/DatHomestay/js/startmin.js\"></script>\n");
      out.write("\n");
      out.write("        </body>\n");
      out.write("    </html>\n");
      out.write("</html>\n");
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
