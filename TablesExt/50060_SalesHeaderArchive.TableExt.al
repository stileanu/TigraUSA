tableextension 50060 "Sales Header Archive Ext." extends "Sales Header Archive"
{
    fields
    {

        /*
        field(50000; "Customer Service Rep."; Code[10])
        {
            DataClassification = ToBeClassified;
            
        }
        */
        field(50001; "Freight Collect Account No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        /*
        field(50002; "Blind Shipment"; Boolean)
        {
            DataClassification = ToBeClassified;
            
        }
        field(50005; "Blanket"; Boolean)
        {
            DataClassification = ToBeClassified;
            
        }        
        */
        field(50005; Blanket; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }
}