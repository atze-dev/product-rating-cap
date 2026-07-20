using { my.productrating as my } from '../db/schema';
using { API_PRODUCT_SRV as external } from './external/API_PRODUCT_SRV';

service CatalogService {

    @readonly
    entity Products as projection on external.A_Product {
        key Product,
            ProductType,
            reviews : Association to many Reviews on reviews.productID = Product
    };

    entity Reviews as projection on my.Reviews;
}
