package com.motor.express.motorexpress.control.attendee;

import com.motor.express.motorexpress.control.client.ServiceClient;
import com.motor.express.motorexpress.control.history.ServiceHistory;
import com.motor.express.motorexpress.control.user.ServiceUser;
import com.motor.express.motorexpress.control.vehicle.ServiceVehicle;
import com.motor.express.motorexpress.model.history.BeanHistory;
import com.motor.express.motorexpress.model.user.BeanUser;
import com.motor.express.motorexpress.model.vehicle.BeanVehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletAttendee", urlPatterns = {
        "/list-clients", //Get
        "/client", //Get
        "/client-register", //get
        "/client-save", //POST
        "/list-vehicles", //Get
        "/vehicle-register", //get
        "/vehicle-save", //POST
        "/vehicles-service", //Get
        "/change-status", //Get
}
)
public class ServletAttendee extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if (request.getSession().getAttribute("rfc") == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            if (request.getSession().getAttribute("rol") != "asistente") {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {

            case "/client-register":

                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("asistente")) {
                        request.getRequestDispatcher("/view/attendee/client-register.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "/vehicle-register":

                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("asistente")) {
                        request.getRequestDispatcher("/view/attendee/vehicle-register.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "/list-clients":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (request.getSession().getAttribute("rol").equals("asistente")) {

                        ServiceUser serviceUser = new ServiceUser();
                        List<BeanUser> clients = serviceUser.getUsers("client");

                        request.setAttribute("clients", clients);

                        request.getRequestDispatcher("/view/attendee/list-clients.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/client":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    String pathInfo = request.getPathInfo();
                    String rfcClient = (pathInfo.substring(1));

                    if (rol.equals("asistente")) {
                        ServiceUser userService = new ServiceUser();
                        BeanUser client = userService.getUser(rfcClient, "cliente");
                        request.setAttribute("client", client);

                        ServiceClient serviceClient = new ServiceClient();
                        List<BeanVehicle> vehicles = serviceClient.getClientVehicles(rfcClient);
                        request.setAttribute("vehicles", vehicles);

                        request.getRequestDispatcher("/view/attendee/client-details.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/vehicles-service":

                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("asistente")) {

                        ServiceHistory serviceHistory = new ServiceHistory();
                        List<BeanHistory> histories = serviceHistory.getHistories();

                        request.setAttribute("histories", histories);
                        request.getRequestDispatcher("/view/attendee/vehicles-service.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
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
            if (request.getSession().getAttribute("rol") != "asistente") {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String option = request.getServletPath();

        switch (option) {
            case "/client-save":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");


                    if (rol.equals("asistente")) {
                        String name = request.getParameter("name") != null ? (request.getParameter("name")) : "";
                        String email = request.getParameter("email") != null ? (request.getParameter("email")) : "";
                        String firstLastName = request.getParameter("firstLastName") != null ? (request.getParameter("firstLastName")) : "";
                        String phone = request.getParameter("phone") != null ? (request.getParameter("phone")) : "";
                        String secondLastName = request.getParameter("secondLastName") != null ? (request.getParameter("secondLastName")) : "";
                        String clientRfc = request.getParameter("rfc") != null ? (request.getParameter("rfc")) : "";
                        String password = request.getParameter("password") != null ? (request.getParameter("password")) : "";
                        String state = request.getParameter("state") != null ? (request.getParameter("state")) : "";
                        String colony = request.getParameter("colony") != null ? (request.getParameter("colony")) : "";
                        String town = request.getParameter("town") != null ? (request.getParameter("town")) : "";
                        String street = request.getParameter("street") != null ? (request.getParameter("street")) : "";
                        String stringCp = request.getParameter("cp") != null ? (request.getParameter("cp")) : "0";
                        String stringNumber = request.getParameter("number") != null ? (request.getParameter("number")) : "0";

                        int number = Integer.parseInt(stringNumber);
                        int cp = Integer.parseInt(stringCp);

                        ServiceUser userService = new ServiceUser();
                        BeanUser user = new BeanUser();
                        user.setNombre(name);
                        user.setCorreo(email);
                        user.setApellidoPaterno(firstLastName);
                        user.setTelefono(phone);
                        user.setApellidoMaterno(secondLastName);
                        user.setRfc(clientRfc);
                        user.setContrasenia(password);
                        user.setEstado(state);
                        user.setColonia(colony);
                        user.setMunicipio(town);
                        user.setCalle(street);
                        user.setNumero(number);
                        user.setCodigoPostal(cp);

                        boolean result = userService.saveUser(user, "client", rfc);
                        response.sendRedirect("list-clients?result-save=" + (result ? "true" : "false"));

                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/vehicle-save":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("asistente")) {
                        String clientRfc = request.getParameter("rfc") != null ? (request.getParameter("rfc")) : "";
                        String plates = request.getParameter("plates") != null ? (request.getParameter("plates")) : "";
                        String engineNumber = request.getParameter("engineNumber") != null ? (request.getParameter("engineNumber")) : "";
                        String serialNumber = request.getParameter("serialNumber") != null ? (request.getParameter("serialNumber")) : "";
                        String brand = request.getParameter("brand") != null ? (request.getParameter("brand")) : "";
                        String model = request.getParameter("model") != null ? (request.getParameter("model")) : "";
                        String stringYear = request.getParameter("year") != null ? (request.getParameter("year")) : "";
                        String color = request.getParameter("color") != null ? (request.getParameter("color")) : "";
                        String type = request.getParameter("type") != null ? (request.getParameter("type")) : "";

                        int year = Integer.parseInt(stringYear);

                        ServiceVehicle serviceVehicle = new ServiceVehicle();
                        BeanVehicle vehicle = new BeanVehicle();
                        vehicle.setOwnerRfc(clientRfc);
                        vehicle.setPlates(plates);
                        vehicle.setEngineNumber(engineNumber);
                        vehicle.setSerialNumber(serialNumber);
                        vehicle.setBrand(brand);
                        vehicle.setModel(model);
                        vehicle.setYear(year);
                        vehicle.setColor(color);
                        vehicle.setType(type);

                        boolean result = serviceVehicle.saveVehicle(vehicle);
                        response.sendRedirect("list-clients?result-save=" + (result ? "true" : "false"));

                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                break;

            case "/change-status":
                try {
                    String rfc = (String) request.getSession().getAttribute("rfc");
                    String rol = (String) request.getSession().getAttribute("rol");

                    if (rol.equals("asistente")) {
                        String rfcMechanic = request.getParameter("rfcMechanic") != null ? (request.getParameter("rfcMechanic")) : "";
                        String plates = request.getParameter("plates") != null ? (request.getParameter("plates")) : "";
                        String stringId = request.getParameter("historyId") != null ? (request.getParameter("historyId")) : "0";
                        String status = request.getParameter("status") != null ? (request.getParameter("status")) : "";

                        System.out.println(stringId);
                        System.out.println(plates);
                        System.out.println(status);
                        System.out.println(rfcMechanic);
                        int id = Integer.parseInt(stringId);
                        System.out.println(id);

//                        ServiceHistory serviceHistory = new ServiceHistory();
//                        BeanHistory history = new BeanHistory();
////                        history.setHistoryId(id);
//                        BeanVehicle vehicle = new BeanVehicle();
//                        vehicle.setOwnerRfc(clientRfc);
//                        vehicle.setPlates(plates);
//
//                        history.setVehicle(vehicle);


//                        boolean result = serviceHistory.getHistories(history,status);
//                        response.sendRedirect("list-clients?result-save=" + (result ? "true" : "false"));
                        response.sendRedirect("list-clients");

                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
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
}
