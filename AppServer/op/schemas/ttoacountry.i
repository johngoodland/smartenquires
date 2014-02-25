
/*------------------------------------------------------------------------
    File        : ttoacountry.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for oa_country

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttoa_country BEFORE-TABLE ttoa_countryBefore
  FIELD ccode AS CHARACTER FORMAT "x(3)"
  FIELD cdesc AS CHARACTER FORMAT "x(30)"
  FIELD del   AS LOGICAL   FORMAT "yes/no"
  FIELD eec   AS LOGICAL   FORMAT "yes/no"
  FIELD rtype AS CHARACTER FORMAT "xx".
