const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Products, Reviews } = this.entities;

    const externalService = await cds.connect.to('API_PRODUCT_SRV');

    // 1. Pobieranie produktów z zewnętrznego serwisu
    this.on('READ', Products, async (req) => {
        return externalService.run(req.query);
    });

    // 2. Obsługa nowej akcji "addReview"
    this.on('addReview', Products, async (req) => {
        const productID = req.params[0].Product || req.params[0];
        const { rating, comment } = req.data;

        // Walidacja
        if (!rating || rating < 1 || rating > 5) {
            return req.error(400, 'Ocena musi znajdować się w przedziale od 1 do 5!');
        }

        // Zapis opinii do lokalnej bazy danych
        const newReview = await INSERT.into(Reviews).entries({
            productID: productID,
            rating: Number(rating),
            comment: comment || ''
        });

        return newReview;
    });
});