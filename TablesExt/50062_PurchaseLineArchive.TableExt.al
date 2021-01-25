tableextension 50062 "Purchase Line Archive Ext." extends "Purchase Line Archive"
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