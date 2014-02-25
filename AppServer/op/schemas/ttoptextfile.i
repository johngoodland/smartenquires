
/*------------------------------------------------------------------------
    File        : ttoasupplier.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for oa_supplier

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttop_textfile BEFORE-TABLE ttop_textfileBefore
  FIELD coy 		  AS INTEGER   FORMAT ">>>9"
  FIELD atekey    AS INTEGER   FORMAT "99999999" 
  FIELD orphan    AS LOGICAL   FORMAT "yes/no"
  FIELD txtstr1   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr2   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr3   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr4   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr5   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr6   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr7   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr8   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr9   AS CHARACTER FORMAT "x(45)"
  FIELD txtstr10  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr11  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr12  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr13  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr14  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr15  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr16  AS CHARACTER FORMAT "x(45)"
  FIELD txtstr17  AS CHARACTER FORMAT "x(45)"
  FIELD seqno     AS INTEGER   FORMAT "9999".
