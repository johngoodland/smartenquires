  
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
DEFINE TEMP-TABLE ttop_brnfil BEFORE-TABLE ttop_brnfilBefore
  FIELD brnnam AS CHARACTER FORMAT "x(33)"
  FIELD salmth AS INTEGER FORMAT "99"
  FIELD formth AS INTEGER FORMAT "99"
  FIELD sinbrn AS CHARACTER FORMAT "x(4)"
  FIELD maxlin1 AS INTEGER FORMAT ">>>>>9"
  FIELD maxlin2 AS INTEGER FORMAT ">>>>>9"
  FIELD prmtr1-1 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-2 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-3 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-4 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-5 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-6 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-7 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-8 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-9 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-10 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-11 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-12 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-13 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-14 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-15 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-16 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-17 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-18 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-19 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr1-20 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-1 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-2 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-3 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-4 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-5 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-6 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-7 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-8 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-9 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-10 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-11 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-12 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-13 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-14 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-15 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-16 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-17 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-18 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-19 AS CHARACTER FORMAT "x(4)"
  FIELD prmtr2-20 AS CHARACTER FORMAT "x(4)"
  FIELD stkact1 AS CHARACTER FORMAT "x"
  FIELD stkact2 AS CHARACTER FORMAT "x"
  FIELD stkact3 AS CHARACTER FORMAT "x"
  FIELD stkact4 AS CHARACTER FORMAT "x"
  FIELD stkact5 AS CHARACTER FORMAT "x"
  FIELD stkact6 AS CHARACTER FORMAT "x"
  FIELD stkact7 AS CHARACTER FORMAT "x"
  FIELD stkact8 AS CHARACTER FORMAT "x"
  FIELD stkact9 AS CHARACTER FORMAT "x"
  FIELD stkact10 AS CHARACTER FORMAT "x"
  FIELD stkact11 AS CHARACTER FORMAT "x"
  FIELD stkact12 AS CHARACTER FORMAT "x"
  FIELD stkact13 AS CHARACTER FORMAT "x"
  FIELD stkact14 AS CHARACTER FORMAT "x"
  FIELD stkact15 AS CHARACTER FORMAT "x"
  FIELD stkact16 AS CHARACTER FORMAT "x"
  FIELD stkact17 AS CHARACTER FORMAT "x"
  FIELD stkact18 AS CHARACTER FORMAT "x"
  FIELD stkact19 AS CHARACTER FORMAT "x"
  FIELD stkact20 AS CHARACTER FORMAT "x"
  FIELD stklab1 AS CHARACTER FORMAT "x(12)"
  FIELD stklab2 AS CHARACTER FORMAT "x(12)"
  FIELD stklab3 AS CHARACTER FORMAT "x(12)"
  FIELD stklab4 AS CHARACTER FORMAT "x(12)"
  FIELD stklab5 AS CHARACTER FORMAT "x(12)"
  FIELD stklab6 AS CHARACTER FORMAT "x(12)"
  FIELD stklab7 AS CHARACTER FORMAT "x(12)"
  FIELD stklab8 AS CHARACTER FORMAT "x(12)"
  FIELD stklab9 AS CHARACTER FORMAT "x(12)"
  FIELD stklab10 AS CHARACTER FORMAT "x(12)"
  FIELD stklab11 AS CHARACTER FORMAT "x(12)"
  FIELD stklab12 AS CHARACTER FORMAT "x(12)"
  FIELD stklab13 AS CHARACTER FORMAT "x(12)"
  FIELD stklab14 AS CHARACTER FORMAT "x(12)"
  FIELD stklab15 AS CHARACTER FORMAT "x(12)"
  FIELD stklab16 AS CHARACTER FORMAT "x(12)"
  FIELD stklab17 AS CHARACTER FORMAT "x(12)"
  FIELD stklab18 AS CHARACTER FORMAT "x(12)"
  FIELD stklab19 AS CHARACTER FORMAT "x(12)"
  FIELD stklab20 AS CHARACTER FORMAT "x(12)"
  FIELD rectyp AS CHARACTER FORMAT "x"
  FIELD brncod AS CHARACTER FORMAT "x(4)"
  FIELD stdvat AS CHARACTER FORMAT "X(4)"
  FIELD prdpfx AS CHARACTER FORMAT "x(4)"
  FIELD locatn AS CHARACTER FORMAT "x(04)"
  FIELD errcst AS CHARACTER FORMAT "x(15)"
  FIELD errexp AS CHARACTER FORMAT "x(15)"
  FIELD coy AS INTEGER FORMAT ">>>9"
  FIELD xmtvat AS CHARACTER FORMAT "X(4)"
  FIELD brnlog1 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog2 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog3 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog4 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog5 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog6 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog7 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog8 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog9 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog10 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog11 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog12 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog13 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog14 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog15 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog16 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog17 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog18 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog19 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog20 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog21 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog22 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog23 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog24 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog25 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog26 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog27 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog28 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog29 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog30 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog31 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog32 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog33 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog34 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog35 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog36 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog37 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog38 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog39 AS LOGICAL FORMAT "yes/no"
  FIELD brnlog40 AS LOGICAL FORMAT "yes/no"
  FIELD nomnam1 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam2 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam3 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam4 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam5 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam6 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam7 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam8 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam9 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam10 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam11 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam12 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam13 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam14 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam15 AS CHARACTER FORMAT "x(40)"
  FIELD nomnam16 AS CHARACTER FORMAT "x(40)"
  FIELD corcur AS CHARACTER FORMAT "x(4)"
  FIELD accsub AS INTEGER FORMAT "99"
  FIELD prcnam AS CHARACTER FORMAT "x(50)"
  FIELD depgrp AS CHARACTER FORMAT "x"
  FIELD minpro AS DECIMAL FORMAT ">9.99%"
  FIELD varper AS DECIMAL FORMAT "zz9.99"
  FIELD salinc AS DECIMAL FORMAT "->>9.999"
  FIELD varnce AS DECIMAL FORMAT ">>9.999"
  FIELD altdep AS CHARACTER FORMAT "x(4)"
  FIELD brntyp AS CHARACTER FORMAT "x(4)"
  FIELD usage  AS DECIMAL FORMAT ">>9.99"
  FIELD modlog AS CHARACTER FORMAT "x(8)"
  FIELD parlog1 AS LOGICAL FORMAT "yes/no"
  FIELD parlog2 AS LOGICAL FORMAT "yes/no"
  FIELD parlog3 AS LOGICAL FORMAT "yes/no"
  FIELD parlog4 AS LOGICAL FORMAT "yes/no"
  FIELD parlog5 AS LOGICAL FORMAT "yes/no"
  FIELD parlog6 AS LOGICAL FORMAT "yes/no"
  FIELD parlog7 AS LOGICAL FORMAT "yes/no"
  FIELD parlog8 AS LOGICAL FORMAT "yes/no"
  FIELD parlog9 AS LOGICAL FORMAT "yes/no"
  FIELD parlog10 AS LOGICAL FORMAT "yes/no"
  FIELD parlog11 AS LOGICAL FORMAT "yes/no"
  FIELD parlog12 AS LOGICAL FORMAT "yes/no"
  FIELD parlog13 AS LOGICAL FORMAT "yes/no"
  FIELD parlog14 AS LOGICAL FORMAT "yes/no"
  FIELD parlog15 AS LOGICAL FORMAT "yes/no"
  FIELD parlog16 AS LOGICAL FORMAT "yes/no"
  FIELD parlog17 AS LOGICAL FORMAT "yes/no"
  FIELD parlog18 AS LOGICAL FORMAT "yes/no"
  FIELD parlog19 AS LOGICAL FORMAT "yes/no"
  FIELD parlog20 AS LOGICAL FORMAT "yes/no"
  FIELD parlog21 AS LOGICAL FORMAT "yes/no"
  FIELD parlog22 AS LOGICAL FORMAT "yes/no"
  FIELD parlog23 AS LOGICAL FORMAT "yes/no"
  FIELD parlog24 AS LOGICAL FORMAT "yes/no"
  FIELD parlog25 AS LOGICAL FORMAT "yes/no"
  FIELD parlog26 AS LOGICAL FORMAT "yes/no"
  FIELD parlog27 AS LOGICAL FORMAT "yes/no"
  FIELD parlog28 AS LOGICAL FORMAT "yes/no"
  FIELD parlog29 AS LOGICAL FORMAT "yes/no"
  FIELD parlog30 AS LOGICAL FORMAT "yes/no"
  FIELD parlog31 AS LOGICAL FORMAT "yes/no"
  FIELD parlog32 AS LOGICAL FORMAT "yes/no"
  FIELD parlog33 AS LOGICAL FORMAT "yes/no"
  FIELD parlog34 AS LOGICAL FORMAT "yes/no"
  FIELD parlog35 AS LOGICAL FORMAT "yes/no"
  FIELD parlog36 AS LOGICAL FORMAT "yes/no"
  FIELD parlog37 AS LOGICAL FORMAT "yes/no"
  FIELD parlog38 AS LOGICAL FORMAT "yes/no"
  FIELD parlog39 AS LOGICAL FORMAT "yes/no"
  FIELD parlog40 AS LOGICAL FORMAT "yes/no"
  FIELD notes-id AS CHARACTER FORMAT "x(12)"
  FIELD invdoc AS CHARACTER FORMAT "x(4)"
  FIELD crddoc AS CHARACTER FORMAT "x(4)"
  FIELD project AS CHARACTER FORMAT "x(15)"
  FIELD workstage AS CHARACTER FORMAT "X(15)"
  FIELD panlcode AS CHARACTER FORMAT "x(15)"
  FIELD costcentre AS CHARACTER FORMAT "x(15)"
  FIELD expensecode AS CHARACTER FORMAT "x(15)"
  FIELD acc-costcentre AS CHARACTER FORMAT "x(15)"
  FIELD acc-expensecode AS CHARACTER FORMAT "x(15)"
  FIELD resource AS CHARACTER FORMAT "x(8)".
