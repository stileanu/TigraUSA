tableextension 50057 "Sales Cr.Memo Header Ext." extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50000; "Customer Service Rep."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Manufacturer's Rep. Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Free Freight"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

}
