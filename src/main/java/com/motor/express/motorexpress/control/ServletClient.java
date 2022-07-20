package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanVehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletClient", urlPatterns = {
        "/vehicles", //Get
})
public class ServletClient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("rfc") == null){
                response.sendRedirect("login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "cliente"){
                response.sendRedirect("home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {
            case "/vehicles":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    ServiceVehicle vehicleService = new ServiceVehicle();
                    List<BeanVehicle> vehicles = vehicleService.getClientVehicles(rfc,rol);

                    request.setAttribute("vehicles",vehicles);

                    if (request.getSession().getAttribute("rol").equals("cliente")){
                        request.getRequestDispatcher("/view/cliente/vehicles.jsp").forward(request,response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("home");
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
