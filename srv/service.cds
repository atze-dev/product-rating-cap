using { my.productrating as my } from '../db/schema';
using { API_PRODUCT_SRV as external } from './external/API_PRODUCT_SRV';

service CatalogService {

    @readonly
    entity Products as projection on external.A_Product {
        key Product,
            ProductType,
            // 1. Zmieniamy 'Association' na 'Composition'
            reviews : Composition of many Reviews on reviews.productID = Product
    };

    // 2. Encja do zarządzania opiniami
    entity Reviews as projection on my.Reviews;
}