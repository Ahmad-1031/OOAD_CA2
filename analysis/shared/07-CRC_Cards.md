
# CRC Cards – UC6 Record Change

| Field | Details |
|---|---|
| Artefact ID | CRC-06 |
| Artefact Name | CRC Cards – UC6 Record Change |
| Owner | Ahmad |
| Reviewer | [Group member name] |
| Related Use Case | UC6 – Record Change |
| Input Artefacts | Domain Model, Gherkin Scenarios, SSD and Operation Contracts (OC-01 to OC-04) |
| Leads Into | GRASP Design Rationale (DR-06), Design Class Diagram (DCD) and Object Sequence Diagrams (SD) |
| Status | Awaiting Peer Review |

---
<br>

## 1. Purpose

The purpose of this section is to identify and assign knowing 
and doing responsibilities to the classes involved in UC6 – 
Record Change.

The CRC cards are derived from the agreed System Sequence 
Diagram, Operation Contracts, Domain Model and business rules.

These responsibility assignments will provide the foundation 
for the GRASP rationale, Design Class Diagram and Object 
Interaction Sequence Diagram.

---



## 2. Required Responsibilities

The following responsibilities are derived from the operation 
contracts before being assigned to individual classes.

### 2.1 OC-01 – findOrderItem
|Required Responsibility | Type | Assign Class |
|---|---|---|
|Identify the order using  its **orderNumber** | Doing | OrderRepository(proposed) |
|Locate relevant order item within Order | Doing | Order | 
|Determine the latest approved design version | Doing | OrderItem |
| Determine whether the DesignVersion is fully approved | Doing | DesignVersion |
|Know the DesignVersion associated with OrderItem | Knowing | OrderItem|
|Know the current item status | Knowing | OrderItem|
|Know the current item price | Knowing | OrderItem |
|Know the expected completion date | Knowing | OrderItem |
| Provide current OrderItem details | Doing | OrderItem |
|Return the current order item details | Doing | RecordChangeCoordinator(proposed) |
| Determine whether the specified Order exists | Doing | OrderRepository |
| Determine whether the specified OrderItem exists within the Order | Doing | Order |
| Return ORDER_NOT_FOUND when the specified Order does not exist | Doing | RecordChangeCoordinator |
| Return ORDER_ITEM_NOT_FOUND when the specified OrderItem does not exist within the Order | Doing | RecordChangeCoordinator |
| Preserve domain state upon refusal | Constraint | Operation-wide constraint |


