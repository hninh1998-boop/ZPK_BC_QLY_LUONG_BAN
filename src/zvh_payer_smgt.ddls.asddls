@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Payer'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_payer_smgt
  as select from    I_BusinessPartner as bp
    left outer join I_Customer        as cust on cust.Customer = bp.BusinessPartner
    left outer join I_Address_2       as addr on addr.AddressID = cust.AddressID
{
  key bp.BusinessPartner,
      @EndUserText.label: 'Payer Name'
      case
        when bp.OrganizationBPName2 is not initial
          or bp.OrganizationBPName3 is not initial
          or bp.OrganizationBPName4 is not initial
        then concat( concat( bp.OrganizationBPName2, bp.OrganizationBPName3 ), bp.OrganizationBPName4 )
        else bp.OrganizationBPName1
      end                                                                                                         as PayerName,

      @EndUserText.label: 'Payer Address'
      concat( concat( concat( concat( concat( concat(
        case when addr.HouseNumber       is not initial then concat( addr.HouseNumber,       ', ' ) else '' end,
        case when addr.StreetName        is not initial then concat( addr.StreetName,        ', ' ) else '' end ),
        case when addr.StreetPrefixName1 is not initial then concat( addr.StreetPrefixName1, ', ' ) else '' end ),
        case when addr.StreetPrefixName2 is not initial then concat( addr.StreetPrefixName2, ', ' ) else '' end ),
        case when addr.StreetSuffixName1 is not initial then concat( addr.StreetSuffixName1, ', ' ) else '' end ),
        case when addr.DistrictName      is not initial then concat( addr.DistrictName,      ', ' ) else '' end ),
        case when addr.CityName          is not initial then addr.CityName                          else '' end ) as PayerAddress
}
