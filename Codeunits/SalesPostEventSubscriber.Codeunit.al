codeunit 50001 SalesPostEventSubscriber
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostUpdateOrderLineModifyTempLine', '', true, true)]
    local procedure OnBeforePostUpdateOrderLineModifyTempLine(var TempSalesLine: Record "Sales Line" temporary; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        SetDefaultQtyBlank: Boolean;

    begin
        // WC0001.begin
        SetDefaultQtyBlank := SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank;
        //if WhseHandlingRequiredExternal(TempSalesLine) or SetDefaultQtyBlank then begin
        if SetDefaultQtyBlank then begin
            // WC0001.end
            if TempSalesLine."Document Type" = TempSalesLine."Document Type"::"Return Order" then begin
                TempSalesLine."Return Qty. to Receive" := 0;
                TempSalesLine."Return Qty. to Receive (Base)" := 0;
            end else begin
                TempSalesLine."Qty. to Ship" := 0;
                TempSalesLine."Qty. to Ship (Base)" := 0;
            end;
            TempSalesLine.InitQtyToInvoice;
        end else begin
            if TempSalesLine."Document Type" = TempSalesLine."Document Type"::"Return Order" then
                TempSalesLine.InitQtyToReceive
            else
                TempSalesLine.InitQtyToShip2;

            // WC0002.begin
            IF (TempSalesLine."Document Type" = TempSalesLine."Document Type"::Order) THEN BEGIN
                TempSalesLine.VALIDATE("Qty. to Invoice",
                  TempSalesLine."Quantity Shipped" - TempSalesLine."Quantity Invoiced");
                TempSalesLine."Qty. to Invoice (Base)" :=
                  TempSalesLine."Qty. Shipped (Base)" - TempSalesLine."Qty. Invoiced (Base)";
            END ELSE
                IF (TempSalesLine."Document Type" = TempSalesLine."Document Type"::"Return Order") THEN BEGIN
                    TempSalesLine.VALIDATE("Qty. to Invoice",
                      TempSalesLine."Return Qty. Received" - TempSalesLine."Quantity Invoiced");
                    TempSalesLine."Qty. to Invoice (Base)" :=
                      TempSalesLine."Return Qty. Received (Base)" - TempSalesLine."Qty. Invoiced (Base)";
                END;
            // WC0002.end

            TempSalesLine."Qty. Picked" := 0;    // WC0003
        end;
    end;
}