### 2.2 OC-02 – recordChange
|Required Responsibility | Type | Class |
|---|---|---|
|Locate Order using it's **OrderNumber** | Doing | OrderRepository (proposed) |
|Identify OrderItem associated with Order | Doing | Order|
|Know the staff member recording change | Knowing | Change |
|Know staff member's role | Knowing | StaffMember |
|Know the original approved DesignVersion associated with the Change | Knowing | Change |
|Know the proposed DesignVersion associated with the Change | Knowing | Change |
| Provide the next globally unique changeNumber | Doing | ChangeRepository |
|Create new change instance | Doing | StaffMember |
| Assign the supplied changeNumber when creating the Change | Doing | StaffMember |
|Create new design version instance | Doing | Change |
|Know the unique changeNumber assigned to Change | Knowing | Change |
|Know the versionNumber of a DesignVersion | Knowing |DesignVersion | 
| Determine the next versionNumber | Doing | OrderItem |
| Assign the supplied versionNumber to the new DesignVersion | Doing | Change |
|Know the dimensions of a change | Knowing | DesignVersion |
|Know the finish of a change | Knowing | DesignVersion |
|Know the drawings of a change | Knowing | DesignVersion|
|Know the description of a change | Knowing | Change |
|Know the priceChange of a change | Knowing | Change |
|Know the new completionDate of a change | Knowing | Change |
|Record the changeDate of a change | Doing | Change |
|Know the current status of the Change | Knowing | Change |
|Set change status to pending | Doing | Change  |
|Know whether the OrderItem isPaused | Knowing | OrderItem |
|Associate change with the original approved DesignVersion | Doing | Change |
|Associate change with newly created DesignVersion | Doing | Change |
| Associate the newly created DesignVersion with the OrderItem | Doing | OrderItem |
| Associate Change with the StaffMember recording it through recordedBy | Doing | Change |
| Ensure responseRecordedBy remains unset when the Change is created | Constraint | Change |
| Determine whether the Change affects the price or expected completion date | Doing | Change |
| Consult the Change to determine whether work should be paused | Doing | OrderItem |
| Pause work on the affected OrderItem only when the Change affects the price or expected completion date | Doing | OrderItem |
| Preserve the existing pause state when the Change affects neither price nor expected completion date | Constraint | OrderItem |
| Preserve the existing production status of the OrderItem | Constraint | OrderItem |
| Preserve the previous approved DesignVersion without modification | Constraint | Operation-wide constraint |
|Retain original DesignVersion as the latest approved version | Doing | OrderItem|
|Preserve the original price and expected completion date of OrderItem | Doing | OrderItem |
| Register the newly created Change instance | Doing | ChangeRepository |
|Return changeNumber, newVersionNumber and itemPaused | Doing | RecordChangeCoordinator |
| Determine whether a fully approved DesignVersion exists | Doing | OrderItem |
| Determine whether the DesignVersion is fully approved | Doing | DesignVersion |
| Return NO_APPROVED_VERSION when no fully approved DesignVersion exists | Doing | RecordChangeCoordinator |
| Determine whether the specified Order exists | Doing | OrderRepository |
| Determine whether the specified OrderItem exists within the Order | Doing | Order |
| Determine whether the OrderItem already has a pending Change | Doing | OrderItem |
| Determine whether a Change has Pending status | Doing | Change |
| Return ORDER_NOT_FOUND when the specified Order does not exist | Doing | RecordChangeCoordinator |
| Return ORDER_ITEM_NOT_FOUND when the specified OrderItem does not exist within the Order | Doing | RecordChangeCoordinator |
| Return PENDING_CHANGE_EXISTS when the OrderItem already has a pending Change | Doing | RecordChangeCoordinator |
| Preserve domain state upon refusal | Constraint | Operation-wide constraint |

**Feedback (Ryan):** Needs updating for the newer agreed OQs.

- No responsibility is assigned for the ORDER_NOT_FOUND and ORDER_ITEM_NOT_FOUND refusals (OQ-07, OC-01 and OC-02) or the PENDING_CHANGE_EXISTS refusal (OQ-04, OC-02).
- A class needs to be assigned for each so the methods can be added to the DCD.



### 2.3 OC-03 – recordCustomerAgreement
|Required Responsibility | Type | Class |
|---|---|---|
|Locate Change using changeNumber | Doing | ChangeRepository (Proposed) |
|Know StaffMember recording customer agreement | Knowing | Approval |
|Set change status to Accepted | Doing | Change |
|Record customer agreement responseDate | Doing | Change |
|Create a new Approval instance | Doing | StaffMember |
| Set Approval scope to Full | Doing | Approval |
| Ensure approvedParts is not applicable for Full approval | Constraint | Approval |
|Record customer agreement approvalDate | Doing | Approval |
|Know the current status of the change | Knowing | Change |
|Know the proposed new completionDate | Knowing | Change |
|Know proposed DesignVersion associated with the Change | Knowing | Change |
| Provide the proposed DesignVersion associated with the Change | Doing | Change |
|Associate approval with proposed DesignVersion | Doing | Approval |
| Associate a new Approval with the DesignVersion | Doing | DesignVersion |
|Know the Customer who agreed to the Change | Knowing | Approval |
|Associate approval with customer who agreed to change | Doing | Approval |
|Associate approval with StaffMember recording it | Doing | Approval |
|Establish proposed design version is latest approved version for OrderItem | Doing | OrderItem |
|Know OrderItem affected by Change | Knowing | DesignVersion |
| Identify the OrderItem affected by the Change | Doing | Change |
| Provide the OrderItem associated with the DesignVersion | Doing | DesignVersion |
| Provide the Order associated with the OrderItem | Doing | OrderItem |
| Provide the Customer associated with the Order | Doing | Order |
|Know OrderItem price | Knowing | OrderItem |
|Know recorded priceChange | Knowing | Change | 
|Update OrderItem price according to the recorded priceChange| Doing | OrderItem |
|Set OrderItem expectedCompletionDate to newCompletionDate | Doing | OrderItem |
| Determine whether the accepted Change caused the OrderItem to be paused | Doing | OrderItem |
| Determine whether any other blocking conditions remain | Doing | OrderItem |
| Lift the pause associated with the accepted Change only if no other blocking conditions remain | Doing | OrderItem |
| Preserve the existing pause state when the Change did not cause a pause or other blocking conditions remain | Constraint | OrderItem |
| Preserve the existing production status of the OrderItem | Constraint | OrderItem |
| Preserve previous DesignVersion instances | Doing (Constraint) | OrderItem |
| Preserve existing Approval records | Doing (Constraint) | DesignVersion |
|Know the latest approved DesignVersion | Knowing | OrderItem |
|Know the current expectedCompletionDate | Knowing | OrderItem |
|Know whether the orderItem is paused | Knowing | OrderItem |
| Provide current OrderItem details | Doing | OrderItem |
| Return latestApprovedVersion, price, expectedCompletionDate and itemPaused | Doing | RecordChangeCoordinator |
| Determine whether the specified Change exists | Doing | ChangeRepository |
| Determine whether the Change has already received a customer response | Doing | Change |
| Return INVALID_CHANGE when the specified Change does not exist or has already received a customer response | Doing | RecordChangeCoordinator |
| Preserve domain state upon refusal | Constraint | Operation-wide constraint |
| Know the StaffMember who recorded the customer response | Knowing | Change |
| Associate Change with the StaffMember recording customer agreement through responseRecordedBy | Doing | Change |
| Preserve the original recordedBy association | Constraint | Change | 




