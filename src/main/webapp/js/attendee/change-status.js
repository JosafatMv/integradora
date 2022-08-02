const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const startResult = urlParams.get('start-result')
const endResult = urlParams.get('end-result')

if(startResult){
    if (startResult === "true") {
        pushNotify("¡Servicio iniciado con éxito!");
    } else if (startResult === "false") {
        pushNotify("Error al iniciar el servicio");
    }
}

if(endResult){
    if (endResult === "true") {
        pushNotify("¡Servicio finalizado con éxito!");
    } else if (endResult === "false") {
        pushNotify("Error al finalizar el servicio");
    }
}
