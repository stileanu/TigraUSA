codeunit 50003 WhseSalesReleaseEvSubscriber
{
    /*
    WC0001 ICE ISI 3/4/2021
        Skip Sales lines where the new Shipping Hold field is checked.
    */

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Sales Release", 'OnAfterReleaseSetFilters', '', true, true)]
    local procedure OnAfterReleaseSetFilters(var SalesLine: Record "Sales Line")
    begin
        SalesLine.SetRange("Shipping Hold", false);    // WC0001
    end;
}