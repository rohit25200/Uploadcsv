using Order_srv as service from '../../srv/CatalogService';

annotate service.Orde01 with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
                Value : Request_Quantity,
            },
            {
                $Type : 'UI.DataField',
                Value : allocated_VAN_stock,
            },
            {
                $Type : 'UI.DataField',
                Value : Allocated_Qty,
            },
            {
                $Type : 'UI.DataField',
                Value : Required_Qty,
            },
            {
                $Type : 'UI.DataField',
                Value : RI_Qty,
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
