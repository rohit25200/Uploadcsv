

using {  db.master,db}  from '../db/Schema';

service  Order_srv {
entity Van as projection on master.Van;
entity Order as projection on master.Order actions{
    
  action Edit(S_NO:Integer @label: 'SR_No'  ) returns String;
  
   //bound
    function cal(a:Integer,b:Integer) returns myresult;  
};

   @open
    type object {};

  action FileUploader(data:String) returns String; 
entity MaterialID as projection on master.Material_Master;
entity CustomerID as projection on master.Customer_Master;
entity Final_Allocation as projection on master.Final_Allocation;
entity Labels as projection on db.Labels;
@cds.redirection.target
define view Orde01 as select from master.Order{
Order.Order_Date,
Order.Order_ID,
Order.Customer_ID,
Order.Item_ID,
Order.Material_ID,
Order.Request_Quantity,
final.allocated_VAN_stock,
final.Allocated_Qty,
final.Required_Qty,
final.RI_Qty,
 
 };

 type myresult {
  sum: Integer;
 }
 
//unbond
 function cal(a:Integer,b:Integer) returns myresult;

}


       