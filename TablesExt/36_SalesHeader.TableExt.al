tableextension 50050 "Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50001; "Freight Collect Account No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50005; Blanket; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        modify("Order Date")
        {
            trigger OnAfterValidate()
            begin
                UpdateSalesLines(FIELDCAPTION("Order Date"), FALSE);   // WC0008
            end;
        }
    }

    var
        myInt: Integer;
}