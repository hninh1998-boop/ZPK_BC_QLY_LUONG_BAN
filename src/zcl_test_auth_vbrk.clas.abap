CLASS zcl_test_auth_vbrk DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_AUTH_VBRK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_vkorg TYPE TABLE OF vkorg.
    APPEND '6710' TO lt_vkorg.
    APPEND '1610' TO lt_vkorg.
    APPEND '6720' TO lt_vkorg.
    APPEND '6730' TO lt_vkorg.
    APPEND 'ZZZZ' TO lt_vkorg.

    out->write( |--- Current user: { sy-uname } ---| ).
    out->write( |--- Test V_VBRK_VKO (Billing Doc) ---| ).
    LOOP AT lt_vkorg INTO DATA(lv_vkorg).
      AUTHORITY-CHECK OBJECT 'V_VBRK_VKO'
        ID 'VKORG' FIELD lv_vkorg
        ID 'VTWEG' DUMMY
        ID 'SPART' DUMMY
        ID 'ACTVT' FIELD '03'.
      out->write( |  VKORG={ lv_vkorg } → sy-subrc = { sy-subrc }| ).
    ENDLOOP.

    out->write( |--- Test V_VBAK_VKO (Sales Doc) ---| ).
    LOOP AT lt_vkorg INTO DATA(lv_vkorg2).
      AUTHORITY-CHECK OBJECT 'V_VBAK_VKO'
        ID 'VKORG' FIELD lv_vkorg2
        ID 'VTWEG' DUMMY
        ID 'SPART' DUMMY
        ID 'ACTVT' FIELD '03'.
      out->write( |  VKORG={ lv_vkorg2 } → sy-subrc = { sy-subrc }| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
