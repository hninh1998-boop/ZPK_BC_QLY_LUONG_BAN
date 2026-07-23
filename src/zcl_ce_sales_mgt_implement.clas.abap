CLASS zcl_ce_sales_mgt_implement DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: tt_results TYPE STANDARD TABLE OF zce_sales_mgt WITH EMPTY KEY.

    TYPES: ry_customerReference        TYPE RANGE OF string,
           ry_salesOrder               TYPE RANGE OF string,
           ry_salesOrderItem           TYPE RANGE OF string,
           ry_soldToParty              TYPE RANGE OF string,
           ry_shipToParty              TYPE RANGE OF string,
           ry_payer                    TYPE RANGE OF string,
           ry_billToParty              TYPE RANGE OF string,
           ry_outboundDelivery         TYPE RANGE OF string,
           ry_outboundDeliveryItem     TYPE RANGE OF string,
           ry_material                 TYPE RANGE OF string,
           ry_plant                    TYPE RANGE OF string,
           ry_storageLocation          TYPE RANGE OF string,
           ry_goodsReceiptDate         TYPE RANGE OF string,
           ry_materialDocument         TYPE RANGE OF string,
           ry_billingDocument          TYPE RANGE OF string,
           ry_billingDate              TYPE RANGE OF string,
           ry_journalEntry             TYPE RANGE OF string,
           ry_reference                TYPE RANGE OF string,
           ry_salesOrganization        TYPE RANGE OF string,
           ry_documentDate             TYPE RANGE OF string,
           ry_distributionChannel      TYPE RANGE OF string,
           ry_division                 TYPE RANGE OF string,
           ry_salesOffice              TYPE RANGE OF string,
           ry_salesGroup               TYPE RANGE OF string,
           ry_plannedGoodsMovementDate TYPE RANGE OF string,
           ry_SDProcessStatus          TYPE RANGE OF string,
           ry_salesDocumentRjcnReason  TYPE RANGE OF string
           .

    TYPES: ry_string TYPE RANGE OF string.

    CLASS-METHODS requested
      IMPORTING
        io_request TYPE REF TO if_rap_query_request
      EXPORTING
        et_filters TYPE if_rap_query_filter=>tt_name_range_pairs.

    CLASS-METHODS select
      IMPORTING
        it_filters TYPE if_rap_query_filter=>tt_name_range_pairs
      EXPORTING
        et_results TYPE tt_results.

    CLASS-METHODS response
      IMPORTING
        io_request  TYPE REF TO if_rap_query_request
        io_response TYPE REF TO if_rap_query_response
      CHANGING
        ct_results  TYPE tt_results.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CE_SALES_MGT_IMPLEMENT IMPLEMENTATION.


  METHOD select.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Get params
    LOOP AT it_filters INTO DATA(ls_filter).
      CASE ls_filter-name.
        WHEN 'CUSTOMERREFERENCE'.
          DATA(lr_customerReference) = CORRESPONDING ry_customerreference( ls_filter-range ).
        WHEN 'SALESORDER'.
          DATA(lr_salesorder) = CORRESPONDING ry_salesorder( ls_filter-range ).
        WHEN 'SALESORDERITEM'.
          DATA(lr_salesorderitem) = CORRESPONDING ry_salesorderitem( ls_filter-range ).
        WHEN 'SOLDTOPARTY'.
          DATA(lr_soldToParty) = CORRESPONDING ry_soldToParty( ls_filter-range ).
        WHEN 'SHIPTOPARTY'.
          DATA(lr_shiptoparty) = CORRESPONDING ry_shiptoparty( ls_filter-range ).
        WHEN 'PAYER'.
          DATA(lr_payer) = CORRESPONDING ry_payer( ls_filter-range ).
        WHEN 'BILLTOPARTY'.
          DATA(lr_billtoparty) = CORRESPONDING ry_billtoparty( ls_filter-range ).
        WHEN 'OUTBOUNDDELIVERY'.
          DATA(lr_outboundDelivery) = CORRESPONDING ry_outbounddelivery( ls_filter-range ).
        WHEN 'OUTBOUNDDELIVERYITEM'.
          DATA(lr_outboundDeliveryItem) = CORRESPONDING ry_outbounddeliveryitem( ls_filter-range ).
        WHEN 'MATERIAL'.
          DATA(lr_material) = CORRESPONDING ry_material( ls_filter-range ).
        WHEN 'PLANT'.
          DATA(lr_plant) = CORRESPONDING ry_plant( ls_filter-range ).
        WHEN 'STORAGELOCATION'.
          DATA(lr_storageLocation) = CORRESPONDING ry_storagelocation( ls_filter-range ).
        WHEN 'GOODSRECEIPTDATE'.
          DATA(lr_goodsReceiptDate) = CORRESPONDING ry_goodsReceiptDate( ls_filter-range ).
        WHEN 'MATERIALDOCUMENT'.
          DATA(lr_materialdocument) = CORRESPONDING ry_materialdocument( ls_filter-range ).
        WHEN 'BILLINGDOCUMENT'.
          DATA(lr_billingDocument) = CORRESPONDING ry_billingDocument( ls_filter-range ).
          LOOP AT lr_billingdocument ASSIGNING FIELD-SYMBOL(<lfs_billingDocument>).
            IF <lfs_billingDocument>-low IS NOT INITIAL.
              <lfs_billingDocument>-low = |{ <lfs_billingDocument>-low WIDTH = 10 ALIGN = RIGHT PAD = '0' }|.
            ENDIF.
            IF <lfs_billingDocument>-high IS NOT INITIAL.
              <lfs_billingDocument>-high = |{ <lfs_billingDocument>-high WIDTH = 10 ALIGN = RIGHT PAD = '0' }|.
            ENDIF.
          ENDLOOP.
        WHEN 'BILLINGDATE'.
          DATA(lr_billingDate) = CORRESPONDING ry_billingDate( ls_filter-range ).
        WHEN 'JOURNALENTRY'.
          DATA(lr_journalentry) = CORRESPONDING ry_journalentry( ls_filter-range ).
        WHEN 'REFERENCE'.
          DATA(lr_reference) = CORRESPONDING ry_reference( ls_filter-range ).
        WHEN 'SALESORGANIZATION'.
          DATA(lr_SALESORGANIZATION) = CORRESPONDING ry_SALESORGANIZATION( ls_filter-range ).
        WHEN 'DOCUMENTDATE'.
          DATA(lr_DOCUMENTDATE) = CORRESPONDING ry_DOCUMENTDATE( ls_filter-range ).
        WHEN 'DISTRIBUTIONCHANNEL'.
          DATA(lr_DISTRIBUTIONCHANNEL) = CORRESPONDING ry_DISTRIBUTIONCHANNEL( ls_filter-range ).
        WHEN 'DIVISION'.
          DATA(lr_DIVISION) = CORRESPONDING ry_DIVISION( ls_filter-range ).
        WHEN 'PLANNEDGOODSMOVEMENTDATE'.
          DATA(lr_PLANNEDGOODSMOVEMENTDATE) = CORRESPONDING ry_PLANNEDGOODSMOVEMENTDATE( ls_filter-range ).
        WHEN 'SDPROCESSSTATUS'.
          DATA(lr_SDPROCESSSTATUS) = CORRESPONDING ry_SDPROCESSSTATUS( ls_filter-range ).
        WHEN 'SALESDOCUMENTRJCNREASON'.
          DATA(lr_SALESDOCUMENTRJCNREASON) = CORRESPONDING ry_SALESDOCUMENTRJCNREASON( ls_filter-range ).
        WHEN 'COMMERCIALINVOICE'.
          DATA(lr_COMMERCIALINVOICE) = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'SOTOKHAIXK'.
          DATA(lr_SOTOKHAIXK) = CORRESPONDING ry_string( ls_filter-range ).
        WHEN 'SOHOPDONGUYTHACXK'.
          DATA(lr_SOHOPDONGUYTHACXK) = CORRESPONDING ry_string( ls_filter-range ).
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "check auth CC-Sales Org - v10
*    DATA: lr_salesorganization_auth LIKE lr_salesorganization.
*    SELECT salesorganization  FROM i_salesorganization
*    WHERE salesorganization  IN @lr_salesorganization
*    INTO TABLE @DATA(lt_saleorg).
*    LOOP AT lt_saleorg INTO DATA(ls_saleorg).
*      AUTHORITY-CHECK OBJECT 'ZAO_SMGT'
*        ID 'ZAF_VOKRG' FIELD ls_saleorg-salesorganization
*        ID 'ACTVT' FIELD '03'.
*      IF sy-subrc = 0.
*        APPEND INITIAL LINE TO lr_salesorganization_auth ASSIGNING FIELD-SYMBOL(<fs_companycode>).
*        <fs_companycode>-low = ls_saleorg-salesorganization.
*        <fs_companycode>-option = 'EQ'.
*        <fs_companycode>-sign = 'I'.
*      ENDIF.
*    ENDLOOP.
*    IF lr_salesorganization_auth[] IS INITIAL.
*      APPEND INITIAL LINE TO lr_salesorganization_auth ASSIGNING <fs_companycode>.
*      <fs_companycode>-low = 'XXXX'. "No Company Code access
*      <fs_companycode>-option = 'EQ'.
*      <fs_companycode>-sign = 'I'.
*    ENDIF.
*
*    CHECK 1 = 1.

