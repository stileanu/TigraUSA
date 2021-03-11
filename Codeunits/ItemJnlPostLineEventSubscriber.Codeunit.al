codeunit 50006 ItemJnlPostLineEventSubscrber
{
    /*
    3/10/2021 ICE ISI
    WC0002
        New Field: RG Number  Transfer from Item Journal to Item Ledger
    */
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."RG Number" := ItemJournalLine."RG Number";   // WC0002
    end;

}