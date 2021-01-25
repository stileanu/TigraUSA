pageextension 50053 "Sales Order Subform Ext." extends "Sales Order Subform"
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
        addafter("Reserved Quantity")
        {
            field("Batch No."; Rec."Batch No.")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Qty. to Ship")
        {
            field("Shipping Hold"; Rec."Shipping Hold")
            {
                ApplicationArea = All;
            }
            field("Initial Ship Qty."; Rec."Initial Ship Qty.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Qty. to Ship")
        {
            field("Qty. Picked"; Rec."Qty. Picked")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}