### 2.4 OC-04 – recordCustomerRejection
|Required Responsibility | Type | Class |
|---|---|---|
|Locate the Change using the supplied changeNumber | Doing | ChangeRepository (Proposed) |
| Know the StaffMember who recorded the customer response | Knowing | Change |
| Associate Change with the StaffMember recording customer rejection through responseRecordedBy | Doing | Change |
| Preserve the original recordedBy association | Constraint | Change |
|Set Change status to 'Rejected' | Doing | Change |
|Record the responseDate of the Change | Doing | Change |
| Identify the OrderItem affected by the Change | Doing | Change |
| Provide the OrderItem associated with the DesignVersion | Doing | DesignVersion |
|Know previous approved DesignVersion | Knowing | Change |
|Retain the previous approved DesignVersion as the latest approved version of the OrderItem | Doing | OrderItem |
|Know the proposed DesignVersion associated with the rejected change | Knowing | Change |
| Retain the proposed DesignVersion in the design history without approval | Doing (Constraint) | OrderItem |
|Preserve existing OrderItem price | Doing | OrderItem |
|Retain the existing OrderItem expectedCompletionDate | Doing | OrderItem |
| Determine whether the rejected Change caused the OrderItem to be paused | Doing | OrderItem |
| Determine whether any other blocking conditions remain | Doing | OrderItem |
| Lift the pause associated with the rejected Change only if no other blocking conditions remain | Doing | OrderItem |
| Preserve the existing pause state when the Change did not cause a pause or other blocking conditions remain | Constraint | OrderItem |
| Preserve the existing production status of the OrderItem | Constraint | OrderItem |
|Preserve the existing associations between the Change and both DesignVersion instances | Doing | Change |
|Ensure no new approval is created when recording rejection | Doing (constraint) | Operation-wide constraint |
|Ensure no domain objects are created or deleted | Doing (constraint) | Operation-wide constraint |
|Know the latest approved DesignVersion | Knowing | OrderItem |
|Know the current OrderItem price | Knowing | OrderItem |
|Know the current expectedCompletionDate | Knowing | OrderItem |
|Know whether the OrderItem is paused | Knowing | OrderItem |
| Provide current OrderItem details | Doing | OrderItem |
| Return latestApprovedVersion, price, expectedCompletionDate and itemPaused | Doing | RecordChangeCoordinator |
| Determine whether the specified Change exists | Doing | ChangeRepository |
| Determine whether the Change has already received a customer response | Doing | Change |
| Return INVALID_CHANGE when the specified Change does not exist or has already received a customer response | Doing | RecordChangeCoordinator |
| Preserve domain state upon refusal | Constraint | Operation-wide constraint |

**Feedback (Ryan):** responseRecordedBy (OQ-05) is not included.

- In 2.3 Approval knows the StaffMember recording the agreement, but in 2.4 the StaffMember recording the rejection is TBD.
- Both should be the same, using the responseRecordedBy association between Change and StaffMember.




