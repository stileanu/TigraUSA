pageextension 50052 "Sales Order Ext." extends "Sales Order"
{
    layout
    {
        addbefore(Status)
        {
            field(Blanket; Rec.Blanket)
            {
                ApplicationArea = All;
            }
        }
    }
}