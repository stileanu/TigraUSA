tableextension 50061 "Sales Line Archive" extends "Sales Line Archive"
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
        field(50009; "Ship Complete"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

}