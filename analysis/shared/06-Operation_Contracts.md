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
- No domain-specific preconditions.

**Postconditions:**
- No domain objects were created or deleted.
- No attributes were modified.
- No associations were formed or removed.
- The latest approved design version, item status, price and expected completion date were returned.

**Refusal outcomes:**

If no Order exists with the specified orderNumber:
- ORDER_NOT_FOUND was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

if the Order exists but does not contain the specified OrderItem:
- ORDER_ITEM_NOT_FOUND was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

### OC-02: Record Change
**Operation:** recordChange(orderNumber, itemNumber, description, dimensions, finish, drawings, priceChange, newCompletionDate)

**Cross-references:** UC6, SSD-01, FR4, FR7, NFR4, BR3, BR6, BR7, GH3, GH7, GH8, GH9, GH10, GH11.

**Preconditions:**
- A StaffMember acting as Designer is identified.

**Postconditions:**
- A new Change instance was created.
- A new DesignVersion instance was created.
- A globally unique changeNumber was assigned to the Change.
- A new versionNumber and createdDate were assigned to the DesignVersion.
- The dimensions, finish and drawings of the new DesignVersion were recorded.
- The description, priceChange, newCompletionDate and changeDate of the Change were recorded.
- The Change status was set to Pending.
- The Change was associated with the original approved DesignVersion.
- The Change was associated with the newly created DesignVersion.
- The new DesignVersion was associated with the OrderItem.
- The change was associated with the StaffMember who recorded it through the recordedBy association.
- The responseRecordedBy association remained unset.
- The OrderItem isPaused attribute was set to true if the change affected the price or expected completion date.
- Otherwise, the existing pause state of the OrderItem remained unchanged.
- The existing production status of the OrderItem remained unchanged.
- The previous approved DesignVersion remained unchanged.
- The original DesignVersion remained the latest approved version of the OrderItem.
- The current price and expected completion date of the OrderItem remained unchanged.
- The changeNumber, newVersionNumber and itemPaused were returned.

**Refusal outcome:**

If no Order exists with the specified orderNumber:
- ORDER_NOT_FOUND was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

if the Order exists but does not contain the specified OrderItem:
- ORDER_ITEM_NOT_FOUND was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

If the OrderItem has no fully approved DesignVersion:
- NO_APPROVED_VERSION was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

If a pending Change already exists for the OrderItem:
- PENDING_CHANGE_EXISTS was returned
- No objects were created or deleted
- No attributes or associations were modified

### OC-03: Record Customer Agreement

**Operation:** recordCustomerAgreement(changeNumber)

**Cross-references:** UC6, SSD-01, FR4, FR5, FR7, NFR4, BR3, GH6, GH12.

**Preconditions:**
- A StaffMember acting as Designer is identified.
- The customer has agreed to the complete proposed design outside the system.

**Postconditions:**
- The Change status was set to Accepted.
- The responseDate of the Change was recorded.
- The Change was associated with the StaffMember who recorded the customer response through the responseRecordedBy association.
- The original recordedBy association of the Change remained unchanged.
- A new Approval instance was created.
- The Approval scope was set to Full.
- The approvedParts attribute was not applicable.
- The approvalDate was recorded.
- The Approval was associated with the proposed DesignVersion.
- The Approval was associated with the Customer who agreed to the change.
- The Approval was associated with the StaffMember who recorded the agreement.
- The proposed DesignVersion became the latest approved version of the OrderItem.
- The OrderItem price was updated according to the recorded priceChange.
- The OrderItem expectedCompletionDate was set to the recorded newCompletionDate.
- If the Change had caused the OrderItem to be paused, the isPaused attribute was set to false, provided that no other blocking conditions remained.
- Otherwise, the existing pause state of the OrderItem remained unchanged.
- The existing production status of the OrderItem remained unchanged.
- All previous DesignVersion instances and their approval records were preserved.
- The latestApprovedVersion, price, expectedCompletionDate and itemPaused were returned.

**Refusal outcome:**

If the specified Change does not exist or has already received a customer response:
- INVALID_CHANGE was returned.
- No objects were created or deleted.
- No attributes or associations were modified.

**Design decision:**

Customer agreement recorded through UC6 constitutes full approval of the proposed DesignVersion under the agreed conditions defined in OQ-02.

### OC-04: Record Customer Rejection

**Operation:** recordCustomerRejection(changeNumber)

**Cross-references:** UC6, SSD-01, FR4, FR7, NFR4, BR3, GH4. 

**Preconditions:**
- A StaffMember acting as Designer is identified.
- The customer has rejected the proposed change outside the system.

