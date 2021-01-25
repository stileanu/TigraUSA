pageextension 50054 "Purchase Order Subform Ext." extends "Purchase Order Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("RG Number"; Rec."RG Number")
            {
                ApplicationArea = All;
            }
        }
    }
}