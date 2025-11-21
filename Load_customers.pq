let
    Source = Csv.Document(File.Contents("customers.csv"), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(Promoted, {
        {"CustomerID", Int64.Type},
        {"CustomerName", type text},
        {"CustomerSegment", type text},
        {"SignupDate", type date},
        {"Country", type text}
    })
in
    ChangedType