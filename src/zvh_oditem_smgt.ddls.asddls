@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Outbound Delivery Item'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_oditem_smgt
  as select from I_OutboundDeliveryItem
{
  key OutboundDelivery,
  key OutboundDeliveryItem
}
