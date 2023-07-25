namespace db;

using Order_srv as service from '../srv/CatalogService';

@cds.persistence.skip
entity Labels {
    labelName   : String;
    description : String;
}

context master {
    entity Material_Master {
        key S_NO              : Integer @title: 'S_NO';
            Material_ID       : String  @title: ' Material_ID';
            Material_Name     : String  @title: '  Material_Name';
            Plant             : String  @title: 'Plant';
            Pick_To_0         : String  @title: 'Pick_To_0';
            Product_Hierarchy : String  @title: 'Product_Hierarchy';
            PG0               : String  @title: ' PG0';
            PG1               : String  @title: ' PG1';
            PG2               : String  @title: ' PG2';
            PG3               : String  @title: ' PG3';
            Channel           : String  @title: 'Channel';
            Sub_Channel       : String  @title: 'Sub_Channel';

    }

    entity Customer_Master {
        key S_NO                 : Integer @title: 'S_NO';
            Customer_ID          : String;
            Customer_Name        : String;
            Customer_Address     : String;
            Plant                : String;
            Customer_Group_Key   : String;
            CG0                  : String;
            CG1                  : String;
            CG2                  : String;
            CG3                  : String;
            Channel              : String;
            Sub_Channel          : String;
            National_Customer    : String;
            Aged_Horeca_Customer : String;
            Van_As_Customer      : String;
            Material_Wastage     : String;

    }

    entity Customer_Group {
        key S_NO          : Integer @title: 'S_NO';
            Customer_ID   : String  @title: ' Customer_ID';
            Product_Group : String  @title: '    Product_Group';
            Priority      : String  @title: 'Priority ';
    }

    entity Trade_Category {
        key S_NO                 : Integer @title: 'S_NO';
            Customer_Group_Key   : String;
            Trade_Category       : String;
            Priority_In_Shortage : String;
            Priority_Excess      : String;
    }

    entity Van {
        key S_NO         : Integer @title: 'S_NO';
            Van_Number   : String  @title: ' Van_Number';
            Route_Number : String  @title: 'Route_Number';
            Area_Code    : String  @title: 'Area_Code';
            RPF          : String  @title: 'RPF';


    }

    entity Area_Contribution {
        key S_NO                    : Integer @title: 'S_NO';
            Plant                   : String  @title: 'Plant';
            Area_Code               : String  @title: 'Area_Code';
            Material_ID             : String  @title: 'Material_ID:';
            Contribution_Percentage : String  @title: ' Contribution_Percentage';

    }

    entity Order {
        key S_NO                    : Integer @title: 'S_N0';
            Order_Date              : Date    @title: 'Order_Date';
            Order_ID                : String  @title: 'OrderID';
            Requested_Delivery_Date : Date    @title: 'Requested_Delivery_Date';
            Customer_ID             : String  @title: 'Customer_ID';
            Item_ID                 : String  @title: ' Item_ID';
            Material_ID             : String  @title: 'Material ID';
            Plant                   : String  @title: 'Plant';
            Route_Number            : String  @title: 'Route_Number';
            Request_Quantity        : String  @title: 'Requested_Qty';

            final                   : Association to Final_Allocation
                                          on final.S_NO = S_NO;
    }

    entity Plant_Stock {
        key S_NO        : Integer @title: 'S_NO';
            Plant       : String  @title: 'Plant';
            Material_ID : String  @title: ' Material_ID';
            Inventory   : String  @title: 'Inventory';
            Intransit   : String  @title: 'Intransit';
            Plant_Stock : String  @title: '  Plant_Stock ';

    }

    entity Van_Stock {
        key S_NO                        : Integer @title: 'S_NO';
            Plant                       : String  @title: 'Plant';
            Route_Number                : String  @title: 'Route_Number';
            Material_ID                 : String  @title: 'Material_ID';
            Associate_Residual_To_Route : String  @title: 'Associate_Residual_To_Route';
            Return_Stock                : String  @title: 'Return_Stock ';
    }

    entity Order_Type {
        key S_NO                : Integer @title: 'S_NO';
            OMS_Order_Type      : String  @title: ' OMS_Order_Type ';
            Order_Type_Priority : String  @title: ' Order_Type_Priority ';

    }

    entity Final_Allocation {
        key S_NO                       : Integer @title: 'S_N0';
            Order_Date                 : Date    @title: 'Order_Date';
            Order_ID                   : String  @title: 'Order_ID';
            Requested_Delivery_Date    : String  @title: 'Requested_Delivery_Date';
            Customer                   : String  @title: 'Customer ';
            Item_ID                    : String  @title: 'Item_ID';
            Material                   : String  @title: 'Material';
            Plant                      : String  @title: 'Plant';
            Route_Number               : String  @title: 'Route_Number';
            requested_Qty              : String  @title: 'Requested_Qty ';
            Priority                   : String  @title: 'Priority ';
            Allocation_Priority        : String  @title: 'Allocation_Priority';
            Excess_Push_Yes_or_No      : String  @title: 'Excess_Push_Yes_or_No';
            Final_Priority             : String  @title: 'Final_Priority ';
            allocated_VAN_stock        : String  @title: 'allocated_VAN_stock ';
            RPF                        : String  @title: 'RPF';
            Area_code                  : String  @title: 'Area_Code';
            Allocate_Residual_To_Route : String  @title: ' Allocate_Residual_To_Route ';
            Required_Qty               : String  @title: ' Required_Qty';
            Allocated_Qty              : String  @title: 'Allocated_Qty ';
            Stage_1_alloc              : String  @title: ' Stage_1_alloc';
            Stage_2_alloc              : String  @title: 'Stage_2_alloc';
            Depot_Level_Residual       : String  @title: 'Depot_Level_Residual ';
            Allocation_Qty_With_Excess : String  @title: 'Allocation_Qty_With_Excess ';
            Route_Level_Rounding       : String  @title: 'Route_Level_Rounding';
            RI_Qty                     : String  @title: ' RI_Qty ';
            Final_Allocation_Qty       : String  @title: 'Final_Allocation_Qty ';


    }


}

