codeunit 50050 SalesHeaderEventSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnUpdateSalesLineByChangedFieldName', '', true, true)]
    local procedure OnUpdateSalLinesByFieldName(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; ChangedFieldName: Text[100]; ChangedFieldNo: Integer)
    begin

    end;

}