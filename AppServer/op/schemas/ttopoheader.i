
/*------------------------------------------------------------------------
    File        : ttopoheader.i
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
DEFINE TEMP-TABLE ttop_oheader BEFORE-TABLE ttop_oheaderBefore
FIELD rectyp AS CHARACTER FORMAT "x"
FIELD acccod AS CHARACTER FORMAT "x(10)"
FIELD orddat AS DATE FORMAT "99/99/9999"
FIELD numitm AS INTEGER FORMAT "zzz9"
FIELD credat AS DATE FORMAT "99/99/9999"
FIELD creusr AS CHARACTER FORMAT "x(12)"
FIELD ordsta AS CHARACTER FORMAT "x"
FIELD dpcode AS CHARACTER FORMAT "x(10)"
FIELD coy AS INTEGER FORMAT ">>>9"
FIELD branch AS CHARACTER FORMAT "x(4)"
FIELD ipcode AS CHARACTER FORMAT "x(10)"
FIELD ordnum AS INTEGER FORMAT ">>>>>>>9"
FIELD ourref AS CHARACTER FORMAT "x(20)"
FIELD invnum AS INTEGER FORMAT ">>>>>9"
FIELD cusref AS CHARACTER FORMAT "x(20)"
FIELD curcod AS CHARACTER FORMAT "x(4)"
FIELD currat AS DECIMAL FORMAT ">>>>>>>9.999999"
FIELD ordval AS DECIMAL FORMAT ">>>>>9.99"
FIELD outval AS DECIMAL FORMAT ">>>>>9.99"
FIELD basval AS DECIMAL FORMAT ">>>>>9.99"
FIELD basout AS DECIMAL FORMAT ">>>>>9.99"
FIELD printd AS LOGICAL FORMAT "yes/no"
FIELD curper AS INTEGER FORMAT "99"
FIELD years AS CHARACTER FORMAT "x(10)"
FIELD cusind AS CHARACTER FORMAT "x(4)"
FIELD repcod AS CHARACTER FORMAT "x(4)"
FIELD geophy AS CHARACTER FORMAT "x(4)"
FIELD anal1 AS CHARACTER FORMAT "x(4)"
FIELD anal2 AS CHARACTER FORMAT "x(4)"
FIELD acctyp AS CHARACTER FORMAT "x(4)"
FIELD cretim AS INTEGER FORMAT "->,>>>,>>9"
FIELD tranl1 AS CHARACTER FORMAT "x(4)"
FIELD tranl2 AS CHARACTER FORMAT "x(4)"
FIELD tranl3 AS CHARACTER FORMAT "x(4)"
FIELD tranl4 AS CHARACTER FORMAT "x(4)"
FIELD locatn AS CHARACTER FORMAT "x(04)"
FIELD telnum AS CHARACTER FORMAT "x(18)"
FIELD atekey AS INTEGER FORMAT ">>>>>>9"
FIELD revdat AS DATE FORMAT "99/99/9999"
FIELD enddat AS DATE FORMAT "99/99/9999"
FIELD pornum AS CHARACTER FORMAT "x(20)"
FIELD connam AS CHARACTER FORMAT "x(20)"
FIELD vernum AS INTEGER FORMAT ">>>>>9"
FIELD shrtnm AS CHARACTER FORMAT "x(8)"
FIELD nxtapp AS CHARACTER FORMAT "x(4)"
FIELD apprvs1 AS CHARACTER FORMAT "x(4)"
FIELD apprvs2 AS CHARACTER FORMAT "x(4)"
FIELD apprvs3 AS CHARACTER FORMAT "x(4)"
FIELD apprvd1 AS CHARACTER FORMAT "x(4)"
FIELD apprvd2 AS CHARACTER FORMAT "x(4)"
FIELD apprvd3 AS CHARACTER FORMAT "x(4)"
FIELD reqdat AS DATE FORMAT "99/99/9999"
FIELD reqtim AS INTEGER FORMAT "99999"
FIELD orddsc AS DECIMAL FORMAT ">9.99"
FIELD amdaddr AS LOGICAL FORMAT "yes/no"
FIELD delvat AS LOGICAL FORMAT "yes/no"
FIELD rqstby AS CHARACTER FORMAT "x(20)"
FIELD appath AS CHARACTER FORMAT "x(8)"
FIELD deladd1 AS CHARACTER FORMAT "X(30)"
FIELD deladd2 AS CHARACTER FORMAT "X(30)"
FIELD deladd3 AS CHARACTER FORMAT "X(30)"
FIELD deladd4 AS CHARACTER FORMAT "X(30)"
FIELD deladd5 AS CHARACTER FORMAT "X(30)"
FIELD invadd1 AS CHARACTER FORMAT "X(30)"
FIELD invadd2 AS CHARACTER FORMAT "X(30)"
FIELD invadd3 AS CHARACTER FORMAT "X(30)"
FIELD invadd4 AS CHARACTER FORMAT "X(30)"
FIELD invadd5 AS CHARACTER FORMAT "X(30)"
FIELD ordadd1 AS CHARACTER FORMAT "x(30)"
FIELD ordadd2 AS CHARACTER FORMAT "x(30)"
FIELD ordadd3 AS CHARACTER FORMAT "x(30)"
FIELD ordadd4 AS CHARACTER FORMAT "x(30)"
FIELD ordadd5 AS CHARACTER FORMAT "x(30)"
FIELD ocommt1 AS CHARACTER FORMAT "x(78)"
FIELD ocommt2 AS CHARACTER FORMAT "x(78)"
FIELD ocommt3 AS CHARACTER FORMAT "x(78)"
FIELD ocommt4 AS CHARACTER FORMAT "x(78)"
FIELD ocommt5 AS CHARACTER FORMAT "x(78)"
FIELD ocommt6 AS CHARACTER FORMAT "x(78)"
FIELD ocommt7 AS CHARACTER FORMAT "x(78)"
FIELD ocommt8 AS CHARACTER FORMAT "x(78)"
FIELD ocommt9 AS CHARACTER FORMAT "x(78)"
FIELD ocommt10 AS CHARACTER FORMAT "x(78)"
FIELD opcode AS CHARACTER FORMAT "x(10)"
FIELD notes-id AS CHARACTER FORMAT "x(12)"
FIELD ext-source AS CHARACTER FORMAT "X(8)"
FIELD mtchdate AS DATE FORMAT "99/99/9999"
FIELD xchar1 AS CHARACTER FORMAT "X(50)"
FIELD xchar2 AS CHARACTER FORMAT "X(50)"
FIELD xdec1 AS DECIMAL FORMAT ">>>>>>>>>>9.99-"
FIELD xdec2 AS DECIMAL FORMAT ">>>>>>>>>>9.99-"
FIELD ebisuniqid AS CHARACTER FORMAT "x(50)"
FIELD ordcode AS CHARACTER FORMAT "x(20)"
FIELD delcode AS CHARACTER FORMAT "x(20)"
FIELD invcode AS CHARACTER FORMAT "x(20)"
FIELD email AS CHARACTER FORMAT "x(150)"
FIELD faxnum AS CHARACTER FORMAT "x(18)"
FIELD ebisusercode AS CHARACTER FORMAT "x(20)"
FIELD ebisusername AS CHARACTER FORMAT "x(100)"
FIELD crezdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM"
FIELD reqzdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM"
FIELD cur-user AS CHARACTER FORMAT "x(4)"
FIELD updzdatetime AS DATETIME-TZ FORMAT "99/99/9999 HH:MM:SS.SSS+HH:MM"
FIELD cedtSpecialInstruc AS CHARACTER
FIELD clocationName      AS CHARACTER.
