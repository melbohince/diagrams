#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "BOL Diagram {system view}"

participant BOL as BOL
participant Release as REL
participant Inventory as LOC
participant Invoice as INV
participant Transaction as X
participant OrderLines as ORD


*-->BOL: New

activate BOL

loop
BOL->REL: Enter Release Number

REL->BOL: Destination, Bill-to, Qty

note right of BOL
"""
The first release sets
the destination and bill-to,
all releases after that must
match those.
"""
end note
REL->LOC: Locate Inventory

LOC->BOL: Display Locations

note left of LOC
"""
FiFo Sort. Option
to only show staging
locations based on
user's membership.
"""
end note

BOL->BOL: Enter \n# of Cases &\n Case Counts

BOL->BOL: "Add to BOL#" btn

BOL->REL: Release.Pending()

BOL->LOC: Inventory.Pending()

end #loop

BOL->BOL: "Ship" tab

BOL->BOL: "Print" btn
note right of BOL
"""
Internations require
Commercial Invoice
printed also
"""
end note

BOL->REL: Release.Shipped()

BOL->ORD: OrderLine.Shipped()

BOL->LOC: Inventory.Shipped()

BOL->INV: Invoice.New()

BOL->X: Transaction.New()

BOL->BOL: Mark as Shipped


