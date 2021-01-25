page 50007 "Quick Sales Report CrMemo."
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Cr.Memo Line";
    //SourceTableView = SORTING(Type, "No.", "Posting Date") WHERE(Type = CONST(Item));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                /*
                <Gross Profit Amount>	<Gross Profit Amount>	Field		"Gross Profit Amount"
                <Gross Profit %>	    <Gross Profit %>	    Field		"Gross Profit %"
                */

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowCrMemo)
            {
                ApplicationArea = All;
                Caption = 'Credit Memo';
                RunObject = Page "Posted Sales Credit Memo";
                RunPageLink = "No." = FIELD("Document No.");
            }
            action(ShowCustomer)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                RunObject = Page "Customer Card";
                RunPageLink = "No." = FIELD("Sell-to Customer No.");
            }
        }
    }
}
