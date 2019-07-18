class ZCL_CUST definition
  public
  final
  create public .

public section.

  methods GENERATE_CUSTID
    importing
      !CUST_FNAM type CHAR10
      !CUST_LNAM type CHAR10
      !CUST_POCODE type CHAR10
      !CUST_FUELTYP type CHAR2
      !IP_NUMBER type INT4
    exporting
      !CUST_ID type CHAR32 .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CUST IMPLEMENTATION.


  METHOD generate_custid.
******    Customer ID should be firstname+3digit+postcode+fuel type
*    DATA: l_no TYPE int4.
*    DATA: lr_ran TYPE REF TO cl_abap_random_int,
*          l_int  TYPE int4.
*
*    lr_ran = cl_abap_random_int=>create( min = 1 max = 999 ).
*    l_int = lr_ran->get_next( ).

data: l_fnam type char10.

CLear l_fnam.

    cust_id = | { cust_lnam } | && | { ip_number } | && | { cust_pocode } | && | { cust_fueltyp } |.
    CONDENSE cust_id NO-GAPS.

cust_id = 'Test failed1'.
  ENDMETHOD.
ENDCLASS.
