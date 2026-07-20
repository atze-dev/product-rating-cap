namespace my.productrating;

entity Reviews {
    key ID        : UUID;
        productID : String; // Identyfikator produktu z SAP
        rating    : Integer;
        comment   : String;
        createdAt : Timestamp @cds.on.insert : $now;
}
