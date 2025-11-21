let
    Source = Csv.Document(File.Contents("locations.csv"), [Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(Promoted, {
        {"LocationID", Int64.Type},
        {"LocationName", type text},
        {"Region", type text},
        {"City", type text}
    })
in
    ChangedType