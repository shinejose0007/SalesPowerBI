let
    Source = Csv.Document(File.Contents("sales.csv"), [Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(Promoted, {
        {"SaleID", Int64.Type},
        {"OrderDate", type date},
        {"CustomerID", Int64.Type},
        {"ProductID", Int64.Type},
        {"LocationID", Int64.Type},
        {"Quantity", Int64.Type},
        {"UnitPrice", type number},
        {"SalesAmount", type number}
    })
in
    ChangedType