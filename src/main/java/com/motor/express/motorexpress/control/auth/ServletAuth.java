package com.motor.express.motorexpress.control.auth;

import com.motor.express.motorexpress.model.auth.BeanAuth;
import com.motor.express.motorexpress.utils.Encrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@WebServlet(name = "ServletAuth", urlPatterns = {
        "/login", //get
        "/login-check", //post
        "/logout", //get
})
public class ServletAuth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String option = request.getServletPath();

        switch (option) {

            case "/login":
                try {
                    if (request.getSession().getAttribute("rfc") != null){
                        response.sendRedirect("home");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("/login.jsp").forward(request,response);
                break;

            case "/logout":
                request.getSession().removeAttribute("rfc");
                request.getSession().removeAttribute("name");
                request.getSession().removeAttribute("rol");
                request.getSession().invalidate();

                response.sendRedirect("login");
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String option = request.getServletPath();

        switch (option) {
            case "/login-check":


                try {
                    String email = request.getParameter("email") != null ? (request.getParameter("email")) : "";
                    String password = request.getParameter("password") != null ? (request.getParameter("password")) : "";

                    if (email.equals("") || password.equals("")){
                        response.sendRedirect("login?result-login=error-void");
                        return;
                    }

                    ServiceAuth auth = new ServiceAuth();
                    BeanAuth userCredentials = new BeanAuth(email,password);

                    BeanAuth user = auth.loginAuth(userCredentials);
                    if (userCredentials.getRfc() !=  null){
                            request.getSession().setAttribute("rfc",user.getRfc());
                            request.getSession().setAttribute("name",user.getName());
                            request.getSession().setAttribute("rol",user.getRol());
                            response.sendRedirect("home");
                    } else {
                        response.sendRedirect("login?result-login=error");
                        return;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("login?result-login=error");
                }

                break;
        }
    }
}