*    AUTHORITY-CHECK OBJECT 'ZAO_SMGT'
*    ID 'ACTVT' FIELD '03'
*    ID 'ZRT_SMGT' FIELD

*    DATA: lr_bukrs_auth TYPE RANGE OF string.
*    SELECT companycode  FROM i_companycode
*    INTO TABLE @DATA(lt_companycode).
*    LOOP AT lt_companycode INTO DATA(ls_companycode).
*      AUTHORITY-CHECK OBJECT 'F_BKPF_BUK'
*        ID 'BUKRS' FIELD ls_companycode-companycode
*        ID 'ACTVT' FIELD '03'.
*      IF sy-subrc = 0.
*        APPEND INITIAL LINE TO lr_bukrs_auth ASSIGNING FIELD-SYMBOL(<fs_companycode>).
*        <fs_companycode>-low = ls_companycode-companycode.
*        <fs_companycode>-option = 'EQ'.
*        <fs_companycode>-sign = 'I'.
*      ENDIF.
*    ENDLOOP.
*    IF lr_bukrs_auth[] IS INITIAL.
*      APPEND INITIAL LINE TO lr_bukrs_auth ASSIGNING <fs_companycode>.
*      <fs_companycode>-low = 'XXXX'. "No Company Code access
*      <fs_companycode>-option = 'EQ'.
*      <fs_companycode>-sign = 'I'.
*    ENDIF.
*
*    DATA: lr_salesorganization_auth LIKE lr_salesorganization.
*    SELECT salesorganization  FROM i_salesorganization
*    WHERE salesorganization  IN @lr_salesorganization
*    INTO TABLE @DATA(lt_saleorg).
*    LOOP AT lt_saleorg INTO DATA(ls_saleorg).
*      AUTHORITY-CHECK OBJECT 'V_VBRK_VKO'
*        ID 'ACTVT' FIELD '03'
**              ID 'VTWEG' DUMMY
**      ID 'SPART' DUMMY
*        ID 'VKORG' FIELD ls_saleorg-salesorganization.
*      IF sy-subrc = 0.
*        APPEND INITIAL LINE TO lr_salesorganization_auth ASSIGNING FIELD-SYMBOL(<fs_companycode>).
*        <fs_companycode>-low = ls_saleorg-salesorganization.
*        <fs_companycode>-option = 'EQ'.
*        <fs_companycode>-sign = 'I'.
*      ENDIF.
*    ENDLOOP.
*    IF lr_salesorganization_auth[] IS INITIAL.
*      APPEND INITIAL LINE TO lr_salesorganization_auth ASSIGNING <fs_companycode>.
*      <fs_companycode>-low = 'XXXX'. "No Company Code access
*      <fs_companycode>-option = 'EQ'.
*      <fs_companycode>-sign = 'I'.
*    ENDIF.
*
*    CHECK 1 = 1.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Get Data
    "1.1. Get key
    SELECT FROM I_SalesOrderItem AS a
    LEFT JOIN I_OutboundDeliveryItem AS b
    ON b~ReferenceSDDocument = a~SalesOrder
    AND b~ReferenceSDDocumentItem = a~SalesOrderItem
    AND b~ReferenceSDDocumentCategory = 'C'
    LEFT JOIN I_MaterialDocumentItem_2 AS c
    ON c~DeliveryDocument = b~OutboundDelivery
    AND c~DeliveryDocumentItem = b~OutboundDeliveryItem
    AND c~GoodsMovementType = '601'
    AND c~ReversedMaterialDocument IS INITIAL
    LEFT JOIN I_BillingDocumentItem AS d
    ON d~ReferenceSDDocument = c~DeliveryDocument
    AND d~ReferenceSDDocumentItem = c~DeliveryDocumentItem
    LEFT JOIN I_GLAccountLineItemSemTag AS e
    ON e~Ledger = '0L'
    AND e~SourceLedger = '0L'
    AND e~ReferenceDocument = d~BillingDocument
    AND e~ReferenceDocumentItem = d~BillingDocumentItem
    AND e~GLAccountHierarchy = 'ZPL'
    AND e~SemanticTag = 'PL_RESULT'
    AND e~IsReversal IS INITIAL
    AND e~IsReversed IS INITIAL
    LEFT JOIN I_JournalEntry AS f
    ON f~AccountingDocument = e~AccountingDocument
    AND f~CompanyCode = e~CompanyCode
    AND f~FiscalYear = e~FiscalYear
    LEFT JOIN I_OutboundDelivery AS g
    ON g~OutboundDelivery = b~OutboundDelivery
    LEFT JOIN I_BillingDocument AS h
    ON h~BillingDocument = d~BillingDocument
    FIELDS
    a~SalesOrder,
    a~SalesOrderItem,
    b~OutboundDelivery,
    b~OutboundDeliveryItem,
    c~MaterialDocument,
    d~BillingDocument,
    e~AccountingDocument AS journalEntry,

    "Key join I_MaterialDocumentItem_2
    c~MaterialDocumentYear,
    c~MaterialDocumentItem,

    "Key join I_GLAccountLineItemSemTag
    e~Ledger,
    e~SourceLedger,
    e~CompanyCode,
    e~FiscalYear,
    e~LedgerGLLineItem,
    e~GLAccountHierarchy,
    e~SemanticTag,
    e~ValidityStartDate,
    e~ValidityEndDate
