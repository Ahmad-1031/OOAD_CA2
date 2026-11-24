# 06 - Operation Contracts
## Purpose
This document defines the operation contracts for UC6 Record Change based on SSD-01, the revised analysis baseline and the domain model.
### Source Artefacts
- [Revised Analysis Baseline](03-Revised_analysis_baseline.md)
- [System Sequence Diagrams](05-System_Sequence_Diagrams.md)
- [Domain Model](../../uc6-domain-model.puml)
- [Gherkin Scenarios](../../features/record-change.feature)
### Operation Catalogue
| ID | System Operation | Type |
|---|---|---|
| OC-01 | findOrderItem() | Query |
| OC-02 | recordChange() | State-changing |
| OC-03 | recordCustomerAgreement() | State-changing |
| OC-04 | recordCustomerRejection() | State-changing |

### OC-01: Find Order Item
**Operation:** findOrderItem(orderNumber, itemNumber)

**Cross-references:** UC6, SSD-01, FR4

**Preconditions:**
- An Order with the specified orderNumber exists.
- An OrderItem with the specified itemNumber is associated with that Order.

**Postconditions:**
- No domain objects were created or deleted.
- No attributes were modified.
- No associations were formed or removed.
- The latest approved design version, item status, price and expected completion date were returned.

### OC-02: Record Change
**Operation:** recordChange(orderNumber, itemNumber, description, dimensions, finish, drawings, priceChange, newCompletionDate)

**Cross-references:** UC6, SSD-01, FR4, FR7, NFR4, BR3, BR6, GH3.

**Preconditions:**
- An Order with the specified orderNumber exists.
- An OrderItem with the specified itemNumber is associated with that Order.
- A StaffMember acting as Designer is identified.

**Postconditions:**
- A new Change instance was created.
- A new DesignVersion instance was created.
- A unique changeNumber was assigned to the Change.
- A new versionNumber and creationDate were assigned to the DesignVersion.
- The dimensions, finish and drawings of the new DesignVersion were recorded.
- The description, priceChange, newCompletionDate and changeDate of the Change were recorded.
- The Change status was set to Pending.
- The Change was associated with the original approved DesignVersion.
- The Change was associated with the newly created DesignVersion.
- The new DesignVersion was associated with the OrderItem.
- The Change was associated with the StaffMember who recorded it.
- The OrderItem status was set to Paused.
- The previous approved DesignVersion remained unchanged.
- The original DesignVersion remained the latest approved version of the OrderItem.
- The current price and expected completion date of the OrderItem remained unchanged.
- The changeNumber, newVersionNumber and itemPaused were returned.

**Refusal outcome:**

If the OrderItem has no approved DesignVersion:
- NO_APPROVED_VERSION was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

### OC-03: Record Customer Agreement

**Operation:** recordCustomerAgreement(changeNumber)

**Cross-references:** UC6, SSD-01, FR4, FR5, FR7, NFR4, BR3, GH3.

**Preconditions:**
- A StaffMember acting as Designer is identified.
- The customer has agreed to the proposed change outside the system.

**Postconditions:**
- The Change status was set to Accepted.
- The responseDate of the Change was recorded.
- A new Approval instance was created.
- The approvalDate was recorded.
- The Approval was associated with the proposed DesignVersion.
- The Approval was associated with the Customer who agreed to the change.
- The Approval was associated with the StaffMember who recorded the agreement.
- The proposed DesignVersion became the latest approved version of the OrderItem.
- The OrderItem price was updated according to the recorded priceChange.
- The OrderItem expectedCompletionDate was set to the recorded newCompletionDate.
- The pause associated with the accepted Change was lifted.
- All previous DesignVersion instances and their approval records were preserved.
- The latestApprovedVersion, price, expectedCompletionDate and itemPaused were returned.

**Refusal outcome:**

If the specified Change does not exist or has already received a customer response:
- INVALID_CHANGE was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

**Design assumption:**

The creation of an Approval instance and the approval of the proposed DesignVersion are provisional decisions, subject to team agreement (OQ-02).

### OC-04: Record Customer Rejection

**Operation:** recordCustomerRejection(changeNumber)

**Cross-references:** UC6, SSD-01, FR4, FR7, NFR4, BR3, GH4. 

**Preconditions:**
- A StaffMember acting as Designer is identified.
- The customer has rejected the proposed change outside the system.

**Postconditions:**
- The Change status was set to Rejected.
- The responseDate of the Change was recorded.
- The previous approved DesignVersion remained the latest approved version of the OrderItem.
- The proposed DesignVersion was retained in the design history without approval.
- The OrderItem price remained unchanged.
- The OrderItem expectedCompletionDate remained unchanged.
- The pause associated with the rejected Change was lifted.
- All existing associations between the Change and both DesignVersion instances were preserved.
- No new Approval instance was created.
- No domain objects were created or deleted.
- The latestApprovedVersion, price, expectedCompletionDate and itemPaused were returned.

**Refusal outcome:**

If the specified Change does not exist or has already received a customer response:
- INVALID_CHANGE was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

### Open Design Questions
| ID | Question | Related contracts | Status |
|---|---|---|---|
| OQ-01 | Should changeNumber be globally unique and added to the Domain Model? | OC-02, OC-03, OC-04 | Open |
| OQ-02 | How is the identity of the StaffMember who recorded the customer response stored for accountability? | OC-03, OC-04 | Open |
| OQ-03 | How is the previous OrderItem status restored after customer agreement or rejection? | OC-03, OC-04 | Open |
| OQ-04 | Can multiple changes await a customer response for the same OrderItem? | OC-02, OC-03, OC-04 | Open |
| OQ-05 | How is the StaffMember recording the customer response identified for accountability? | OC-03, OC-04 | Open |
| OQ-06 | Should changes that do not affect price or completion date also pause work? | OC-02, BR3 | Open |
| OQ-07 | What response should be returned when the specified Order or OrderItem cannot be found? | OC-01 | Open |
