tableextension 50055 "Sales Invoice Header Ext." extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "Freight Collect Account No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        /*
        field(50005; Blanket; Boolean)
        {
            DataClassification = ToBeClassified;

        } 
        */
    }

    var
        myInt: Integer;
}