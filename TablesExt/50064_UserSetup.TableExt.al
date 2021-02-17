tableextension 50064 "User Setup Ext." extends "User Setup"
{
    fields
    {
        field(50000; "User Location"; Code[10])
        {
            // WC0001
            DataClassification = ToBeClassified;
        }
        field(50001; "Customer Service Rep."; Code[10])
        {
            // WC0002
            DataClassification = ToBeClassified;
        }
        field(50002; "Can Override Credit Limit"; Boolean)
        {
            // WC0003
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}