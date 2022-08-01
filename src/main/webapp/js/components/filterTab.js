const btns = document.querySelectorAll('.filter-tab button');
const btnStart = document.getElementById('btn-start');
const btnInProgress = document.getElementById('btn-inprogress');
const btnEnd = document.getElementById('btn-end');

const carsStart = document.getElementsByClassName('car-start');
const carsInProgress = document.getElementsByClassName('car-inprogress');
const carsEnd = document.getElementsByClassName('car-end');

const inputStatus = document.getElementById('status');

btnStart.addEventListener('click', () => {
    for (let i = 0; i < carsStart.length; i++) {
        carsStart[i].classList.add('d-block');
        carsStart[i].classList.remove('d-none');
    }
    for (let i = 0; i < carsInProgress.length; i++) {
        carsInProgress[i].classList.add('d-none');
        carsInProgress[i].classList.remove('d-block');
    }
    for (let i = 0; i < carsEnd.length; i++) {
        carsEnd[i].classList.add('d-none');
        carsEnd[i].classList.remove('d-block');
    }

    btns.forEach((btn) => {
        btn.classList.remove('tab-active');
    });
    btnStart.classList.add('tab-active');

    idArr = [];
    inputStatus.value = 'start';
    carCards.forEach((carCard) => {
        carCard.classList.remove('card-card-active');
    });
});

btnInProgress.addEventListener('click', () => {
    for (let i = 0; i < carsStart.length; i++) {
        carsStart[i].classList.add('d-none');
        carsStart[i].classList.remove('d-block');
    }
    for (let i = 0; i < carsInProgress.length; i++) {
        carsInProgress[i].classList.add('d-block');
        carsInProgress[i].classList.remove('d-none');
    }
    for (let i = 0; i < carsEnd.length; i++) {
        carsEnd[i].classList.add('d-none');
        carsEnd[i].classList.remove('d-block');
    }

    btns.forEach((btn) => {
        btn.classList.remove('tab-active');
    });
    btnInProgress.classList.add('tab-active');

    idArr = [];
    inputStatus.value = 'inprogress';
    carCards.forEach((carCard) => {
        carCard.classList.remove('card-card-active');
    });
});

btnEnd.addEventListener('click', () => {
    for (let i = 0; i < carsStart.length; i++) {
        carsStart[i].classList.add('d-none');
        carsStart[i].classList.remove('d-block');
    }
    for (let i = 0; i < carsInProgress.length; i++) {
        carsInProgress[i].classList.add('d-none');
        carsInProgress[i].classList.remove('d-block');
    }
    for (let i = 0; i < carsEnd.length; i++) {
        carsEnd[i].classList.add('d-block');
        carsEnd[i].classList.remove('d-none');
    }

    btns.forEach((btn) => {
        btn.classList.remove('tab-active');
    });
    btnEnd.classList.add('tab-active');

    idArr = [];
    inputStatus.value = 'end';
    carCards.forEach((carCard) => {
        carCard.classList.remove('card-card-active');
    });
});
