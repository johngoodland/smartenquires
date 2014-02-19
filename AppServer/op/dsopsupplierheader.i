
/*------------------------------------------------------------------------
    File        : dsopoheader.i
    Purpose     : 

    Syntax      :

    Description : Temp table and dataset def for op_oheader 

    Author(s)   : johng
    Created     : Thu Feb 13 13:40:52 GMT 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{op/ttoprequest.i}
{op/ttopbrnfil.i}
{op/ttoasupplier.i}
{op/ttoacucode.i}
{op/ttoacountry.i}
 
DEFINE DATASET dsop_supplierheader FOR ttoa_supplier, ttop_brnfil, ttop_requester, ttoa_cucode, ttoa_country.    /* get the data-relation */  
/*    data-relation for ttop_oheader, ttoa_supplier relation-fields (coy, company, acccod,supplier)                 */
/*    /* data-relation for ttop_oheader, ttop_brnfil relation-fields (coy, company, "b", rectype, brncod, branch) */*/
/*    data-relation for ttop_oheader, ttop_requester relation-fields (coy, company, rqstby, reqcode, curcod, branch)*/
/*    data-relation for ttop_oheader, ttoa_cucode relation-fields (coy, company, curcod, curr).                     */
/*    /* data-relation for ttop_oheade r, ttoa_country relation-fields (ccode, xchar2, "c", rtype) */               */
 
 