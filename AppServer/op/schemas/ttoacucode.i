
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
DEFINE TEMP-TABLE ttoa_cucode BEFORE-TABLE ttoa_cucodeBefore
  FIELD company        AS INTEGER   FORMAT ">>99"
  FIELD currency       AS CHARACTER FORMAT "x(4)"
  FIELD description    AS CHARACTER FORMAT "x(20)"
  FIELD rate           AS DECIMAL   FORMAT ">>>>>>>9.999999"
  FIELD costcentre     AS CHARACTER FORMAT "x(15)"
  FIELD expensecode    AS CHARACTER FORMAT "x(15)"
  FIELD del            AS LOGICAL   FORMAT "yes/no"
  FIELD decpl          AS INTEGER   FORMAT "9"
  FIELD notes-id       AS CHARACTER FORMAT "x(12)"
  FIELD unreal-cost    AS CHARACTER FORMAT "x(15)"
  FIELD unreal-expense AS CHARACTER FORMAT "x(15)".