annotate service.Orde01 {
    Material_ID @(
        sap.value.list: 'fixed-values',
        Common        : {

        ValueList: {
            CollectionPath: 'MaterialID',


            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: Material_ID,
                    ValueListProperty: 'Material_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: Material_ID,
                    ValueListProperty: 'Material_Name',
                }
            ],
        }, }
    )
}

annotate service.Orde01 {
    Customer_ID @(
        sap.value.list: 'fixed-values',
        Common        : {

        ValueList: {
            CollectionPath: 'CustomerID',


            Parameters    : [{
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: Customer_ID,
                ValueListProperty: 'Customer_ID',
            }],
        }, }
    )
}

// annotate service.Orde01{
//     Customer_ID@(

//         Common:{
//            Text : 'Customer_ID',

//         },
//         ValueList.entity:Order_srv.CustomerID
//     )
// }

// annotate service.CustomerID with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value:Customer_ID
//     }]
// ) ;


@Capabilities: {FilterRestrictions: {FilterExpressionRestrictions: [{
    Property          : 'Order_Date',
    AllowedExpressions: 'SingleRange'
}]}}

// @Capabilities:{
//       SearchRestrictions : {Searchable : false}
//    }
annotate service.Orde01 with @(UI: {


    //   PresentationVariant: {
    //       GroupBy: [{

    //         $value: 'Order_ID',
    //         SortOrder: 'ascending'
    //       }],
    //       Visualizations: ['@UI.LineItem']
    //   },


    SelectionFields: [
        Order_Date,
        Material_ID,
        Customer_ID
    ],
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: Order_Date,
        },
        {
            $Type: 'UI.DataField',
            Value: Order_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: Customer_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: Item_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: Material_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: Request_Quantity,
        },
        {
            $Type: 'UI.DataField',
            Value: allocated_VAN_stock,
        },
        {
            $Type: 'UI.DataField',
            Value: Required_Qty,
        },
        {
            $Type: 'UI.DataField',
            Value: Allocated_Qty,
        },
        {
            $Type: 'UI.DataField',
            Value: RI_Qty,
        },
    ],
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '',
        TypeNamePlural: '',
        Title         : {
            $Type: 'UI.DataField',
            Label: 'Material_ID',
            Value: Material_ID,
        },


    },


});
//   annotate service.Orde01 with @(
//     UI.FieldGroup #GeneralInformation :{
//           $Type : 'UI.FieldGroupType',
//           Data :[
//             {
//                 $Type : 'UI.DataField',
//                 Value : Order_Date,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value :Order_ID
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Customer_ID,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Item_ID,
//             },{
//                 $Type : 'UI.DataField',
//                 Value : Material_ID,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Request_Quantity,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : allocated_VAN_stock,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Required_Qty,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Allocated_Qty,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : RI_Qty,
//             },
//           ],

//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneralInformation',
//         },
//     ],
//   );