## 3. CRC Cards

The following CRC cards assign focused knowing and doing 
responsibilities to the selected classes.


### 3.1 Order

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know associated OrderItems | | OrderItem |
| Know orderNumber | | |
|Know the Customer who placed the Order | | Customer |
| | Locate the relevant OrderItem using itemNumber | OrderItem |
| | Determine whether the specified OrderItem exists within the Order | OrderItem |
| | Provide the Customer associated with the Order | Customer |


### 3.2 OrderItem

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know itemNumber | | |
| Know item status | | |
| Know item price | | |
| Know item description | | |
| Know expectedCompletionDate | | |
| Know associated DesignVersions | | DesignVersion |
| Know the Order associated with the OrderItem | | Order |
| Know whether OrderItem is paused | | |
| | Determine the latest approved DesignVersion | DesignVersion |
| | Determine whether a fully approved DesignVersion exists | DesignVersion |
| | Associate a new DesignVersion with the OrderItem | DesignVersion |
| | Consult the Change to determine whether work should be paused | Change |
| | Pause work only when a Change affects the price or expected completion date | Change |
| | Determine whether a Change caused the OrderItem to be paused | Change |
| | Determine whether any other blocking conditions remain | |
| | Lift the pause associated with a Change following customer acceptance or rejection only if no other blocking conditions remain | Change |
| | Preserve the existing pause state when the applicable pause or resume conditions are not met | Change |
| | Update expectedCompletionDate based on newCompletionDate | Change |
| | Update price according to priceChange | Change |
| | Provide current OrderItem details | DesignVersion |
| | Provide the Order associated with the OrderItem | Order |
| | Determine whether the OrderItem already has a pending Change | DesignVersion, Change |
| | Determine the next versionNumber | DesignVersion |

**Feedback (Ryan):** "Pause work when a proposed Change is recorded" does not match OQ-06.

- After OQ-06, work is only paused when the change affects the price or expected completion date.

[!Note]
>**Open Design Consideration:**
>The mechanism for determining whether a Change caused a pause
>and whether other blocking conditions remain must be confirmed
>during detailed design. The isPaused attribute alone does not
>identify the reason for a pause.

### 3.3 DesignVersion

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know versionNumber | | |
| Know createdDate | | |
| Know dimensions | | |
| Know finish | | |
| Know drawings | | |
| Know the associated OrderItem | | OrderItem |
| Know associated Approval records | | Approval |
| | Provide versionNumber | |
| | Provide the OrderItem associated with the DesignVersion | OrderItem |
| | Associate a new Approval with the DesignVersion | Approval |
| | Preserve existing Approval records | Approval |
| | Determine whether the DesignVersion is fully approved | Approval |

### 3.4 Change

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know the StaffMember who originally recorded the Change through recordedBy | | StaffMember |
| Know the StaffMember who recorded the customer response through responseRecordedBy | | StaffMember |
| Know the unique changeNumber | | |
| Know the changeDate | | |
| Know the change description | | |
| Know the priceChange | | |
| Know the newCompletionDate | | |
| Know the responseDate | | |
| Know the current Change status | | |
| Know the original approved DesignVersion | | DesignVersion |
| Know the proposed DesignVersion | | DesignVersion |
| | Create a new DesignVersion instance | DesignVersion |
| | Assign the supplied versionNumber to the new DesignVersion | DesignVersion |
| | Associate Change with the original approved DesignVersion | DesignVersion |
| | Associate Change with the proposed DesignVersion | DesignVersion |
| | Associate Change with the StaffMember originally recording it through recordedBy | StaffMember |
| | Associate Change with the StaffMember recording the customer response through responseRecordedBy | StaffMember |
| | Record changeDate | |
| | Record customer responseDate | |
| | Set Change status to Pending | |
| | Set Change status to Accepted | |
| | Set Change status to Rejected | |
| | Determine whether Change has already received a customer response | |
| | Identify the OrderItem affected by the Change | DesignVersion |
| | Provide the proposed DesignVersion associated with the Change | DesignVersion |
| | Determine whether the Change has Pending status | |
| | Determine whether the Change affects the price or expected completion date | |

