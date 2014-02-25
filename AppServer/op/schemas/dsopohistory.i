
/*------------------------------------------------------------------------
    File        : dsopohistory.i
    Purpose     : 

    Syntax      :

    Description : Temp table and dataset def for oa_anlysis 

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{op/schemas/ttopohistory.i}
 
 
DEFINE DATASET dsop_ohistory SERIALIZE-NAME "dsop_ohistory" FOR ttop_ohistory .    /* get the data-relation */  
 
 
 