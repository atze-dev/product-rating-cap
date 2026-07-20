const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Reviews } = this.entities;

    this.before('CREATE', 'Reviews', req => {
        const review = req.data;

        if (review.rating < 1 || review.rating > 5) {
            req.error(400, 'Ocena musi znajdować się w przedziale od 1 do 5!');
        }
    });
});
