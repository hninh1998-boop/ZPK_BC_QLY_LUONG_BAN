@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Sales Order Item'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_soitem_smgt
  as select from I_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem
}
