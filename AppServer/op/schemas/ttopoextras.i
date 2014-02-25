
/*------------------------------------------------------------------------
    File        : ttopoextras.i
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
DEFINE TEMP-TABLE ttop_oextras BEFORE-TABLE ttop_oextrasBefore
  FIELD coy AS INTEGER FORMAT ">>>9"
  FIELD branch AS CHARACTER FORMAT "x(4)"
  FIELD prdcod AS CHARACTER FORMAT "x(15)"
  FIELD prdnam AS CHARACTER FORMAT "x(45)"
  FIELD vatcod AS CHARACTER FORMAT "x(4)"
  FIELD credat AS DATE FORMAT "99/99/9999"
  FIELD creusr AS CHARACTER FORMAT "x(12)"
  FIELD linnum AS INTEGER FORMAT "zz9"
  FIELD ordnum AS INTEGER FORMAT ">>>>>>>9"
  FIELD rectyp AS CHARACTER FORMAT "x"
  FIELD invflg AS LOGICAL FORMAT "yes/no"
  FIELD ordext AS DECIMAL FORMAT ">>>>>9.99-"
  FIELD cstctr AS CHARACTER FORMAT "x(15)"
  FIELD nomcod AS CHARACTER FORMAT "x(20)"
  FIELD basext AS DECIMAL FORMAT ">>>>>9.99-"  
  FIELD project AS CHARACTER FORMAT "x(15)"
  FIELD panlcode AS CHARACTER FORMAT "x(15)"
  FIELD notes-id AS CHARACTER FORMAT "x(12)"
  FIELD workstage AS CHARACTER FORMAT "X(15)"
  FIELD ictcompany AS INTEGER FORMAT ">>99"
  FIELD fromMatching AS LOGICAL FORMAT "yes/no"
  FIELD resource AS CHARACTER FORMAT "x(8)".
