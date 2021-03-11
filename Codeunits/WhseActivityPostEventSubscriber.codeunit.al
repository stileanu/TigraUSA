codeunit 50005 WhseActivityPostEvSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Post", 'OnUpdateSourceDocumentOnAfterSalesLineModify', '', true, true)]
    local procedure OnUpdateSourceDocOnAfterSalLineModifyEv(var SalesLine: Record "Sales Line"; WarehouseActivityLine: Record "Warehouse Activity Line")
    begin
        SalesLine."Qty. Picked" := Abs(WarehouseActivityLine."Qty. to Handle");   // WC0001
        SalesLine.Modify(false);
    end;
}