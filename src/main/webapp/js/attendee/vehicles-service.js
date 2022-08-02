const carCards = document.querySelectorAll('.car-card');
const form = document.querySelector('#form-register');

let idArr = [];

carCards.forEach((carCard) => {
    carCard.addEventListener('click', () => {
        const idCard = carCard.id;

        if (idArr.length === 1) {
            idArr.pop();
            idArr.push(idCard);
            carCards.forEach((carCard) => {
                carCard.classList.remove('card-card-active');
            });
            carCard.classList.toggle('card-card-active');
        }

        if (idArr.length === 0) {
            idArr.push(idCard);
            carCard.classList.toggle('card-card-active');
        }
    });
});

form.addEventListener('submit', (e) => {
    e.preventDefault();

    if (idArr.length === 0) {
        Swal.fire({
            title: '¡No has seleccionado ningún vehículo!',
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ok',
        });
    }

    const statusToChange = inputStatus.value;

    if (idArr.length === 1) {
        const idCar = idArr[0];
        const carPlatesInput = document.querySelector('#plates');
        const historyInput = document.querySelector('#historyId');
        const rfcMechanic = document.querySelector('#rfcMechanic');


        if (statusToChange === 'start') {
            carPlatesInput.value = idCar;
            if (idArr.length === 1) {
                Swal.fire({
                    title: 'CONFIRMAR INICIO',
                    html: `<input type="text" id="rfcMechanic" class="swal2-input" placeholder="RFC del mecánico">`,
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Iniciar',
                    cancelButtonText: 'Cancelar',
                    focusConfirm: false,
                    preConfirm: () => {
                        const rfcMechanic =
                            Swal.getPopup().querySelector('#rfcMechanic').value;
                        if (!rfcMechanic) {
                            Swal.showValidationMessage(
                                `Ingrese el RFC del mecánico`
                            );
                        }
                        return { rfcMechanic: rfcMechanic };
                    },
                }).then((result) => {
                    if (result.isConfirmed) {
                        rfcMechanic.value = result.value.rfcMechanic;
                        form.submit();
                    }
                });
            }
        }

        if (statusToChange === 'end') {
            console.log(idCar)
            historyInput.value = idCar;
            Swal.fire({
                title: 'FINALIZAR SERVICIO',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Finalizar',
                cancelButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        }
    }
});


