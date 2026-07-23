@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Business Partner'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_bp_smgt
  as select from I_BusinessPartner
{
  key BusinessPartner,
      SearchTerm1,

      @EndUserText.label: 'Ship-To Party Name'
      case
        when OrganizationBPName1 is not initial
        then OrganizationBPName1
        else LastName
        end as shipToPartyName,

      @EndUserText.label: 'Bill-To Party Name'
      case
        when OrganizationBPName1 is not initial
        then OrganizationBPName1
        else LastName
        end as BillToPartyName,

      @EndUserText.label: 'Payer Name'
      case
        when OrganizationBPName2 is not initial
          or OrganizationBPName3 is not initial
          or OrganizationBPName4 is not initial
        then concat( concat( OrganizationBPName2, OrganizationBPName3 ), OrganizationBPName4 )
        else OrganizationBPName1
      end   as PayerName
}
