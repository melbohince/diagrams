#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "ADDR_ProductLookUpExport"

participant "Products"
participant "Jobits"
participant "Inventory"
participant "Addresses"
participant "Releases"

*-->Jobits: JMI_getCustWIP
Jobits->Products: $productCodesInWIP_c

Products->Inventory: FGL_getCustInventory
Inventory->Products: $productCodesOnHand_c

Products->Products: consolidate

Products-> Addresses: ADDR_BuildAddressLookup

Addresses->Releases: ADDR_getCustShipToAddresses

Releases->Addresses:$address_c

Addresses->Addresses:ADDR_ExportFGLookupTable

Addresses->Products:ADDR_zipperCPNtoAddress

Products->Addresses:util_SaveTextToDocument
