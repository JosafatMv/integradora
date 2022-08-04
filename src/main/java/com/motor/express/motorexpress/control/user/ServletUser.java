package com.motor.express.motorexpress.control.user;

import com.motor.express.motorexpress.model.user.BeanUser;

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
                response.sendRedirect("login");
                return;
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

                if (request.getSession().getAttribute("rol").equals("asistente")){
                    request.getRequestDispatcher("/view/attendee/index.jsp").forward(request,response);
                }

                if (request.getSession().getAttribute("rol").equals("caja")){
                    request.getRequestDispatcher("/view/cashier/index.jsp").forward(request,response);
                }

                break;

            case "/information":

                try {
                    ServiceUser userService = new ServiceUser();
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    BeanUser user = userService.getUser(rfc,rol);
                    request.setAttribute("user",user);

                    if (rol.equals("cliente")){
                        request.getRequestDispatcher("/view/cliente/information.jsp").forward(request,response);
                    }

                    if (rol.equals("asistente")){
                        request.getRequestDispatcher("/view/attendee/information.jsp").forward(request,response);
                    }

                    if (rol.equals("caja")){
                        request.getRequestDispatcher("/view/cashier/information.jsp").forward(request,response);
                    }

                } catch (Exception e) {
                    response.sendRedirect("home");
                    return;
                }

                break;
            default:
                response.sendRedirect("home");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
