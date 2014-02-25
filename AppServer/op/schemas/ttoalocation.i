
/*------------------------------------------------------------------------
    File        : ttoalocation.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for oa_location

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttoa_location BEFORE-TABLE ttoa_locationBefore
  FIELD company   AS INTEGER FORMAT ">>99" 
  FIELD brncod    AS CHARACTER FORMAT "x(4)"
  FIELD location  AS CHARACTER FORMAT "X(4)"
  FIELD Name      AS CHARACTER FORMAT "X(30)"
  FIELD prgrn     AS LOGICAL FORMAT "Yes/No"
  FIELD atekey    AS INTEGER FORMAT "99999999".