**Postconditions:**
- The Change status was set to Rejected.
- The responseDate of the Change was recorded.
- The Change was associated with the StaffMember who recorded the customer response through the responseRecordedBy association.
- The original recordedBy association of the Change remained unchanged.
- The previous approved DesignVersion remained the latest approved version of the OrderItem.
- The proposed DesignVersion was retained in the design history without approval.
- The OrderItem price remained unchanged.
- The OrderItem expectedCompletionDate remained unchanged.
- If the Change had caused the OrderItem to be paused, the isPaused attribute was set to false, provided that no other blocking conditions remained.
- Otherwise, the existing pause state of the OrderItem remained unchanged.
- The existing production status of the OrderItem remained unchanged.
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
| ID | Question | Related contracts | Agreed Decision | Affected Artefacts | Status |
|---|---|---|---|---|---|
| OQ-01 | Should changeNumber be globally unique and added to the Domain Model? | OC-02, OC-03, OC-04 | Introduce a globally unique changeNumber | Domain Model, Operation Contracts | Agreed |
| OQ-02 | Does customer agreement constitute full or partial approval of the proposed DesignVersion? | OC-02, OC-03 | Full approval, provided the original version was fully approved and the customer agreed to the complete revised design. | Baseline, SSD, Operation Contracts, Gherkin | Agreed |
| OQ-03 | How is the previous OrderItem status restored after customer agreement or rejection? | OC-02, OC-03, OC-04 | Introduce isPaused separately from production status. | Domain Model, Operation Contracts, Gherkin | Agreed |
| OQ-04 | Can multiple changes await a customer response for the same OrderItem? | OC-02, OC-03, OC-04 | Allow only one pending Change per OrderItem. | Baseline, SSD, Operation Contracts, Gherkin | Agreed |
| OQ-05 | How is the StaffMember recording the customer response identified for accountability? | OC-02, OC-03, OC-04 | Introduce separate recordedBy and responseRecordedBy associations. | Domain model, Operation Contracts | Agreed |
| OQ-06 | Should changes that do not affect price or completion date also pause work? | OC-02, OC-03, OC-04 | Only changes affecting price or expected completion date trigger a pause. | Baseline (BR3), Operation Contracts, Gherkin | Agreed |
| OQ-07 | What response should be returned when the specified Order or OrderItem cannot be found? | OC-01, OC-02 | Return ORDER_NOT_FOUND or ORDER_ITEM_NOT_FOUND | SSD, Operation Contracts, Gherkin | Agreed |

---
---
### Proposed Decision for OQ1:

**Proposed Decision:** Each Change will have a globally unique changeNumber. The changeNumber attribute will be added to the Change class in the  Domain Model.

**Rationale:** A globally unique identifier allows each Change to be identified unambiguously without requiring additional Order or OrderItem identifiers. This maintains consistency with the existing SSD and Operation Contracts.

**Affected Artefacts:** Domain Model, OC-02, OC-03, OC-04

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan, Ahmad

### OQ-02: Approval Scope

**Proposed Decision:** Customer agreement recorded through UC6 will constitute full approval of the proposed DesignVersion, provided that the original DesignVersion was fully approved and the customer has agreed to the complete revised design.

A new Approval instance will be created with its scope set to Full. The approvedParts attribute will be not applicable for full approval. The proposed DesignVersion will become the latest approved version of the OrderItem.

Partial approval will remain supported by the wider system but will not be handled by this operation.

**Rationale:** This approach simplifies the change approval process, preserves the design history and maintains consistency with the current SSD and Operation Contracts. It also avoids ambiguity about which design version is approved following customer agreement.

**Affected Artefacts:** Revised Analysis Baseline, Domain Model, SSD-01, OC-02, OC-03 and Gherkin Scenarios.

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan, Ahmad

### OQ-03: Restore OrderItem Status

**Proposed Decision:** The production status and pause state of an OrderItem will be represented separately.

A Boolean attribute named isPaused will be added to the OrderItem class. When a change requiring a pause is recorded, isPaused will be set to true while the existing production status remains unchanged.

After customer agreement or rejection, isPaused will be set to false, provided that no other blocking conditions remain.

**Rationale:** Separating the production status from the pause state preserves the current production stage without requiring an additional previousStatus attribute or status restoration logic. This reduces complexity and maintains consistency with the itemPaused response defined in SSD-01.

**Affected Artefacts:** Domain Model, OC-02, OC-03, OC-04 and subsequent CRC Cards.

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan, Ahmad

### OQ-04 Multiple Pending Changes

**Proposed Decision:** Only one Change with Pending status will be permitted per OrderItem at any given time.

If a pending Change already exists for the OrderItem, any attempt to record another change will be refused with the PENDING_CHANGE_EXISTS response. No domain objects, attributes or associations will be modified.

A new Change may be recorded after the existing pending Change has been accepted or rejected. The new Change will be based on the latest approved DesignVersion.

All previous changes and design versions will remain in the design history.

**Known Consequence:** If customer request multiple changes at the same time, the Designer must combine them into a single Change or wait until the existing pending Change has been accepted or rejected.

**Rationale:** Restricting each OrderItem to one pending Change prevents conflicts between proposed design versions, price adjustments and expected completion dates. It also simplifies customer approval, pause management and responsibility allocation while preserving the complete design history.

**Affected Artefacts:** Revised Analysis Baseline, Business Rules, SSD-01, OC-02, Gherkin Scenarios and subsequent CRC Cards.

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan (with conditions, see feedback below)

**Feedback (Ryan):** Agree with the proposal, provided the linked artefacts are updated.

