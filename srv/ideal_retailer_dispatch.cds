using { DEALER_PORTAL_RETAILER_REGISTRATION as ScSales } from '../db/TRANSACTION_TABLE';
using { DEALER_PORTAL_RETAILER_REGISTRATION } from '../db/MASTER_TABLE';

service ideal_retailer_dispatch {

    entity RetailerDeliveryHeader as projection on ScSales.RETAILER_DELIVERY_HEADER;
    entity RetailerDeliveryItem as projection on ScSales.RETAILER_DELIVERY_ITEM;
    entity RetailerInvoiceHeader as projection on ScSales.RETAILER_INVOICE_HEADER;
    entity RetailerInvoiceItem as projection on ScSales.RETAILER_INVOICE_ITEM;
    entity RetailerSoHeader as projection on ScSales.RETAILER_SO_HEADER;
    entity RetailerSoItems as projection on ScSales.RETAILER_SO_ITEMS;
    entity divisionMaster as projection on DEALER_PORTAL_RETAILER_REGISTRATION.DIVISION_MASTER;
    entity statusMaster as projection on DEALER_PORTAL_RETAILER_REGISTRATION.STATUS_MASTER;

    action dispatchCreation(deliveryheader:many RetailerDeliveryHeader ,deliveryItem:many RetailerDeliveryItem ,invoiceHeader:many RetailerInvoiceHeader  ,invoiceItem : many RetailerInvoiceItem)returns String;
}

 