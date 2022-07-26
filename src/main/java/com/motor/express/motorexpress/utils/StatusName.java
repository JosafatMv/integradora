package com.motor.express.motorexpress.utils;

public class StatusName {

    public String getStatusName(int idStatus) {
        String name;

        switch (idStatus){
            case 1:
                name = "Iniciado";
                break;
            case 2:
                name = "Realizando";
                break;
            case 3:
                name = "Pruebas";
                break;
            case 4:
                name = "Salida";
                break;
            case 5:
                name = "Finalizado";
                break;
            default:
                name = "Error";
                break;
        }

        return name;
    }

}
