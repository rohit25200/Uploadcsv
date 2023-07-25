using Order_srv as service from '../../srv/CatalogService';

annotate service.Order with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : S_NO,
        },
        {
            $Type : 'UI.DataField',
            Value : Order_Date,
        },
        {
            $Type : 'UI.DataField',
            Value : Order_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Requested_Delivery_Date,
        },
        {
            $Type : 'UI.DataField',
            Value : Customer_ID,
        },
    ]
);
annotate service.Order with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : S_NO,
            },
            {
                $Type : 'UI.DataField',
                Value : Order_Date,
            },
            {
                $Type : 'UI.DataField',
                Value : Order_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : Requested_Delivery_Date,
            },
            {
                $Type : 'UI.DataField',
                Value : Customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : Item_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : Material_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : Plant,
            },
            {
                $Type : 'UI.DataField',
                Value : Route_Number,
            },
            {
                $Type : 'UI.DataField',
                Value : Request_Quantity,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Order with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    }
);
