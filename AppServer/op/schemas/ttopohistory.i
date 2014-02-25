/*------------------------------------------------------------------------
    File        : ttopohistory.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for op_oheader

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttop_ohistory BEFORE-TABLE ttop_ohistoryBefore
  FIELD coy    AS INTEGER FORMAT ">>>9"
  FIELD branch AS CHARACTER FORMAT "x(4)"
  FIELD rectyp AS CHARACTER FORMAT "x"
  FIELD ordnum AS INTEGER FORMAT ">>>>>>>9"
  FIELD linnum AS INTEGER FORMAT "zzz9"
  FIELD credat AS DATE FORMAT "99/99/9999"
  FIELD cretim AS INTEGER FORMAT "->,>>>,>>9"
  FIELD hsttyp AS CHARACTER FORMAT "xxx"
  FIELD doclin AS INTEGER FORMAT "zzz9"
  FIELD qty    AS DECIMAL FORMAT ">>>>>9.999-"
  FIELD sordno AS INTEGER FORMAT ">>>>>9"
  FIELD sordln AS INTEGER FORMAT ">>9"
  FIELD docref AS CHARACTER FORMAT "x(15)"
  FIELD comnum AS INTEGER FORMAT "9"
  FIELD ordlin AS INTEGER FORMAT "zzz9"
  FIELD bomlin AS INTEGER FORMAT ">>>9"
  FIELD sordbm AS INTEGER FORMAT ">>>9"
  FIELD sordcm AS INTEGER FORMAT "9"
  FIELD sorddl AS INTEGER FORMAT ">>>9"
  FIELD prduom AS CHARACTER FORMAT "x(4)"
  FIELD prdcod AS CHARACTER FORMAT "x(15)"
  FIELD invdet AS CHARACTER FORMAT "x(30)"
  FIELD invqty AS DECIMAL FORMAT ">>>>>9.99999-"
  FIELD reacod AS CHARACTER FORMAT "x(4)"
  FIELD notes-id AS CHARACTER FORMAT "x(12)"
  FIELD creusr AS CHARACTER FORMAT "X(12)"
  FIELD crezdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM" .
