tableextension 50051 "Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50002; "Batch No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Sell-to Customer Name"; Text[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("Document No.")));
        }
        field(50004; "Qty. Picked"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Customer Specific"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                PurchLine: Record "Purchase Line";
                StatusToDisplay: Text[250];

            begin

                // WC0008.begin
                IF xRec."Customer Specific" AND NOT "Customer Specific" AND "Special Order" THEN BEGIN
                    TestStatusOpen;
                    IF PurchLine.GET(
                      PurchLine."Document Type"::Order,
                      "Special Order Purchase No.",
                      "Special Order Purch. Line No.")
                    THEN BEGIN
                        IF PurchLine."Quantity Received" = 0 THEN
                            StatusToDisplay :=
                              STRSUBSTNO(WCText001, "Special Order Purchase No.", "No.")
                        ELSE
                            StatusToDisplay :=
                              STRSUBSTNO(WCText002,
                                "Special Order Purchase No.", "No.", PurchLine."Quantity Received");
                        IF NOT CONFIRM(StatusToDisplay + '  ' + WCText003, FALSE) THEN
                            ERROR(Text25001);
                        PurchLine."Special Order" := FALSE;
                        PurchLine."Special Order Sales No." := '';
                        PurchLine."Special Order Sales Line No." := 0;
                        PurchLine.MODIFY;
                    END;
                    "Special Order" := FALSE;
                    "Special Order Purchase No." := '';
                    "Special Order Purch. Line No." := 0;
                END;
                // WC0008.end
            end;
        }
        field(50006; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Initial Ship Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Shipping Hold"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        WCText001: Label 'Purchase Order %1 for Item %2 has already been created, but has not yet been received.';
        WCText002: Label 'Purchase Order %1 for Item %2 has been created, and %3 of them have been received.';
        WCText003: Label 'This will unlink this Sales Line from that Purchase Line.  Do you want to continue?';
        Text25001: Label 'Canceled.';
}