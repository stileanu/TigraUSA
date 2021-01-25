tableextension 50056 "Sales Invoice Line Ext." extends "Sales Invoice Line"
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
            CalcFormula = Lookup("Sales Invoice Header"."Order No." WHERE("No." = FIELD("Document No.")));
        }
        field(50051; "External Document No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."External Document No." WHERE("No." = FIELD("Document No.")));
        }
        field(50052; "Sales Order No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."Order No." WHERE("No." = FIELD("Document No.")));
        }
    }

}

