@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Reject Reason'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_soitem_rejectreason_smgt
  as select from I_SalesDocumentRjcnReasonText
{
  key SalesDocumentRjcnReason,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      SalesDocumentRjcnReasonName
}
where
  Language = $session.system_language
