export const creditCard = () => {
    return `
        <div class="container text-center my-5">
            <div class="credit-card pt-4">
                <div class="bar mb-4"></div>
                <form action="" class="p-3" id="method-form">
                    <input type="number" class="form-control mb-4" placeholder="Numero de tarjeta">
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <input type="text" class="form-control" placeholder="Fecha de expiración">
                                </div>
                                <div class="col-12">
                                    <input type="text" class="form-control" placeholder="Nombre completo">
                                </div>

                            </div>
                        </div>
                        <div class="col-3"></div>
                        <div class="col-3">
                            <input type="number" class="form-control" placeholder="CVV">
                        </div>

                    </div>
                </form>
            </div>

            <div class="switch-container my-3">

                <div class="switch-button">
                    <input class="switch-button-checkbox" type="checkbox"></input>
                    <label class="switch-button-label" for="">
                        <span class="switch-button-label-span">Débito</span>
                    </label>
                </div>
            </div>

        </div>
    `;
};
