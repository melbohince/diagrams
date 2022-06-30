#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "Shipping Preperation"

participant "Customer\nService\nRep" as REP
participant "Release_Schedule" as REL
participant "Shipping\nMgr" as MGR
participant "Material\nHandler" as HDLR

note over REP 
"""
Coordinate customer
want dates & qty with 
production schedule
"""
end note

*-->REP: (0) Schedule Shipment
activate MGR
note over MGR 
"""
Coordinate requested shipments
 based on schd date, inventory, 
 docking appointmnents
"""
end note

alt [user entered]
note left of REP
"""
see [Finished_Goods]
"AskMe"->[releases].Add_btn
to get to 
[Customer_ReleaseSchd]"Input"
"""
end note
REP->REL: (1) Specify Destination, Date, Qty
else [EDI Message]

note left of REP
"""
see (m)EDI_Map_EDIFACT_Order
"""
end note
*-->REL: (2) EDI Specified Dest, Date, Qty
end #alt	


note over HDLR 
"""
Does put-aways & picks
using fork lift trucks. 
Uses scanners logged into 
WMS system.
(4D Web based by
FootPrints Inc)
"""
end note


loop
MGR->REL: (3) Select Releases
REL->REL: (4) Print Picklist
end #loop


activate HDLR

MGR->HDLR: (5) Picklist

loop
HDLR->HDLR: (6) Stage Inventory
end #loop

HDLR->MGR: (7) Ready

MGR->MGR: (8) Contact Carriers and\nReceiving Depts

MGR->MGR: (9) Configure Bill Of Lading

MGR->MGR: (10) Print BOL
note left of MGR
"""
See BOL\nSequence\nDiagram
"""
end note

MGR->HDLR: (11) Load Truck

deactivate HDLR

deactivate MGR








