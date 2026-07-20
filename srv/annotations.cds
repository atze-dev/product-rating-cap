using CatalogService from './service';

annotate CatalogService.Products with @(
    UI.HeaderInfo: {
        TypeName: 'Produkt',
        TypeNamePlural: 'Produkty',
        Title: { Value: Product },
        Description: { Value: ProductType }
    },
    UI.SelectionFields: [ Product, ProductType ],
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: Product, Label: 'Kod Produktu' },
        { $Type: 'UI.DataField', Value: ProductType, Label: 'Typ Produktu' }
    ],
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Opinie i Oceny Klientów',
            Target: 'reviews/@UI.LineItem'
        }
    ]
);

annotate CatalogService.Reviews with @(
    UI.HeaderInfo: {
        TypeName: 'Ocena',
        TypeNamePlural: 'Oceny'
    },
    UI.LineItem: [
        // Dodajemy PRZYCISK Akcji do paska tabeli
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'CatalogService.addReview',
            Label: 'Dodaj opinię',
            Inline: false
        },
        { $Type: 'UI.DataField', Value: rating, Label: 'Ocena (1-5)' },
        { $Type: 'UI.DataField', Value: comment, Label: 'Komentarz' },
        { $Type: 'UI.DataField', Value: createdAt, Label: 'Data dodania' }
    ]
);