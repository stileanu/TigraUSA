tableextension 50053 "Sales Shipment Header Ext." extends "Sales Shipment Header"
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
}