WHERE
    a~PurchaseOrderByCustomer IN @lr_customerreference
    AND a~SalesOrder IN @lr_salesorder
    AND a~SalesOrderItem IN @lr_salesorderitem
    AND a~SoldToParty IN @lr_soldtoparty
    AND a~ShipToParty IN @lr_shiptoparty
    AND a~PayerParty IN @lr_payer
    AND a~BillToParty IN @lr_BillToParty
    AND b~OutboundDelivery IN @lr_outboundDelivery
    AND b~OutboundDeliveryItem IN @lr_outboundDeliveryitem
    AND c~Material IN @lr_material
    AND c~Plant IN @lr_plant
    AND c~StorageLocation IN @lr_storagelocation
    AND c~PostingDate IN @lr_goodsreceiptdate
    AND c~MaterialDocument IN @lr_materialdocument
    AND d~BillingDocument IN @lr_billingDocument
    AND e~PostingDate IN @lr_billingdate
    AND e~AccountingDocument IN @lr_journalentry
    AND f~DocumentReferenceID IN @lr_reference
    AND a~SalesOrganization IN @lr_SALESORGANIZATION
    AND a~SalesOrderDate IN @lr_documentdate
    AND a~DistributionChannel IN @lr_distributionchannel
    AND a~division IN @lr_division
    AND g~PlannedGoodsIssueDate IN @lr_plannedgoodsmovementdate
    AND a~sdprocessstatus IN @lr_SDPROCESSSTATUS
    AND a~salesDocumentRjcnReason IN @lr_salesDocumentRjcnReason
    AND b~DeliveryDocumentItemCategory <> 'CB99'
    AND ( ( h~BillingDocumentType IS NOT NULL AND h~BillingDocumentType <> 'F8' )
         OR h~BillingDocumentType IS NULL )

    "Chỉ giữ row có LedgerGLLineItem = MAX trong group (hoặc e là NULL do LEFT JOIN)
    AND ( e~LedgerGLLineItem IS NULL OR
          e~LedgerGLLineItem = (
              SELECT MAX( e2~LedgerGLLineItem )
              FROM I_GLAccountLineItemSemTag AS e2
              WHERE e2~ReferenceDocument     = e~ReferenceDocument
                AND e2~ReferenceDocumentItem = e~ReferenceDocumentItem
                AND e~CompanyCode IN @lr_salesorganization
                AND e2~Ledger                = '0L'
                AND e2~GLAccountHierarchy    = 'ZPL'
                AND e2~SemanticTag           = 'PL_RESULT'
                AND e2~IsReversal            IS INITIAL
                AND e2~IsReversed            IS INITIAL
          )
      )
    INTO TABLE @DATA(lt_keys).

    "1.2. Get Outbound Reverse
    DATA: lr_od_reverse     TYPE RANGE OF mblnr,
          lr_matdoc_reverse TYPE RANGE OF mblnr.

    LOOP AT lt_keys INTO DATA(ls_key) WHERE MaterialDocument IS NOT INITIAL.
      APPEND INITIAL LINE TO lr_od_reverse ASSIGNING FIELD-SYMBOL(<lfs_od_reverse>).
      <lfs_od_reverse>-sign = 'I'.
      <lfs_od_reverse>-option = 'EQ'.
      <lfs_od_reverse>-low = ls_key-MaterialDocument.
    ENDLOOP.

    IF lr_od_reverse IS NOT INITIAL.
      SELECT FROM I_MaterialDocumentItem_2
      FIELDS ReversedMaterialDocument
      WHERE ReversedMaterialDocument IN @lr_od_reverse
      INTO TABLE @DATA(lt_matdoc_reverse).

      IF lt_matdoc_reverse IS NOT INITIAL.
        LOOP AT lt_matdoc_reverse INTO DATA(ls_matdoc_reverse).
          APPEND INITIAL LINE TO lr_matdoc_reverse ASSIGNING FIELD-SYMBOL(<lfs_matdoc_reverse>).
          <lfs_matdoc_reverse>-sign = 'I'.
          <lfs_matdoc_reverse>-option = 'EQ'.
          <lfs_matdoc_reverse>-low = ls_matdoc_reverse-ReversedMaterialDocument.
        ENDLOOP.

        DELETE lt_keys WHERE MaterialDocument IN lr_matdoc_reverse.
      ENDIF.
    ENDIF.

    "1.3. Get Billing Reverse
    DATA: lr_billing         TYPE RANGE OF I_BillingDocument-BillingDocument,
          lr_billing_reverse TYPE RANGE OF I_BillingDocument-BillingDocument.

    LOOP AT lt_keys INTO ls_key WHERE BillingDocument IS NOT INITIAL.
      APPEND INITIAL LINE TO lr_billing ASSIGNING FIELD-SYMBOL(<lfs_billing>).
      <lfs_billing>-sign = 'I'.
      <lfs_billing>-option = 'EQ'.
      <lfs_billing>-low = ls_key-BillingDocument.
    ENDLOOP.

    IF lr_billing IS NOT INITIAL.
      SELECT FROM I_BillingDocument
      FIELDS BillingDocument
      WHERE
          BillingDocument IN @lr_billing
          AND ( ( SDDocumentCategory = 'M' AND BillingDocumentIsCancelled = 'X' )
            OR SDDocumentCategory = 'N' )
      INTO TABLE @DATA(lt_billing_origin).

      IF lt_billing_origin IS NOT INITIAL.
        LOOP AT lt_billing_origin INTO DATA(ls_billing_origin).
          APPEND INITIAL LINE TO lr_billing_reverse ASSIGNING FIELD-SYMBOL(<lfs_billing_reverse>).
          <lfs_billing_reverse>-sign = 'I'.
          <lfs_billing_reverse>-option = 'EQ'.
          <lfs_billing_reverse>-low = ls_billing_origin-BillingDocument.
        ENDLOOP.

        SELECT FROM I_BillingDocument
        FIELDS BillingDocument
        FOR ALL ENTRIES IN @lt_billing_origin
        WHERE
            CancelledBillingDocument = @lt_billing_origin-BillingDocument
        INTO TABLE @DATA(lt_billing_reverse).

        LOOP AT lt_billing_reverse INTO DATA(ls_billing_reverse).
          APPEND INITIAL LINE TO lr_billing_reverse ASSIGNING <lfs_billing_reverse>.
          <lfs_billing_reverse>-sign = 'I'.
          <lfs_billing_reverse>-option = 'EQ'.
          <lfs_billing_reverse>-low = ls_billing_reverse-BillingDocument.
        ENDLOOP.

        DELETE lt_keys WHERE BillingDocument IN lr_billing_reverse.
      ENDIF.
    ENDIF.

    "2. Get base
    SELECT FROM @lt_keys AS a
    LEFT JOIN I_SalesOrderItem AS b
        ON b~SalesOrder = a~SalesOrder
        AND b~SalesOrderItem = a~SalesOrderItem
    LEFT JOIN I_SDProcessStatusText AS bStatusText
        ON bStatusText~SDProcessStatus = b~SDProcessStatus
        AND bStatusText~Language = @sy-langu
    LEFT JOIN I_SalesDocumentRjcnReasonText AS bRejectText
        ON bRejectText~SalesDocumentRjcnReason = b~SalesDocumentRjcnReason
        AND bRejectText~Language = @sy-langu
    LEFT JOIN I_BusinessPartner AS bSoldToPartyText
        ON bSoldToPartyText~BusinessPartner = b~SoldToParty
    LEFT JOIN I_BusinessPartner AS bShipToPartyText
        ON bShipToPartyText~BusinessPartner = b~ShipToParty
    LEFT JOIN I_BusinessPartner AS bBillToPartyText
        ON bBillToPartyText~BusinessPartner = b~BillToParty
    LEFT JOIN I_ProductBasicTextTP_2 AS bMatLongText
        ON bMatLongText~Product = b~Product
        AND bMatLongText~TextObjectType = 'GRUN'
        AND bMatLongText~Language = @sy-langu

    LEFT JOIN I_MaterialDocumentItem_2 AS c
        ON c~MaterialDocument = a~MaterialDocument
        AND c~MaterialDocumentYear = a~MaterialDocumentYear
        AND c~MaterialDocumentItem = a~MaterialDocumentItem
    LEFT JOIN I_GLAccountLineItemSemTag AS d
        ON d~AccountingDocument = a~journalEntry
        AND d~Ledger = a~Ledger
        AND d~SourceLedger = a~SourceLedger
        AND d~CompanyCode = a~CompanyCode
        AND d~FiscalYear = a~FiscalYear
        AND d~LedgerGLLineItem = a~LedgerGLLineItem
        AND d~GLAccountHierarchy = a~GLAccountHierarchy
        AND d~SemanticTag = a~SemanticTag
        AND d~ValidityStartDate = a~ValidityStartDate
        AND d~ValidityEndDate = a~ValidityEndDate
    LEFT JOIN I_JournalEntry AS e
        ON e~AccountingDocument = d~AccountingDocument
        AND e~CompanyCode = d~CompanyCode
        AND e~FiscalYear = d~FiscalYear
    LEFT JOIN I_OutboundDelivery AS f
        ON f~OutboundDelivery = a~OutboundDelivery
    LEFT JOIN I_ProductText AS g
        ON g~Product = b~Product
        AND g~Language = @sy-langu
    FIELDS
        "Key fields
        a~SalesOrder,
        a~SalesOrderItem,
        a~OutboundDelivery,
        a~OutboundDeliveryItem,
        a~MaterialDocument,
        a~BillingDocument,
        a~journalEntry,

        "Base fields
        b~PurchaseOrderByCustomer AS customerReference,
        b~SoldToParty,
        b~ShipToParty,
        b~PayerParty AS payer,
        b~BillToParty,
        b~Product AS Material,
        c~Plant,
        c~StorageLocation,
        c~PostingDate AS goodsReceiptDate,
        d~PostingDate AS billingDate,
        e~DocumentReferenceID AS reference,
        b~SalesOrganization,
        b~SalesOrderDate AS documentDate,
        b~DistributionChannel,
        b~Division,
        f~PlannedGoodsIssueDate AS plannedGoodsMovementDate,
        g~ProductName,
        b~SDProcessStatuS,
        bstatustext~SDProcessStatusDesc,
        b~salesDocumentRjcnReason,
        bRejectText~SalesDocumentRjcnReasonName,
        bsoldtopartytext~SearchTerm1,
        CASE
            WHEN bshiptopartytext~OrganizationBPName1 IS NOT INITIAL
            THEN bshiptopartytext~OrganizationBPName1
            ELSE bshiptopartytext~LastName
            END AS shipToPartyName,
        CASE
            WHEN bbilltopartytext~OrganizationBPName1 IS NOT INITIAL
            THEN bbilltopartytext~OrganizationBPName1
            ELSE bbilltopartytext~LastName
            END AS billToPartyName,
        bMatLongText~ProductLongText AS materialLongText
    INTO TABLE @DATA(lt_bases).

    "3. Quantity field
    DATA(lt_oditem) = lt_keys.
    DELETE lt_oditem WHERE OutboundDelivery IS INITIAL.
    DELETE lt_oditem WHERE OutboundDeliveryItem IS INITIAL.
    SORT lt_oditem BY OutboundDelivery OutboundDeliveryItem.
    DELETE ADJACENT DUPLICATES FROM lt_oditem COMPARING OutboundDelivery OutboundDeliveryItem.

    SELECT FROM @lt_oditem AS a
    INNER JOIN I_OutboundDeliveryItem AS b
        ON b~OutboundDelivery = a~OutboundDelivery
        AND b~OutboundDeliveryItem = a~OutboundDeliveryItem
        AND b~DeliveryDocumentItemCategory <> 'CB99' "Chỉ lấy line tổng, không lấy line quản lý batch
    FIELDS
        a~OutboundDelivery,
        a~OutboundDeliveryItem,
        b~ActualDeliveredQtyInBaseUnit
    INTO TABLE @DATA(lt_quantity).

    "4. Longtext VF03
    SELECT FROM @lt_keys AS a
    INNER JOIN I_BillingDocumentTextTP AS b
        ON b~BillingDocument = a~BillingDocument
        AND b~Language = @sy-langu
        AND ( b~LongTextID = 'Z027'         "Commercial Invvoice
              OR b~LongTextID = 'Z020'      "Số tờ khai xuất khẩu
              OR b~LongTextID = 'Z011' )    "Số hợp đồng ủy thác XK
    FIELDS
        "Key fields
        a~SalesOrder,
        a~SalesOrderItem,
        a~OutboundDelivery,
        a~OutboundDeliveryItem,
        a~MaterialDocument,
        a~BillingDocument,
        a~journalEntry,

        "API Fields
        b~Language,
        b~LongTextID
    INTO TABLE @DATA(lt_Longtext_VF03).

    READ ENTITIES OF i_billingdocumenttp FORWARDING PRIVILEGED
    ENTITY billingdocumenttext
    FIELDS ( billingdocument
             language
             longtextid
             longtext )
    WITH VALUE #( FOR ls_getbilllong IN lt_Longtext_VF03
        ( %key-BillingDocument = ls_getbilllong-BillingDocument
          %key-LongTextID = ls_getbilllong-LongTextID
          %key-Language = ls_getbilllong-Language
        )
    )
    RESULT DATA(lt_billingtexts_h)
    FAILED DATA(lt_failed).

    "5. Get Payer Name + Payer Address
    SELECT FROM @lt_bases AS a
    INNER JOIN i_customer AS b
        ON b~Customer = a~payer
    LEFT JOIN i_bupaidentification AS c
        ON c~BusinessPartner = a~payer
        AND c~BPIdentificationType = 'VATRU'
    FIELDS
        "Key fields
        a~SalesOrder,
        a~SalesOrderItem,
        a~OutboundDelivery,
        a~OutboundDeliveryItem,
        a~MaterialDocument,
        a~BillingDocument,
        a~journalEntry,

        "Payer fields
        b~customer AS bpnumber,
        b~addressid,
        b~vatregistration,
        b~isonetimeaccount,
        b~createdbyuser,
        b~creationdate,
        b~country,
        c~BPIdentificationNumber
    INTO TABLE @DATA(lt_payer_details).
    IF sy-subrc = 0.
      SELECT FROM i_address_2
      WITH PRIVILEGED ACCESS
      FIELDS
          "key field
          AddressID,

          "Details fields
          addresseefullname,
          organizationname1,
          organizationname2,
          organizationname3,
          organizationname4,
          housenumber ,
          streetname ,
          streetprefixname1 ,
          streetprefixname2 ,
          streetsuffixname1 ,
          streetsuffixname2 ,
          districtname ,
          cityname ,
          country
      FOR ALL ENTRIES IN @lt_payer_details
      WHERE AddressID = @lt_payer_details-AddressID
      INTO TABLE @DATA(lt_address_2).
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Get Result
    LOOP AT lt_keys INTO ls_key.
      APPEND INITIAL LINE TO et_results ASSIGNING FIELD-SYMBOL(<lfs_result>).
      "Key fields
      <lfs_result>-salesOrder = ls_key-SalesOrder.
      <lfs_result>-salesOrderItem = ls_key-SalesOrderItem.
      <lfs_result>-outboundDelivery = ls_key-OutboundDelivery.
      <lfs_result>-outboundDeliveryItem = ls_key-OutboundDeliveryItem.
      <lfs_result>-materialDocument = ls_key-MaterialDocument.
      <lfs_result>-billingDocument = ls_key-BillingDocument.
      <lfs_result>-journalEntry = ls_key-journalEntry.

      "Base fields
      READ TABLE lt_bases INTO DATA(ls_base) WITH KEY
        SalesOrder = ls_key-SalesOrder
        SalesOrderItem = ls_key-SalesOrderItem
        OutboundDelivery = ls_key-OutboundDelivery
        OutboundDeliveryItem = ls_key-OutboundDeliveryItem
        MaterialDocument = ls_key-MaterialDocument
        BillingDocument = ls_key-BillingDocument
        journalEntry = ls_key-journalEntry.
      IF sy-subrc = 0.
        <lfs_result>-customerReference = ls_base-customerReference.
        <lfs_result>-soldToParty = ls_base-SoldToParty.
        <lfs_result>-shipToParty = ls_base-ShipToParty.
        <lfs_result>-payer = ls_base-payer.
        <lfs_result>-billToParty = ls_base-BillToParty.
        <lfs_result>-material = ls_base-Material.
        <lfs_result>-plant = ls_base-Plant.
        <lfs_result>-storageLocation = ls_base-StorageLocation.
        <lfs_result>-goodsReceiptDate = ls_base-goodsReceiptDate.
        <lfs_result>-billingDate = ls_base-billingDate.
        <lfs_result>-reference = ls_base-reference.
        <lfs_result>-salesOrganization = ls_base-salesOrganization.
        <lfs_result>-documentDate = ls_base-documentDate.
        <lfs_result>-distributionChannel = ls_base-distributionChannel.
        <lfs_result>-division = ls_base-division.
        <lfs_result>-plannedGoodsMovementDate = ls_base-plannedGoodsMovementDate.
        <lfs_result>-productName = ls_base-productName.
        <lfs_result>-SDProcessStatus = ls_base-SDProcessStatus.
        <lfs_result>-SDProcessStatusDesc = ls_base-SDProcessStatusDesc.
        <lfs_result>-salesDocumentRjcnReason = ls_base-salesDocumentRjcnReason.
        <lfs_result>-salesDocumentRjcnReasonName = ls_base-salesDocumentRjcnReasonName.
        <lfs_result>-SearchTerm1 = ls_base-SearchTerm1.
        <lfs_result>-shipToPartyName = ls_base-shipToPartyName.
        <lfs_result>-billToPartyName = ls_base-billToPartyName.
        <lfs_result>-materialLongText = ls_base-materialLongText.

        "Payer Name + Payer Address
        DATA: wa_document         TYPE zst_document_info,
              wa_customer_details TYPE zst_businesspartner_info.

        wa_document-companycode = ls_key-CompanyCode.
        wa_document-accountingdocument = ls_key-journalentry.
        wa_document-fiscalyear = ls_key-fiscalyear.
        wa_document-customer   = ls_base-payer.

        zcl_jp_common_core=>get_instance( )->get_businesspartner_details(
          EXPORTING
            i_document  = wa_document
          IMPORTING
            o_bpdetails = wa_customer_details
        ).

        <lfs_result>-payerName = wa_customer_details-bpname.
        <lfs_result>-payerAddress = wa_customer_details-bpaddress.
      ENDIF.

      "Quantity field
      READ TABLE lt_quantity INTO DATA(ls_quantity) WITH KEY
          OutboundDelivery = ls_key-OutboundDelivery
          OutboundDeliveryItem = ls_key-OutboundDeliveryItem.
      IF sy-subrc = 0.
        <lfs_result>-quantity = ls_quantity-ActualDeliveredQtyInBaseUnit.
      ENDIF.

      "Commercial Invoice - READ ENTITY Z027
      "Số tờ khai xuất khẩu - READ ENTITY Z020
      "Số hợp đồng ủy thác XK - READ ENTITY Z011
      LOOP AT lt_billingtexts_h INTO DATA(ls_billingtexts_h)
        USING KEY entity
        WHERE
            %key-BillingDocument = ls_key-BillingDocument AND
            %key-Language = sy-langu.

        READ TABLE lt_Longtext_VF03 INTO DATA(ls_Longtext_VF03) WITH KEY
         SalesOrder = ls_key-SalesOrder
         SalesOrderItem = ls_key-SalesOrderItem
         OutboundDelivery = ls_key-OutboundDelivery
         OutboundDeliveryItem = ls_key-OutboundDeliveryItem
         MaterialDocument = ls_key-MaterialDocument
         BillingDocument = ls_key-BillingDocument
         journalEntry = ls_key-journalEntry
         LongTextID = ls_billingtexts_h-LongTextID.
        IF sy-subrc = 0.
          CASE ls_Longtext_VF03-LongTextID.
            WHEN 'Z027'.
              <lfs_result>-commercialInvoice = ls_billingtexts_h-LongText.
            WHEN 'Z020'.
              <lfs_result>-soToKhaiXK = ls_billingtexts_h-LongText.
            WHEN 'Z011'.
              <lfs_result>-soHopDongUyThacXK = ls_billingtexts_h-LongText.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.

