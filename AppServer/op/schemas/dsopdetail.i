
/*------------------------------------------------------------------------
    File        : dsopodetail.i
    Purpose     : 

    Syntax      :

    Description : Temp table and dataset def for op_odetail 

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{op/schemas/ttopdetail.i}
  
 
DEFINE DATASET dsop_detail FOR ttop_detail .    /* get the data-relation */  
 
 
 