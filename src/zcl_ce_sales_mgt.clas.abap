CLASS zcl_ce_sales_mgt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CE_SALES_MGT IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    zcl_ce_sales_mgt_implement=>requested( EXPORTING io_request = io_request
                                           IMPORTING et_filters = DATA(lt_filters) ).

    zcl_ce_sales_mgt_implement=>select( EXPORTING it_filters = lt_filters
                                        IMPORTING et_results = DATA(lt_results) ).

    zcl_ce_sales_mgt_implement=>response( EXPORTING io_request  = io_request
                                                    io_response = io_response
                                           CHANGING ct_results  = lt_results ).
  ENDMETHOD.
ENDCLASS.
