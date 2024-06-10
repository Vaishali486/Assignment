
context DEALER_PORTAL_RETAILER_REGISTRATION {

    entity RETAILER_TYPE_MASTER {
        key RETAILER_TYPE_ID : Integer;
            RETAILER_TYPE    : String(100);
    }

    entity CITY_MASTER {
        key COUNTRY_CODE : String(5);
        key REGION_CODE  : String(5);
        key CITY_CODE    : String(5);
            CITY_DESC    : String(50);
    }
    entity COUNTRY_MASTER {
    key LAND1 : String(5);
        LANDX : String(50);
        CURR_CODE    : String(5);
}
entity REGION_MASTER {
    key COUNTRY_CODE : String(5);
    key REGION_CODE  : String(5);
        REGION_DESC  : String(50);
}
entity ADDRESS_TYPE_MASTER {
    key ADDRESS_TYPE : String(15);
        ADDRESS_DESC : String(30);
}

entity STATUS_MASTER{
    key CODE : Integer;
    DESC : String(100);
}

entity DIVISION_MASTER{
    key DIVISION : String(5);
    DIVISION_DESC : String(100);
}


}