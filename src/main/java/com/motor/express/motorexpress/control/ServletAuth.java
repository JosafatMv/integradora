package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanAuth;
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
                        System.out.println("entra");
                        request.getRequestDispatcher("home").forward(request,response);
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
                String email = request.getParameter("email") != null ? (request.getParameter("email")) : "";
                String password = request.getParameter("password") != null ? (request.getParameter("password")) : "";
                String rol = "cliente";

                Encrypt encrypt = new Encrypt();
                try {
                    ServiceAuth auth = new ServiceAuth();
                    BeanAuth userCredentials = new BeanAuth(email,password, rol);

                    auth.loginAuth(userCredentials);
                    if (userCredentials.getRfc() != null){
                        boolean isCorrect = encrypt.validatePassword(password,userCredentials.getStoredPassword());
                        if (isCorrect) {
                            request.getSession().setAttribute("rfc",userCredentials.getRfc());
                            request.getSession().setAttribute("name",userCredentials.getName());
                            request.getSession().setAttribute("rol",userCredentials.getRol());
                            response.sendRedirect(request.getContextPath()+"/home");
                        } else {
                            response.sendRedirect("login");
                        }
                    } else {
                        response.sendRedirect("login");
                    }


                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                } catch (InvalidKeySpecException e) {
                    throw new RuntimeException(e);
                }

                break;
        }
    }
}
