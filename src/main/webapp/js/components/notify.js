const pushNotify = (text, duration = 3000) => {
    Toastify({
        text: text,
        duration: duration,
        close: true,
        className: 'info',
        gravity: 'top', // `top` or `bottom`
        position: 'left', // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
    }).showToast();
};