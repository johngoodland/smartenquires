  
/*------------------------------------------------------------------------
    File        : ttopbrnfil.i
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
DEFINE TEMP-TABLE ttop_requester BEFORE-TABLE ttop_requesterBefore
  FIELD company AS INTEGER FORMAT ">>99"
  FIELD reqcode AS CHARACTER FORMAT "X(4)"
  FIELD branch AS CHARACTER FORMAT "X(4)"
  FIELD appath AS CHARACTER FORMAT "X(8)"
  FIELD name AS CHARACTER FORMAT "X(30)"
  FIELD email AS CHARACTER FORMAT "X(150)"
  FIELD ebisuser AS CHARACTER FORMAT "X(20)"
  FIELD del AS LOGICAL FORMAT "yes/no"
  FIELD notes-id AS CHARACTER FORMAT "x(12)"
  FIELD flog1 AS LOGICAL FORMAT "Yes/No"
  FIELD flog2 AS LOGICAL FORMAT "Yes/No"
  FIELD flog3 AS LOGICAL FORMAT "Yes/No"
  FIELD flog4 AS LOGICAL FORMAT "Yes/No"
  FIELD flog5 AS LOGICAL FORMAT "Yes/No"
  FIELD flog6 AS LOGICAL FORMAT "Yes/No"
  FIELD flog7 AS LOGICAL FORMAT "Yes/No"
  FIELD flog8 AS LOGICAL FORMAT "Yes/No"
  FIELD flog9 AS LOGICAL FORMAT "Yes/No"
  FIELD flog10 AS LOGICAL FORMAT "Yes/No"  .
