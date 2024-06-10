const cds = require("@sap/cds")
// const lv_handler = require("./LIB/HANDLER");
// const lib = require('./LIB/CONTRACT_LIB')
const dbClass = require("sap-hdbext-promisfied");
const hdbext = require("@sap/hdbext");
module.exports = cds.service.impl(function(){

    this.on('dispatchCreation', async (req) => {
        try {
            var client = await dbClass.createConnectionFromEnv();
            var dbconn = new dbClass(client);

            var {
                deliveryheader,
                deliveryItem,
                invoiceHeader,
                invoiceItem
            } = req.data

            var deliveryItemarray = deliveryItem;
            var InvoiceItemarray = invoiceItem;
            
            for(var i=0; i<deliveryItemarray.length;i++){
                deliveryItemarray[i].DELIVERY_ITEM_NO = i+1;
                InvoiceItemarray[i].INVOICE_ITEM_NO = i+1;
            }

            var distributorId = deliveryheader[0].DISTRIBUTOR_ID;
            var retailerId = deliveryheader[0].RETAILER_ID;
            var soNo = deliveryheader[0].SO_NO;
            
            const sp = await dbconn.loadProcedurePromisified(hdbext, null, 'DISPATCH_ORDER');
            const output = await dbconn.callProcedurePromisified(sp, [distributorId,retailerId,soNo, deliveryheader,deliveryItem,invoiceHeader,invoiceItem]);
            if (output.outputScalar.OUT_SUCCESS !== null) {
                sResponse = output.outputScalar.OUT_SUCCESS;
                return sResponse;
            }
            
        } catch (error) {
            var sType = error.code ? "Procedure" : "Node Js";
            var iErrorCode = error.code ?? 500;

            req.error({ code: iErrorCode, message: error.message ? error.message : error });
        }
    });
    
    
})
