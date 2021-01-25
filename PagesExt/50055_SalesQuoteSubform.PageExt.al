pageextension 50055 "Sales Quote Subform Ext." extends "Sales Quote Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("Customer Specific"; Rec."Customer Specific")
            {
                ApplicationArea = All;
            }
        }

    }
}