package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUser", urlPatterns = {
        "/home", //get
        "/information", //get
})
public class ServletUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if (request.getSession().getAttribute("rfc") == null){
                request.getRequestDispatcher("login").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {

            case "/home":
                if (request.getSession().getAttribute("rol").equals("cliente")){
                    request.getRequestDispatcher("/view/cliente/index.jsp").forward(request,response);
                }
                break;

            case "/information":

                try {
                    ServiceUser userService = new ServiceUser();
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    BeanUser user = userService.getUser(rfc,rol);
                    request.setAttribute("user",user);

                    if (request.getSession().getAttribute("rol").equals("cliente")){
                        request.getRequestDispatcher("/view/cliente/information.jsp").forward(request,response);
                    }
                } catch (Exception e) {
                    response.sendRedirect(request.getContextPath()+"/view/cliente/index.jsp");
                }

                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
