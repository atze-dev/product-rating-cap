const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Products, Reviews } = this.entities;

    const externalService = await cds.connect.to('API_PRODUCT_SRV');

    this.on('READ', Products, async (req) => {
        return externalService.run(req.query);
    });

    // Automatyczne wstawienie klucza obcego przy tworzeniu z poziomu pod-strony
    this.before('CREATE', Reviews, (req) => {
        const review = req.data;

        // Walidacja oceny
        if (review.rating < 1 || review.rating > 5) {
            req.error(400, 'Ocena musi znajdować się w przedziale od 1 do 5!');
        }
    });
});