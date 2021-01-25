pageextension 50051 "Item List Ext." extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore(Action37)
        {
            separator(Action50000)
            {
            }
            action(QuickSalesReport)
            {
                Caption = 'Quick Sales Report';

                trigger OnAction()
                var
                    PostedInvoiceLine: Record "Sales Invoice Line";
                    PostedCrMemoLine: Record "Sales Cr.Memo Line";
                    InvoiceHistPage: Page "Quick Sales Report Inv.";
                    CrMemoHistPage: Page "Quick Sales Report CrMemo.";

                begin

                    // WC0003.begin
                    CLEAR(InvoiceHistPage);
                    CLEAR(CrMemoHistPage);
                    PostedInvoiceLine.RESET;
                    PostedInvoiceLine.SETCURRENTKEY(Type, "No.", "Posting Date");
                    PostedInvoiceLine.SETRANGE(Type, PostedInvoiceLine.Type::Item);
                    PostedInvoiceLine.SETRANGE("No.", Rec."No.");
                    Rec.CopyFilter("Date Filter", PostedInvoiceLine."Posting Date");
                    InvoiceHistPage.SETTABLEVIEW(PostedInvoiceLine);
                    PostedCrMemoLine.RESET;
                    PostedCrMemoLine.SETCURRENTKEY(Type, "No.", "Posting Date");
                    PostedCrMemoLine.SETRANGE(Type, PostedInvoiceLine.Type::Item);
                    PostedCrMemoLine.SETRANGE("No.", Rec."No.");
                    Rec.CopyFilter("Date Filter", PostedCrMemoLine."Posting Date");
                    CrMemoHistPage.SETTABLEVIEW(PostedCrMemoLine);

                    CrMemoHistPage.RUN;
                    InvoiceHistPage.RUN;
                    // WC0003.end
                end;
            }

        }
    }
}