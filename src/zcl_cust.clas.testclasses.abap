
CLASS lcl_test_class DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      f_cut        TYPE REF TO zcl_cust,  "class under test
      cust_id_test TYPE char32.

    CLASS-METHODS: class_setup.
    METHODS: setup.

    METHODS: generate_custid FOR TESTING.
ENDCLASS.       "lcl_Test_Class


CLASS lcl_test_class IMPLEMENTATION.

  METHOD class_setup.



  ENDMETHOD.



  METHOD setup.
    DATA: cust_id_test TYPE char32.

    CREATE OBJECT f_cut.
    cust_id_test = 'Sucheta001Postcode10'.

  ENDMETHOD.


  METHOD generate_custid.

    DATA cust_fnam TYPE char10 VALUE 'Sucheta'.
    DATA cust_lnam TYPE char10 VALUE 'Kar'.
    DATA cust_pocode TYPE char10 VALUE 'Postcode'.
    DATA cust_fueltyp TYPE char2 VALUE '10'.
    DATA cust_id TYPE char32.
    DATA level TYPE aunit_level. " ABAP Unit: Severity of Check Error


    f_cut->generate_custid(
          EXPORTING
            cust_fnam = cust_fnam
            cust_lnam = cust_lnam
            cust_pocode = cust_pocode
            cust_fueltyp = cust_fueltyp
            ip_number = 111
         IMPORTING
           cust_id = cust_id
        ).
    cust_id_test = 'Sucheta111Postcode10'.
    cust_id_test = 'Test failed'.

    cl_abap_unit_assert=>assert_equals(
      act   = cust_id
      exp   = cust_id_test          "<--- please adapt expected value
     msg   = 'Testing value cust_Id failed'
     level = level
    ).
    f_cut->generate_custid(
      EXPORTING
        cust_fnam = cust_fnam
        cust_lnam = cust_lnam
        cust_pocode = cust_pocode
        cust_fueltyp = cust_fueltyp
        ip_number = 1
     IMPORTING
       cust_id = cust_id
    ).
    cust_id_test = 'Sucheta001Postcode10'.

    cl_abap_unit_assert=>assert_equals(
      act   = cust_id
      exp   = cust_id_test          "<--- please adapt expected value
     msg   = 'Testing value cust_Id failed'
     level = level ).

    CLEAR cust_fnam.
    f_cut->generate_custid(
     EXPORTING
       cust_fnam = cust_fnam
       cust_lnam = cust_lnam
       cust_pocode = cust_pocode
       cust_fueltyp = cust_fueltyp
       ip_number = 1
    IMPORTING
      cust_id = cust_id
   ).
    cust_id_test = 'Invalid input'.

    cl_abap_unit_assert=>assert_equals(
      act   = cust_id
      exp   = cust_id_test          "<--- please adapt expected value
     msg   = 'Testing value cust_Id failed'
     level = level
    ).
  ENDMETHOD.




ENDCLASS.
