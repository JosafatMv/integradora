package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanPayment;
import com.motor.express.motorexpress.model.BeanVehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletClient", urlPatterns = {
        "/vehicles", //Get
        "/payments", //Get
        "/payment", //Get
        "/services", //Get
})
public class ServletClient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("rfc") == null){
                response.sendRedirect(request.getContextPath()+"/login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "cliente"){
                response.sendRedirect(request.getContextPath()+"/home");
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
                    response.sendRedirect(request.getContextPath()+"/home");
                }
                break;
            case "/payments":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    ServicePayments paymentService = new ServicePayments();
                    List<BeanPayment> payments = paymentService.getClientPayments(rfc,rol);
                    request.setAttribute("payments",payments);

                    if (request.getSession().getAttribute("rol").equals("cliente")){
                        request.getRequestDispatcher("/view/cliente/payments.jsp").forward(request,response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath()+"/home");
                }
                break;

            case "/payment":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    String pathInfo = request.getPathInfo();
                    int historyId = Integer.parseInt(pathInfo.substring(1));

                    ServicePayments paymentService = new ServicePayments();
                    BeanPayment payment = paymentService.getPayment(rol,historyId);

                    if (!rfc.equals(payment.getRfc())){
                        response.sendRedirect(request.getContextPath()+"/home");
                        return;
                    }

                    if (request.getSession().getAttribute("rol").equals("cliente")){
                        request.setAttribute("payment",payment);
                        request.getRequestDispatcher("/view/cliente/payment-details.jsp").forward(request,response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath()+"/home");
                }
                break;

            case "/services":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (request.getSession().getAttribute("rol").equals("cliente")){
                        request.getRequestDispatcher("/view/cliente/services.jsp").forward(request,response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath()+"/home");
                }
                break;

            default:
                response.sendRedirect(request.getContextPath()+"/home");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
