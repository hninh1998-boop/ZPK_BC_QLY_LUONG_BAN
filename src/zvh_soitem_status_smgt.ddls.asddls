@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Overall Deli.Status (Item)'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_soitem_status_smgt
  as select from I_SDProcessStatusText
{
  key SDProcessStatus,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      SDProcessStatusDesc
}
where
  Language = $session.system_language
