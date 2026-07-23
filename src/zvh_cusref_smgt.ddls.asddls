@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Customer Reference'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_cusref_smgt
  as select from I_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      PurchaseOrderByCustomer as customerReference
}
//where
//  PurchaseOrderByCustomer is not initial
