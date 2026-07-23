@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Journal Entry'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_journalentry_smgt
  as select from I_GLAccountLineItemSemTag
{
  key Ledger,
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key GLAccountHierarchy,
  key SemanticTag,
  key ValidityStartDate,
  key ValidityEndDate
}
where
      Ledger             = '0L'
  and GLAccountHierarchy = 'ZPL'
  and SemanticTag        = 'PL_RESULT'
  and IsReversal         is initial
  and IsReversed         is initial
