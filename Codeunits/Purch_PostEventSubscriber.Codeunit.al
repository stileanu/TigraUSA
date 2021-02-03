codeunit 50002 Purch_PostEventSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        //ItemJnlLine."RG Number" := PurchLine."RG Number";   // WC0001
    end;

    var
        myInt: Integer;
}
