using CatalogService from './service';

// 1. Konfiguracja widoku głównego ORAZ widoku szczegółów dla Produktów
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

    // --- TO DODAJEMY: Sekcje na ekranie szczegółów (Object Page) ---
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Opinie i Oceny Klientów',
            Target: 'reviews/@UI.LineItem' // Wyświetli powiązane opinie wg reguł poniżej
        }
    ]
);

// 2. Konfiguracja kolumn w tabeli Ocen (używanej też w sekcji szczegółów)
annotate CatalogService.Reviews with @(
    UI.HeaderInfo: {
        TypeName: 'Ocena',
        TypeNamePlural: 'Oceny'
    },
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: rating, Label: 'Ocena (1-5)' },
        { $Type: 'UI.DataField', Value: comment, Label: 'Komentarz' },
        { $Type: 'UI.DataField', Value: createdAt, Label: 'Data dodania' }
    ]
);