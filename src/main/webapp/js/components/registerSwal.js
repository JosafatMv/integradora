const form = document.querySelector('#form-register');

form.addEventListener('submit', (e) => {
    e.preventDefault();

    Swal.fire({
        title: '¿Seguro que quieres registrarlo?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Registrar',
        cancelButtonText: 'Cancelar',
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit();
        }
    });
});
