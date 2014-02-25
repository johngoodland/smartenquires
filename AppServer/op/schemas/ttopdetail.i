
/*------------------------------------------------------------------------
    File        : ttopdetail.i
    Purpose     : 

    Syntax      :

    Description : Temp table def for op_detail

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttop_detail BEFORE-TABLE ttop_detailBefore
  FIELD linnum AS INTEGER FORMAT "zzz9"
  FIELD prdcod AS CHARACTER FORMAT "x(15)"
  FIELD ordpri AS DECIMAL FORMAT ">>>>>9.99999-"
  FIELD orddsc AS DECIMAL FORMAT ">9.99"
  FIELD ordqty AS DECIMAL FORMAT ">>>>>9.999"
  FIELD prdnam AS CHARACTER FORMAT "x(45)"
  FIELD prduom AS CHARACTER FORMAT "x(4)"
  FIELD vatcod AS CHARACTER FORMAT "x(4)"
  FIELD credat AS DATE FORMAT "99/99/9999"
  FIELD creusr AS CHARACTER FORMAT "x(12)"
  FIELD nomcod AS CHARACTER FORMAT "x(15)"
  FIELD atekey AS INTEGER FORMAT ">>>>>>9"
  FIELD coy AS INTEGER FORMAT ">>>9"
  FIELD branch AS CHARACTER FORMAT "x(4)"
  FIELD priflg AS LOGICAL FORMAT "yes/no"
  FIELD outqty AS DECIMAL FORMAT ">>>>>9.999"
  FIELD ordsta AS CHARACTER FORMAT "x"
  FIELD prdtyp AS CHARACTER FORMAT "x(4)"
  FIELD allqty AS DECIMAL FORMAT ">>>>>9.999"
  FIELD disqty AS DECIMAL FORMAT ">>>>>9.999"
  FIELD ordnum AS INTEGER FORMAT ">>>>>>>9"
  FIELD rectyp AS CHARACTER FORMAT "x"
  FIELD ordext AS DECIMAL FORMAT ">>>>>9.99" 
  FIELD outext AS DECIMAL FORMAT ">>>>>9.99"
  FIELD cstctr AS CHARACTER FORMAT "x(15)"
  FIELD basext AS DECIMAL FORMAT ">>>>>9.99"
  FIELD basout AS DECIMAL FORMAT ">>>>>9.99"
  FIELD duedat AS DATE FORMAT "99/99/9999"
  FIELD baspri AS DECIMAL FORMAT ">>>>>9.99999-"
  FIELD supnum AS CHARACTER FORMAT "x(20)"
  FIELD insqty AS DECIMAL FORMAT ">>>>>9.999"
  FIELD prdgrp AS CHARACTER FORMAT "x(4)"
  FIELD autgrn AS LOGICAL FORMAT "yes/no"
  FIELD undqty AS DECIMAL FORMAT ">>>>>9.999-"
  FIELD newpri AS DECIMAL FORMAT ">>>>>9.99999-"
  FIELD bjline AS INTEGER FORMAT ">>>9"
  FIELD usetyp AS CHARACTER FORMAT "x"
  FIELD amntim AS INTEGER FORMAT ">>>>>9"
  FIELD qality AS CHARACTER FORMAT "x(4)"
  FIELD datcls AS DATE FORMAT "99/99/9999"
  FIELD timcls AS INTEGER FORMAT ">>>>>9"
  FIELD project AS CHARACTER FORMAT "x(15)"
  FIELD panlcode AS CHARACTER FORMAT "x(15)"
  FIELD atploc AS CHARACTER FORMAT "x(4)"
  FIELD amndat AS DATE FORMAT "99/99/9999"
  FIELD amnusr AS CHARACTER FORMAT "x(12)"
  FIELD pricod AS CHARACTER FORMAT "x(4)"
  FIELD notes-id AS CHARACTER FORMAT "x(12)"
  FIELD workstage AS CHARACTER FORMAT "X(15)"
  FIELD rqstby AS CHARACTER FORMAT "x(20)"
  FIELD ictcompany AS INTEGER FORMAT ">>99"
  FIELD acc-year AS INTEGER FORMAT "9999"
  FIELD acc-per AS INTEGER FORMAT "99"
  FIELD xchar1 AS CHARACTER FORMAT "X(50)"
  FIELD xchar2 AS CHARACTER FORMAT "X(50)"
  FIELD xdec1 AS DECIMAL FORMAT ">>>>>>>>>>9.99-"
  FIELD xdec2 AS DECIMAL FORMAT ">>>>>>>>>>9.99-"
  FIELD resource AS CHARACTER FORMAT "x(8)"
  FIELD clszdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM"
  FIELD amnzdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM".
