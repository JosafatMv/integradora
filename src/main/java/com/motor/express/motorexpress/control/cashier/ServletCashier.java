package com.motor.express.motorexpress.control.cashier;

import com.motor.express.motorexpress.control.payment.ServicePayments;
import com.motor.express.motorexpress.model.payment.BeanPayment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletCashier", urlPatterns = {
        "/list-charges", //GET
        "/charge", //GET
        "/save-charge" //POSTA
})
public class ServletCashier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if (request.getSession().getAttribute("rfc") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "caja") {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {

            case "/list-charges":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("caja")) {
                        ServicePayments servicePayments = new ServicePayments();
                        List<BeanPayment> payments = servicePayments.getPayments();

                        request.setAttribute("payments", payments);

                        request.getRequestDispatcher("/view/cashier/list-charges.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/charge":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    String pathInfo = request.getPathInfo();
                    int historyId = Integer.parseInt(pathInfo.substring(1));

                    if (rol.equals("caja")) {
                        ServicePayments paymentService = new ServicePayments();
                        BeanPayment payment = paymentService.getPayment(rol, historyId);
                        request.setAttribute("payment", payment);
                        request.getRequestDispatcher("/view/cashier/charge.jsp").forward(request, response);
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

        try {
            if (request.getSession().getAttribute("rfc") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "caja") {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {
            case "/save-charge":

                String rol = (String) request.getSession().getAttribute("rol");

                if (rol.equals("caja")) {
                    response.sendRedirect("list-charges?result-save=true");
                }
                break;

            default:
                break;
        }

    }
}