*      "Commercial Invoice - Get API - ID = Z027
*      "BillingDocument='Data'
*      "Language='EN'
*      "LongTextID='Z027'
*
*      "Sample:
*      "https://my426501-api.s4hana.cloud.sap
*      "/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV/A_BillingDocumentText
*      "(BillingDocument='90000011',Language='EN',LongTextID='Z027')
*      READ TABLE lt_commercial_invoice INTO DATA(ls_commercial_invoice) WITH KEY
*       SalesOrder = ls_key-SalesOrder
*       SalesOrderItem = ls_key-SalesOrderItem
*       OutboundDelivery = ls_key-OutboundDelivery
*       OutboundDeliveryItem = ls_key-OutboundDeliveryItem
*       MaterialDocument = ls_key-MaterialDocument
*       BillingDocument = ls_key-BillingDocument
*       journalEntry = ls_key-journalEntry.
*      IF sy-subrc = 0.
*        DATA(lv_endpoint) =
*          |/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV/A_BillingDocumentText|
*          && |(BillingDocument='{ ls_key-BillingDocument }',|
*          && |Language='{ ls_commercial_invoice-Language }',|
*          && |LongTextID='{ ls_commercial_invoice-LongTextID }')|.
*
*        DATA(lv_result) = zcl_call_api_sales_mgt=>commercial_invoice(
*          EXPORTING
*            iv_endpoint = lv_endpoint
*            iv_method   = 'GET'
*        ).
*
*        IF zcl_call_api_sales_mgt=>code = 200.
*          FIND REGEX '"LongText"\s*:\s*"([^"]*)"' IN lv_result
*              SUBMATCHES DATA(lv_commercial_invoice).
*          CONDENSE lv_commercial_invoice.
*          <lfs_result>-commercialInvoice = lv_commercial_invoice.
*        ENDIF.
*      ENDIF.




