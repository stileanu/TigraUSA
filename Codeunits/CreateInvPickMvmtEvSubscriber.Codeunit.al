codeunit 50004 CreateInvPickMvmtEvSubscriber
{
    /*
    WC0001 ICE ISI 3/4/2021
        Skip lines where the new Shipping Hold field is checked.
    */

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Inventory Pick/Movement", 'OnBeforeFindSalesLine', '', true, true)]
    local procedure OnBeforeFindSalesLineEvent(var SalesLine: Record "Sales Line")
    begin
        Salesline.SetRange("Shipping Hold", false);   // WC0001
    end;
}