### 3.5 Approval

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know StaffMember recording Approval | | StaffMember |
| Know Customer giving Approval | | Customer |
| Know approvalDate | | |
| Know approval scope | | |
| Know approvedParts | | |
| Know associated DesignVersion | | DesignVersion |
| | Record approvalDate | |
| | Set Approval scope to Full when recording customer agreement in UC6 | |
| | Ensure approvedParts is not applicable for Full approval | |
| | Associate Approval with the proposed DesignVersion | DesignVersion |
| | Associate Approval with the Customer giving approval | Customer |
| | Associate Approval with the StaffMember recording it | StaffMember |


### 3.6 Customer

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know customer name | | |
| Know associated Orders | | Order |
| Know associated Approval records | | Approval |



### 3.7 StaffMember

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know StaffMember name | | |
| Know StaffMember role | | |
| Know associated Changes originally recorded by the StaffMember | | Change |
| Know associated Changes for which the StaffMember recorded the customer response | | Change |
| Know associated Approval records | | Approval |
| | Create a new Change instance using the supplied changeNumber | Change |
| | Create a new Approval instance | Approval |


## 4. Proposed Design Classes


### 4.1 OrderRepository (Proposed)

OrderRepository is proposed to provide access to existing
Order instances without assigning retrieval responsibilities
to individual domain objects.

| Responsibilities | Collaborators |
|---|---|
| Locate an Order using the supplied orderNumber | Order |
| Provide the identified Order instance | Order |
| Report when a specified Order does not exist | |

### 4.2 ChangeRepository (Proposed)

ChangeRepository is proposed to provide direct access to
existing Change instances without requiring navigation
through Order, OrderItem and DesignVersion.

It is also responsible for providing globally unique changeNumber values and registering newly created Change instances.

| Responsibilities | Collaborators |
|---|---|
| Locate a Change using the supplied changeNumber | Change |
| Provide the identified Change instance | Change |
| Report when a specified Change does not exist | |
|Provide the next globally unique changeNumber | Change |
|Register newly created Change instances | Change |

The proposed classes will be evaluated and justified
through GRASP principles before being incorporated
into the Design Class Diagram.

### 4.3 RecordChangeCoordinator (Proposed)

RecordChangeCoordinator is proposed as the use-case controller
for UC6 – Record Change, in accordance with the GRASP Controller
decision CT-01 documented in DR-06.

It receives system events, coordinates the required operations,
delegates business responsibilities to the appropriate domain
objects and returns operation outcomes.

| Responsibilities | Collaborators |
|---|---|
| Receive UC6 system events | |
| Coordinate retrieval of Order and Change instances | OrderRepository, ChangeRepository |
| Coordinate identification of the affected OrderItem | Order, Change |
| Coordinate refusal checks before modifying domain state | OrderRepository, Order, OrderItem, ChangeRepository, Change |
| Coordinate creation of Change and Approval instances | StaffMember |
| Coordinate allocation of globally unique changeNumber values | ChangeRepository |
| Coordinate registration of newly created Change instances | ChangeRepository |
| Coordinate creation and association of new DesignVersion instances | Change, OrderItem |
| Coordinate customer agreement and rejection operations | Change, OrderItem, StaffMember |
| Coordinate retrieval of the Customer associated with the affected OrderItem | Change, DesignVersion, OrderItem, Order |
| Coordinate association of the new Approval with the proposed DesignVersion | DesignVersion, Approval |
| Coordinate retrieval of operation result details | OrderItem, Change, DesignVersion |
| Return successful operation outcomes through the appropriate result objects | ItemDetails, ChangeResult, ResponseResult |
| Return refusal outcomes through the appropriate result objects | ItemDetails, ChangeResult, ResponseResult, Refusal |

**Related GRASP Decisions:** CT-01, LC-01, HC-01.



## 5. Scenario Role-Play

The CRC cards are tested by role-playing the selected 
scenarios to ensure that every required responsibility 
has an appropriate owner.


### 5.1 Main Success Scenario – Record a Change

**Gherkin reference:** A change to the price pauses work until the customer agrees.

**Operation Contracts:** OC-01 and OC-02.

