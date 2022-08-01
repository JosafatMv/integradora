const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const isUserSave = urlParams.get('result-save')

if (isUserSave === "true") {
    const pushNotify = () => {
        Toastify({
            text: 'Registro realizado con éxito',
            duration: 3000,
            close: true,
            className: 'info',
            gravity: 'top', // `top` or `bottom`
            position: 'left', // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
        }).showToast();
    };

    pushNotify();
} else if (isUserSave === "false") {
    const pushNotify = () => {
        Toastify({
            text: 'Error al realizar el registro',
            duration: 3000,
            close: true,
            className: 'info',
            gravity: 'top', // `top` or `bottom`
            position: 'left', // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
        }).showToast();
    };

    pushNotify();
}