- Only one pending Change per OrderItem is not stated in the scenario or the revised analysis baseline. It is a new business rule rather than a design decision, so it should be added to the business rules in the revised analysis baseline.
- OC-02 only has the NO_APPROVED_VERSION refusal. A second refusal is needed for PENDING_CHANGE_EXISTS, where nothing is created or modified.
- SSD-01 and the Gherkin scenarios do not yet show this refusal. A refused recordChange branch and a matching scenario will be added once the rule is agreed.
- If the customer asks for two separate changes at the same time, the designer must combine them into one Change or wait for the first response. This should be recorded as a known consequence.
- The scenario and baseline do not say whether more than one change can await a response, so this fills a gap rather than overriding an existing rule. Without it, two pending changes based on the same version could conflict, and no existing rule prevents that.

**Suggested outcome:** Accept OQ-04. Add the rule to the baseline business rules upon team agreement, add the PENDING_CHANGE_EXISTS refusal to OC-02, then update SSD-01 and the Gherkin scenarios.

### OQ-05 StaffMember Accountability

**Proposed Decision:** Separate associations will be maintained between Change and StaffMember to identify the employee who originally recorded the change and the employee who subsequently recorded the customer response.

The existing association will represent recordedBy. A new optional association named responseRecordedBy will be introduced.

While Change is Pending, responseRecordedBy will remain unset. When customer agreement or rejection is recorded, Change will be associated with the StaffMember responsible for recording that response, and the responseDate will be recorded.

The original recordedBy association will remain unchanged

**Rationale:** This approach ensures accountability for both change creation and customer response recording, in accordance with NFR4. It preserves the identity of each responsible StaffMember without introducing an unnecessary additional domain class.

**Affected Artefacts:** Domain Model, OC-03, OC-04 and subsequent CRC Cards and Design Class Diagram.

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan, Ahmad

### OQ-06 Pause Conditions

**Proposed Decision:** Recording any proposed design change through UC6 will pause work on the associated OrderItem, regardless of whether the change affect the price or expected completion date.

The OrderItem will remain paused while the Change is awaiting a customer response.

Following customer agreement or rejection, the pause associated with the Change will be lifted, provided that no other blocking conditions remain.

Only affected OrderItem will be paused, rather than entire Order.

**Rationale:** Changes to dimensions, finish or drawings may affect production even when the price and expected completion date remain unchanged. Pausing work until the customer responds reduces the risk of manufacturing against an unapproved design, wasting materials and performing unnecessary rework. This approach also simplifies pause management and maintains consistency with the current SSD and Operation Contracts.

**Affected Artefacts:** Revised Analysis Baseline, BR3, SSD-01, OC-02, OC-03, OC-04, Gherkin Scenarios and subsequent CRC Cards.

**Proposed by:** Andrii

**Status:** Proposed - awaiting team agreement

- Disagreed: Ryan (see feedback below)

**Feedback (Ryan):** Disagree with the proposal as currently written.

- BR3 in the revised analysis baseline states that the customer must agree before work carries on if a change affects the price or date. UC6 extension 4a covers the case where it does not. OQ-06 would override an agreed business rule, so it is a baseline change rather than a design decision.
- SSD-01 returns itemPaused so the designer can see whether work stopped. If every change pauses work, itemPaused is always true and no longer carries information.
- The risk in the rationale (manufacturing against an unapproved design) is already covered. A change creates a new DesignVersion, which is not approved until the customer agrees, and an item cannot go into production until its design is approved (CA1 BR1).
- Unlike OQ-04, which fills a gap in the baseline, this proposal replaces an existing rule. Changing an agreed rule needs a problem the current rules do not handle, and the risk given in the rationale is already handled by BR1 (see above).

**Suggested outcome:** Keep BR3 and extension 4a. Only changes that affect the price or expected completion date pause work on the OrderItem.

**Agreed**- Ahmad

**Revised Decision:** Only changes affecting the price or expected completion date will cause the affected OrderItem to be paused.

If neither is affected, the existing pause state of the OrderItem will remain unchanged.

**Final Status:** Agreed - awaiting implementation and consistency verification

### OQ-07 Missing Order or OrderItem

**Proposed Decision:** Separate refusal responses will be used when the specified Order or OrderItem cannot be found.

If no Order exists with the specified orderNumber, the system will return ORDER_NOT_FOUND.

If the Order exists but does not contain an OrderItem with the specified itemNumber, the system will return ORDER_ITEM_NOT_FOUND.

These refusal responses will apply to both findOrderItem() and recordChange().

No domain objects, attributes or associations will be modified when either refusal occurs.

**Rationale:** Distinguishing between a missing Order and a missing OrderItem provides clearer feedback to the Designer and allows incorrect identifiers to be corrected. It also ensures that invalid requests do not modify the domain state. 

**Affected Artefacts:** SSD-01, OC-01, OC-02, Gherkin Scenarios and subsequent CRC Cards.

**Proposed by:** Andrii

**Status:** Agreed - awaiting implementation and consistency verification

- Agreed: Ryan, Ahmad
