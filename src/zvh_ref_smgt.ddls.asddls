@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Reference'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_ref_smgt
  as select from I_JournalEntry
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
      DocumentReferenceID
}
