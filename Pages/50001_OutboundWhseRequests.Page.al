page 50001 OutboundWhseRequests
{
    /*
        <changelog>
        <add id="WC0001" date="2011-06-02" dev="dschwaderer" releaseversion="WC01"
                tracking="T000 B000" reference="Story ">
            Brought in object from another customer for Tigra.
        </add>
        <change id="WC0002" date="2011-11-26" dev="jnozzi" releaseversion="WC01"
                tracking="I002" >
            Modified for Tigra.
        </change>
        </changelog>
    */
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Outbound Warehouse Requests';
    SourceTable = "Warehouse Request";
    SourceTableView = SORTING(Type, "Shipment Date", "Location Code") WHERE(Type = CONST(Outbound));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Order No."; Rec."Source No.")
                {
                    Caption = 'Order No.';
                    ApplicationArea = All;

                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = All;
                }
                field("Destination No."; Rec."Destination No.")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Put-away / Pick No."; Rec."Put-away / Pick No.")
                {
                    ApplicationArea = All;
                }
                field("Completely Handled"; Rec."Completely Handled")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Processing)
        {
            group(Line)
            {
                Caption = 'Line';

                action(Document)
                {
                    ApplicationArea = All;

                    trigger OnAction();
                    var
                        SalesHeader: Record "Sales Header";
                        TransferHeader: Record "Transfer Header";
                    begin

                        case Rec."Source Type" of
                            DATABASE::"Sales Line":
                                begin
                                    SalesHeader.Get(Rec."Source Subtype", Rec."Source No.");
                                    case Rec."Source Subtype" of
                                        1:
                                            Page.RunModal(Page::"Sales Order", SalesHeader);
                                    end;
                                end;
                            DATABASE::"Transfer Line":
                                TransferHeader.Get(Rec."Source No.")
                        END;

                    end;
                }
                action(DocComments)
                {
                    ApplicationArea = All;
                    Caption = 'Document Comments';
                    RunObject = page "Sales Comment Sheet";

                }
                action(Whse_Document)
                {
                    ApplicationArea = All;
                    Caption = 'Wshe. Document';

                    trigger OnAction();
                    var
                        WarehouseActivityHeader: Record "Warehouse Activity Header";
                    begin

                        Rec.TestField("Put-away / Pick No.");

                        case Rec.Type of
                            Rec.Type::Outbound:
                                begin
                                    if WarehouseActivityHeader.GET(WarehouseActivityHeader.Type::"Invt. Pick", Rec."Put-away / Pick No.") then
                                        Page.RunModal(Page::"Inventory Pick", WarehouseActivityHeader);
                                end;
                        END;

                    end;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';

                action(CreateInvPut_Away_Pick)
                {
                    Caption = 'Create Inventory Put-away / Pick';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        WhseRequest: Record "Warehouse Request";

                    begin

                        CurrPage.SetSelectionFilter(WhseRequest);
                        WhseRequest.MarkedOnly;
                        IF WhseRequest.IsEmpty THEN BEGIN
                            WhseRequest.Reset();
                            WhseRequest.Copy(Rec);
                            WhseRequest.SetRecFilter();
                        END;

                        Report.RunModal(Report::"Create Invt Put-away/Pick/Mvmt", TRUE, FALSE, WhseRequest);

                    end;
                }
            }
        }
    }


    var
        UserSetup: Record "User Setup";
        ShipmentDateFilter: Text[30];
        LocationFilter: Text[30];
        FontColorNo: Integer;

    trigger OnOpenPage()
    begin

        IF NOT UserSetup.GET(USERID) THEN;
        // WC0002.begin
        // FILTERGROUP(2);
        // LocationFilter := GETFILTER("Location Code");
        // ValidateShipmentDateFilter('');
        // SETRANGE("Completely Handled",FALSE);
        // FILTERGROUP(0);
        Rec.FilterGroup(2);
        Rec.SetRange("Location Code", UserSetup."User Location");
        LocationFilter := Rec.GetFilter("Location Code");
        Rec.SetRange("Completely Handled", FALSE);
        Rec.FilterGroup(0);
        ValidateShipmentDateFilter('..T');
        // WC0002.end
    end;

    trigger OnAfterGetRecord()
    begin

        CASE TRUE OF
            Rec."Put-away / Pick No." <> '':
                FontColorNo := 32768;
            //  BlockedForShipment() : FontColorNo := 8421504;
            Rec."Shipment Date" < TODAY:
                FontColorNo := 255;
            ELSE
                FontColorNo := 0;
        END;
    end;

    procedure ValidateShipmentDateFilter(NewFilter: Text[30])
    var
        ApplicationManagement: Codeunit "Filter Tokens";
    begin
        ApplicationManagement.MakeDateFilter(NewFilter);
        Rec.SetFilter("Shipment Date", NewFilter);
        ShipmentDateFilter := Rec.GetFilter("Shipment Date");
    end;

}