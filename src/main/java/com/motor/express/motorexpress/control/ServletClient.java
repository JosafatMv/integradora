package com.motor.express.motorexpress.control;

import com.motor.express.motorexpress.model.BeanHistory;
import com.motor.express.motorexpress.model.BeanPayment;
import com.motor.express.motorexpress.model.BeanTracking;
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
        "/histories", //Get
        "/history", //Get
})
public class ServletClient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("rfc") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "cliente") {
                response.sendRedirect(request.getContextPath() + "/home");
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
                    List<BeanVehicle> vehicles = vehicleService.getClientVehicles(rfc, rol);

                    request.setAttribute("vehicles", vehicles);

                    if (request.getSession().getAttribute("rol").equals("cliente")) {
                        request.getRequestDispatcher("/view/cliente/vehicles.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;
            case "/payments":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    ServicePayments paymentService = new ServicePayments();
                    List<BeanPayment> payments = paymentService.getClientPayments(rfc, rol);
                    request.setAttribute("payments", payments);

                    if (request.getSession().getAttribute("rol").equals("cliente")) {
                        request.getRequestDispatcher("/view/cliente/payments.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/payment":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    String pathInfo = request.getPathInfo();
                    int historyId = Integer.parseInt(pathInfo.substring(1));

                    ServicePayments paymentService = new ServicePayments();
                    BeanPayment payment = paymentService.getPayment(rol, historyId);

                    if (!rfc.equals(payment.getRfc())) {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }

                    if (request.getSession().getAttribute("rol").equals("cliente")) {
                        request.setAttribute("payment", payment);
                        request.getRequestDispatcher("/view/cliente/payment-details.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/histories":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    ServiceHistory historyService = new ServiceHistory();
                    List<BeanHistory> histories = historyService.getClientHistories(rol, rfc);

                    if (request.getSession().getAttribute("rol").equals("cliente")) {
                        request.setAttribute("histories", histories);
                        request.getRequestDispatcher("/view/cliente/histories.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/history":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    String pathInfo = request.getPathInfo();
                    int historyId = Integer.parseInt(pathInfo.substring(1));

                    ServiceHistory historyService = new ServiceHistory();
                    BeanHistory history = historyService.getHistory(rol, historyId);

                    System.out.println(history.getStatus());

                    if (!rfc.equals(history.getRfc())) {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }

                    if (request.getSession().getAttribute("rol").equals("cliente")) {
                        request.setAttribute("history", history);
                        request.getRequestDispatcher("/view/cliente/history-details.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/home");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
