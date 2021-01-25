tableextension 50054 "Sales Shipment Line Ext." extends "Sales Shipment Line"
{
    fields
    {
        field(50002; "Batch No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Customer Specific"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(50007; "Initial Ship Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Ship Complete"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

}