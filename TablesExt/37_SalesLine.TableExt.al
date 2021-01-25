tableextension 50051 "Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50002; "Batch No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Sell-to Customer Name"; Text[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("Document No.")));
        }
        field(50004; "Qty. Picked"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Customer Specific"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Initial Ship Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Shipping Hold"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;

    /*
    Enabled	Field No.	Field Name	Data Type	Length	Description
Yes	50002	Batch No.	Text	20	WC0002
Yes	50003	Sell-to Customer Name	Text	50	WC0003
Yes	50004	Qty. Picked	Decimal		WC0004
Yes	50005	Customer Specific	Boolean		WC0005
Yes	50006	Order Date	Date		WC0005
Yes	50007	Initial Ship Qty.	Decimal		WC0006
Yes	50008	Shipping Hold	Boolean		WC0007
    */
}