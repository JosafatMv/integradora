console.log("entra")

const btnAll = document.getElementById('all');
const btnCompleted = document.getElementById('completed');
const btnIncomplete = document.getElementById('incomplete');

const carsPaid = document.getElementsByClassName('car-card-paid');
const carsUnpaid = document.getElementsByClassName('car-card-unpaid');

btnAll.addEventListener('click', () => {
    for (let i = 0; i < carsPaid.length; i++) {
        carsPaid[i].style.display = 'block';
    }
    for (let i = 0; i < carsUnpaid.length; i++) {
        carsUnpaid[i].style.display = 'block';
    }

    btnAll.classList.add('tab-active');
    btnCompleted.classList.remove('tab-active');
    btnIncomplete.classList.remove('tab-active');

});

btnCompleted.addEventListener('click', () => {
    for (let i = 0; i < carsPaid.length; i++) {
        carsPaid[i].style.display = 'block';
    }
    for (let i = 0; i < carsUnpaid.length; i++) {
        carsUnpaid[i].style.display = 'none';
    }

    btnAll.classList.remove('tab-active');
    btnCompleted.classList.add('tab-active');
    btnIncomplete.classList.remove('tab-active');

});

btnIncomplete.addEventListener('click', () => {
    for (let i = 0; i < carsPaid.length; i++) {
        carsPaid[i].style.display = 'none';
    }
    for (let i = 0; i < carsUnpaid.length; i++) {
        carsUnpaid[i].style.display = 'block';
    }

    btnAll.classList.remove('tab-active');
    btnCompleted.classList.remove('tab-active');
    btnIncomplete.classList.add('tab-active');

});
