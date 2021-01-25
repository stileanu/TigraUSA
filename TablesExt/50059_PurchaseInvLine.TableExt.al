tableextension 50059 "Purch. Inv. Line Ext." extends "Purch. Inv. Line"
{
    fields
    {
        field(50000; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; "RG Number"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

}