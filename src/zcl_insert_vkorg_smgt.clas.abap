CLASS zcl_insert_vkorg_smgt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_VKORG_SMGT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_db TYPE STANDARD TABLE OF ztb_zkorg_smgt.

    lt_db = VALUE #( BASE lt_db
        ( salesorganization = '6710' )
        ( salesorganization = '6720' )
        ( salesorganization = '6730' )
    ).

    DELETE FROM ztb_zkorg_smgt.

    INSERT ztb_zkorg_smgt FROM TABLE @lt_db.

  ENDMETHOD.
ENDCLASS.
