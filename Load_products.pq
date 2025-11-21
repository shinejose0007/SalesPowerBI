let
    Source = Csv.Document(File.Contents("products.csv"), [Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(Promoted, {
        {"ProductID", Int64.Type},
        {"ProductName", type text},
        {"Category", type text},
        {"Price", type number}
    })
in
    ChangedType