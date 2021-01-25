pageextension 50056 "Sales Order List Ext." extends "Sales Order List"
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