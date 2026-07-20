using CatalogService from './service';

annotate CatalogService.Products with @(
    UI.HeaderInfo: {
        TypeName: 'Produkt',
        TypeNamePlural: 'Produkty',
        Title: { Value: Product }
    },
    UI.SelectionFields: [ Product, ProductType ],
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: Product, Label: 'Kod Produktu' },
        { $Type: 'UI.DataField', Value: ProductType, Label: 'Typ Produktu' }
    ]
);

annotate CatalogService.Reviews with @(
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: productID, Label: 'Kod Produktu' },
        { $Type: 'UI.DataField', Value: rating, Label: 'Ocena (1-5)' },
        { $Type: 'UI.DataField', Value: comment, Label: 'Komentarz' }
    ]
);
