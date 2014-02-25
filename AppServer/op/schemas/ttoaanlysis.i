
/*------------------------------------------------------------------------
    File        : ttoaanlysis.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for oa_anlysis

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttoa_anlysis BEFORE-TABLE ttoa_anlysisBefore
FIELD company AS INTEGER FORMAT ">>99"
FIELD anltyp AS CHARACTER FORMAT "x(15)"
FIELD anlcode AS CHARACTER FORMAT "x(4)"
FIELD description AS CHARACTER FORMAT "x(20)"
FIELD del AS LOGICAL FORMAT "yes/no"
FIELD notes-id AS CHARACTER FORMAT "x(12)"
FIELD email AS CHARACTER FORMAT "X(150)"
FIELD flag1 AS CHARACTER FORMAT "X(20)"
FIELD flag2 AS CHARACTER FORMAT "X(20)"
FIELD userlist AS CHARACTER FORMAT "x(60)".
