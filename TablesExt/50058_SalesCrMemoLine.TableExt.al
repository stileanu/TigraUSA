tableextension 50058 "Sales Cr.Memo Line Ext." extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50009; "Ship Complete"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50050; "Customer Name"; Text[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Cr.Memo Header"."Sell-to Customer Name" WHERE("No." = FIELD("Document No.")));
        }
        field(50051; "External Document No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Cr.Memo Header"."External Document No." WHERE("No." = FIELD("Document No.")));
        }
        field(50052; "Sales Order No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Cr.Memo Header"."Return Order No." WHERE("No." = FIELD("Document No.")));
        }
    }

    var
        myInt: Integer;
}
/*
Enabled	Field No.	Field Name	Data Type	Length	Description
Yes	50009	Ship Complete	Boolean		WC0003
Yes	55000	Customer Name	Text	50	WC0002
Yes	55001	External Document No.	Code	20	WC0002
Yes	55002	Return Order No.	Code	20	WC0002
*/