*      READ TABLE lt_payer_details INTO DATA(ls_payer_details) WITH KEY
*         SalesOrder = ls_key-SalesOrder
*         SalesOrderItem = ls_key-SalesOrderItem
*         OutboundDelivery = ls_key-OutboundDelivery
*         OutboundDeliveryItem = ls_key-OutboundDeliveryItem
*         MaterialDocument = ls_key-MaterialDocument
*         BillingDocument = ls_key-BillingDocument
*         journalEntry = ls_key-journalEntry.
*      IF sy-subrc = 0.
*        READ TABLE lt_address_2 INTO DATA(ls_address_2) WITH KEY
*            AddressID = ls_payer_details-AddressID.
*        IF sy-subrc = 0.
*          DATA(lv_payername) = COND #( WHEN ls_address_2-organizationname2 IS NOT INITIAL
*                                              OR ls_address_2-organizationname3 IS NOT INITIAL
*                                              OR ls_address_2-organizationname4 IS NOT INITIAL
*                                          THEN |{ ls_address_2-organizationname2 }{ ls_address_2-organizationname3 }{ ls_address_2-organizationname4 }|
*                                          ELSE |{ ls_address_2-organizationname1 }| ).
*          DATA(lv_payeraddress) = |{ ls_address_2-housenumber }{ ls_address_2-streetname }{ ls_address_2-streetprefixname1 }{ ls_address_2-streetprefixname2 }{ ls_address_2-streetsuffixname1 }{ ls_address_2-districtname }, { ls_address_2-cityname }|.
*          REPLACE ALL OCCURRENCES OF `, , , , , , ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `, , , , , ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `, , , , ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `, , , ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `, , ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `, ,` IN lv_payeraddress WITH `,`.
*          REPLACE ALL OCCURRENCES OF `,,` IN lv_payeraddress WITH `,`.
*
*          SHIFT lv_payeraddress LEFT DELETING LEADING `,`.
*          SHIFT lv_payeraddress RIGHT DELETING TRAILING `,`.
*          SHIFT lv_payeraddress LEFT DELETING LEADING space.
*
*          lv_payeraddress = |{ lv_payeraddress }, { ls_address_2-Country }|.
*        ENDIF.
*      ENDIF.



      "Check để tô màu line item nếu chưa full luồng SO --> OD --> Billing
      IF <lfs_result>-outboundDelivery IS NOT INITIAL
       AND ( <lfs_result>-materialDocument IS INITIAL OR
             <lfs_result>-billingDocument IS INITIAL OR
             <lfs_result>-journalEntry IS INITIAL ).
        <lfs_result>-criticality = 1.
      ELSE.
        <lfs_result>-criticality = 0.
      ENDIF.

    ENDLOOP.

    IF lr_commercialinvoice IS NOT INITIAL.
      DELETE et_results WHERE commercialInvoice NOT IN lr_commercialinvoice.
    ENDIF.
    IF lr_sotokhaixk IS NOT INITIAL.
      DELETE et_results WHERE soToKhaiXK NOT IN lr_sotokhaixk.
    ENDIF.
    IF lr_sohopdonguythacxk IS NOT INITIAL.
      DELETE et_results WHERE soHopDongUyThacXK NOT IN lr_sohopdonguythacxk.
    ENDIF.

*    SORT et_results BY salesOrder
*                       salesOrderItem
*                       outboundDelivery
*                       outboundDeliveryItem
*                       materialDocument
*                       billingDocument
*                       journalEntry
*                       material.
*    DELETE ADJACENT DUPLICATES FROM et_results COMPARING   salesOrder
*                                                           salesOrderItem
*                                                           outboundDelivery
*                                                           outboundDeliveryItem
*                                                           materialDocument
*                                                           billingDocument
*                                                           journalEntry
*                                                           material.
  ENDMETHOD.


  METHOD requested.
    TRY.
        et_filters = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
        "handle exception
    ENDTRY.
  ENDMETHOD.


  METHOD response.
    " ── a. RESPONSE ────────────────────────────────
    DATA(lv_total) = lines( ct_results ).

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( CONV int8( lv_total ) ).
    ENDIF.
    " ── b. HANDLE SORT ─────────────────────────────────────
    DATA(lt_sort) = io_request->get_sort_elements( ).
    IF lt_sort IS NOT INITIAL.
      DATA lt_sort_order TYPE abap_sortorder_tab.
      LOOP AT lt_sort INTO DATA(ls_sort).
        APPEND VALUE #(
            name       = ls_sort-element_name
            descending = ls_sort-descending
        ) TO lt_sort_order.
      ENDLOOP.
      SORT ct_results BY (lt_sort_order).
    ELSE.
      " Default sort
      SORT ct_results BY plannedGoodsMovementDate.
    ENDIF.
    " ── c. PAGING ──────────────────────────────────────────
    DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
    DATA(lv_top)  = io_request->get_paging( )->get_page_size( ).

    IF lv_top = if_rap_query_paging=>page_size_unlimited.
      lv_top = lv_total.
    ENDIF.

    IF lv_skip > 0.
      DELETE ct_results TO lv_skip.
    ENDIF.

    IF lv_top < lines( ct_results ).
      DELETE ct_results FROM lv_top + 1.
    ENDIF.

    io_response->set_data( ct_results ).
  ENDMETHOD.
ENDCLASS.