| Step | Message or Responsibility | Card Receiving Work |
|---|---|---|
| 1 | Receive findOrderItem system event from Designer | RecordChangeCoordinator |
| 2 | Locate Order 1050 using orderNumber | OrderRepository |
| 3 | Locate OrderItem 1 using itemNumber | Order |
| 4 | Determine the latest approved DesignVersion | OrderItem |
| 5 | Determine whether DesignVersion 2 is fully approved | DesignVersion |
| 6 | Provide current OrderItem details | OrderItem |
| 7 | Return current OrderItem details to Designer | RecordChangeCoordinator |
| 8 | Receive recordChange system event from Designer | RecordChangeCoordinator |
| 9 | Locate Order 1050 using orderNumber | OrderRepository |
| 10 | Locate OrderItem 1 using itemNumber | Order |
| 11 | Identify the latest fully approved DesignVersion | OrderItem |
| 12 | Confirm DesignVersion 2 is fully approved | DesignVersion |
| 13 | Determine whether OrderItem 1 already has a pending Change | OrderItem |
| 14 | Confirm refusal conditions do not apply | RecordChangeCoordinator |
| 15 | Provide the next globally unique changeNumber | ChangeRepository |
| 16 | Create a new Change instance using the supplied changeNumber | StaffMember |
| 17 | Determine the next versionNumber | OrderItem |
| 18 | Create DesignVersion 3 based on DesignVersion 2 | Change |
| 19 | Associate the new DesignVersion with OrderItem | OrderItem |
| 20 | Associate Change with the original and proposed DesignVersions | Change |
| 21 | Associate Change with the StaffMember through recordedBy | Change |
| 22 | Record changeDate | Change |
| 23 | Set Change status to Pending | Change |
| 24 | Register the newly created Change instance | ChangeRepository |
| 25 | Consult the Change to determine whether work should be paused | OrderItem |
| 26 | Determine whether the Change affects price or expected completion date | Change |
| 27 | Pause work on OrderItem 1 because both price and completion date are affected | OrderItem |
| 28 | Return changeNumber, newVersionNumber and itemPaused | RecordChangeCoordinator |

#### Expected Outcome

| Information | Expected Result |
|---|---|
| Latest approved DesignVersion | 2 |
| Proposed DesignVersion | 3 |
| Change status | Pending |
| Recorded priceChange | +€350 |
| Recorded newCompletionDate | 27 November |
| Current OrderItem price | €2,400 |
| Current expectedCompletionDate | 20 November |
| recordedBy | StaffMember recording the Change |
| responseRecordedBy | Unset |
| Production status | Unchanged |
| isPaused | True |


### 5.2 Alternative Scenario – Customer Rejection

**Gherkin reference:** A rejected change keeps the previous approved version.

**Operation Contract:** OC-04.

| Step | Message or Responsibility | Card Receiving Work |
|---|---|---|
| 1 | Receive recordCustomerRejection system event from Designer | RecordChangeCoordinator |
| 2 | Locate Change using the supplied changeNumber | ChangeRepository |
| 3 | Determine whether Change has already received a customer response | Change |
| 4 | Confirm refusal conditions do not apply | RecordChangeCoordinator |
| 5 | Identify the OrderItem affected by the Change | Change |
| 6 | Provide the OrderItem associated with the DesignVersion | DesignVersion |
| 7 | Set Change status to Rejected | Change |
| 8 | Record customer responseDate | Change |
| 9 | Associate Change with the StaffMember recording rejection through responseRecordedBy | Change |
| 10 | Determine whether the rejected Change caused the OrderItem to be paused | OrderItem |
| 11 | Determine whether any other blocking conditions remain | OrderItem |
| 12 | Lift the pause associated with the rejected Change if no other blocking conditions remain | OrderItem |
| 13 | Determine the latest approved DesignVersion | OrderItem |
| 14 | Determine whether the DesignVersion is fully approved | DesignVersion |
| 15 | Provide current OrderItem details | OrderItem |
| 16 | Return latestApprovedVersion, price, expectedCompletionDate and itemPaused | RecordChangeCoordinator |

#### Expected Outcome

| Information | Expected Result |
|---|---|
| Latest approved DesignVersion | 2 |
| Proposed DesignVersion | 3 (retained without approval) |
| Change status | Rejected |
| Customer responseDate | Recorded |
| recordedBy | Unchanged |
| responseRecordedBy | StaffMember recording customer rejection |
| Current OrderItem price | €2,400 |
| Current expectedCompletionDate | 20 November |
| Production status | Unchanged |
| isPaused | False, provided no other blocking conditions remain |
| New Approval instance created | No |
| Domain objects created or deleted | None |