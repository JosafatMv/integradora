const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const isChargeSave = urlParams.get('result-save')

if(isChargeSave){
    if (isChargeSave === "true") {
        pushNotify("¡Servicio pagado con éxito!");
    } else if (isChargeSave === "false") {
        pushNotify("Error al pagar el servicio");
    }
}

const btnAll = document.getElementById('all');
const btnCompleted = document.getElementById('completed');
const btnUncompleted = document.getElementById('uncompleted');

const carsPaid = document.getElementsByClassName('car-card-paid');
const carsUnpaid = document.getElementsByClassName('car-card-unpaid');

btnAll.addEventListener('click', () => {
    if (carsPaid != null) {
        for (let i = 0; i < carsPaid.length; i++) {
            carsPaid[i].style.display = 'block';
        }
    }
    if (carsUnpaid != null) {
        for (let i = 0; i < carsUnpaid.length; i++) {
            carsUnpaid[i].style.display = 'block';
        }
    }

    btnAll.classList.add('tab-active');
    btnCompleted.classList.remove('tab-active');
    btnUncompleted.classList.remove('tab-active');

});

btnCompleted.addEventListener('click', () => {
    if (carsPaid != null) {
        for (let i = 0; i < carsPaid.length; i++) {
            carsPaid[i].style.display = 'block';
        }
    }
    if (carsUnpaid != null) {
        for (let i = 0; i < carsUnpaid.length; i++) {
            carsUnpaid[i].style.display = 'none';
        }
    }

    btnAll.classList.remove('tab-active');
    btnCompleted.classList.add('tab-active');
    btnUncompleted.classList.remove('tab-active');

});

btnUncompleted.addEventListener('click', () => {
    if (carsPaid != null) {
        for (let i = 0; i < carsPaid.length; i++) {
            carsPaid[i].style.display = 'none';
        }
    }
    if (carsUnpaid != null) {
        for (let i = 0; i < carsUnpaid.length; i++) {
            carsUnpaid[i].style.display = 'block';
        }
    }

    btnAll.classList.remove('tab-active');
    btnCompleted.classList.remove('tab-active');
    btnUncompleted.classList.add('tab-active');

});
