table 50001 "Freight Collect Account"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Shipping Agent Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Primary; "Customer No.", "Shipping Agent Code")
        {
            Clustered = true;
        }
        key(Key1; "Shipping Agent Code", "Customer No.")
        {
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}