#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "ELC Shipping Interaction"

participant ELC
participant ARKAY
participant TMC
participant DSV


ELC-->ARKAY: Forecast Release via DELFOR EDI

ARKAY-->ARKAY: Schedule production

ELC-->ARKAY: Firm Release via ORDERS EDI

ARKAY-->ARKAY: Make cartons

ELC-->TMC: Need cartons now

TMC-->ARKAY: "PO NOTIFICATION" When can you ship (PORTAL)?

ARKAY-->ELC: Earliest ship date via DESADV EDI

ELC-->TMC: DESADV recieved

TMC-->DSV: When can you pickup?

DSV-->TMC: Next Wednesday@4pm for Ocean

TMC-->ARKAY: "BOOKING CONFIRMATION NOTICE" Truck coming Wed@4pm

ARKAY-->DSV: Bills of Lading, SLI, Commercial Invoice







