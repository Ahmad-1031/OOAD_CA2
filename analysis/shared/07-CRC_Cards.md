
# 07 – CRC Cards and Responsibility Assignment

## UC6 – Record Change

**Author:** [Ahmad]  
**Reviewer:** []  
**Date:** [25/11/26]  
**Status:** Draft  

---

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

## 2. Source Artefacts

| Artefact | Reference |
|---|---|
| User Story | [Reference] |
| Use Case | UC6 – Record Change |
| Gherkin Scenarios | record-change.feature |
| System Sequence Diagram | ssd-uc6-record-change.puml |
| Operation Contracts | 06-Operation_Contracts.md |
| Domain Model | uc6-domain-model.puml |
| Business Rules | [Reference] |

---

## 3. Required Responsibilities

The following responsibilities are derived from the operation 
contracts before being assigned to individual classes.

### 3.1 OC-01 – findOrderItem
|Required Responsibility | Type | Assign Class |
|---|---|---|
|Identify the order using  its **orderNumber** | Doing | OrderRepository(proposed) |
|Locate relevant order item within Order | Doing | Order | 
|Determine the latest approved design version | Doing | OrderItem |
|Know the DesignVersion associated with OrderItem | Knowing | OrderItem|
|Know the current item status | Knowing | OrderItem|
|Know the current item price | Knowing | OrderItem |
|Know the expected completion date | Knowing | OrderItem |
|Return the current order item details | Doing | RecordChangeCoordinator(proposed) |


### 3.2 OC-02 – recordChange
|Required Responsibility | Type | Class |
|---|---|---|
|Locate Order using it's **OrderNumber** | Doing | OrderRepository (proposed) |
|Identify OrderItem associated with Order | Doing | Order|
|Know the staff member recording change | Knowing | Change |
|Know staff member's role | Knowing | StaffMember |
|Know the original approved DesignVersion associated with the Change | Knowing | Change |
|Know the proposed DesignVersion associated with the Change | Knowing | Change |
|Create new change instance | Doing | StaffMember |
|Create new design version instance | Doing | Change |
|Know the unique changeNumber assigned to Change | Knowing | Change |
|Know the versionNumber of a DesignVersion | Knowing |DesignVersion | 
|Assign new versionNumber to desginVersion | Doing | OrderItem (Open)  |
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
|Associate change with the StaffMember recording it | Doing | Change |
|Pause work on the affected OrderItem according to the applicable business rule| Doing | OrderItem | 
|Verify previous approved design version is unchanged | Doing | RecordChangeCoordinator |
|Retain original DesignVersion as the latest approved version | Doing | OrderItem|
|Preserve the original price and expected completion date of OrderItem | Doing | OrderItem |
|Return changeNumber, newVersionNumber and itemPaused | Doing | RecordChangeCoordinator |
|Return refusal outcome if no approved DesignVersion exists | Doing | RecordChangeCoordinator |



### 3.3 OC-03 – recordCustomerAgreement
|Required Responsibility | Type | Class |
|---|---|---|
|Locate Change using changeNumber | Doing | ChangeRepository (Proposed)
|Know StaffMember recording customer agreement | Knowing | Approval |
|Set change status to Accepted | Doing | Change |
|Record customer agreement responseDate | Doing | Change |
|Create a new Approval instance | Doing | StaffMember |
|Record customer agreement approvalDate | Doing | Approval |
|Know the current status of the change | Knowing | Change |
|Know the proposed new completionDate | Knowing | Change |
|Know proposed DesignVersion associated with the Change | Knowing | Change |
|Associate approval with proposed DesignVersion | Doing | Approval |
|Know the Customer who agreed to the Change | Knowing | Approval |
|Associate approval with customer who agreed to change | Doing | Approval |
|Associate approval with StaffMember that recorded agreement | Doing | StaffMember |
|Establish proposed design version is latest approved version for OrderItem | Doing | OrderItem |
|Know OrderItem affected by Change | Knowing | DesignVersion |
|Know OrderItem price | Knowing | OrderItem |
|Know recorded priceChange | Knowing | Change | 
|Update OrderItem price according to the recorded priceChange| Doing | OrderItem |
|Set OrderItem expectedCompletionDate to newCompletionDate | Doing | OrderItem |
|Lift pause associated with accepted Change | Doing | OrderItem |
| Preserve previous DesignVersion instances | Doing (Constraint) | OrderItem |
| Preserve existing Approval records | Doing (Constraint) | DesignVersion |
|Know the latest approved DesignVersion | Knowing | OrderItem |
|Know the current expectedCompletionDate | Knowing | OrderItem |
|Know whether the orderItem is paused | Knowing | OrderItem |
|Return latestApprovedVersion, price, expectedCompletionDAte and itemPaused | Doing | OrderItem |
|Return 'INVALID_CHNAGE' when specified change does not exist | Doing | TBD (Design Decision) |
|Ensure no objects are created or deleted upon refusal | Doing (Constraint) |
|Preserve all attributes and associations upon refusal | Doing (Constraint) | 




### 3.4 OC-04 – recordCustomerRejection
|Required Responsibility | Type | Class |
|---|---|---|
|Locate the Change using the supplied ChnageNumber | Doing | ChangeRepository (Proposed)
|Know the identified StaffMember recording rejection | Knowing | TBD (Design Decision) | 
|Set Change status to 'Rejected' | Doing | Change |
|Record the responseDate of the Change | Doing | Change |
|Know previous approved DesignVersion | Knowing | Change |
|Retain the previous approved DesignVersion as the latest approved version of the OrderItem | Doing | OrderItem |
|Know the proposed DesignVersion associated with the rejected change | Knowing | Change |
| Retain the proposed DesignVersion in the design history without approval | Doing (Constraint) | OrderItem |
|Preserve existing OrderItem price | Doing | OrderItem |
|Retain the existing OrderItem expectedCompletionDate | Doing | OrderItem |
|Lift pause associated with rejected Change | Doing | OrderItem |
|Preserve the existing associations between the Change and both DesignVersion instances | Doing | Change |
|Ensure no new approval is created when recording rejection | Doing (constraint) | Operation-wide constraint |
|Ensure no domain objects are created or deleted | Doing (constraint) | Operation-wide constraint |
|Know the latest approved DesignVersion | Knowing | OrderItem | OrderItem |
|Know the current OrderItem price | Knowing | OrderItem |
|Know the current expectedCompletionDate | Knowing | OrderItem |
|Know whether the OrderItem is paused | Knowing | OrderItem |
|Return latestApprovedVersion, price, expectedCompletionDate and itemPaused | Doing | OrderItem |
|Determine whether the specified Change exists | Doing | ChangeRepository (proposed) |
|Determine whether the Change has already received a customer response | Doing | Change |
|Return 'Invalid_Change' message | Doing | TBD (Design Decision) |
|Preserve all existing attributes and associations | Doing | Operation-wide constraint |










## 4. CRC Cards

The following CRC cards assign focused knowing and doing 
responsibilities to the selected classes.


### 4.1 Order

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know associated OrderItems | | OrderItem |
| Know orderNumber | | |
| | Locate the relevant OrderItem using itemNumber | OrderItem |


### 4.2 OrderItem

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know itemNumber | | |
| Know item status | | |
| Know item price | | |
| Know item description | | |
| Know expectedCompletionDate | | |
| Know associated DesignVersions | | DesignVersion |
| Know whether OrderItem is paused | | |
| | Determine the latest approved DesignVersion | DesignVersion |
| | Determine whether an approved DesignVersion exists | DesignVersion |
| | Associate a new DesignVersion with the OrderItem | DesignVersion |
| | Pause work when a proposed Change is recorded | |
| | Lift pause upon customer acceptance or rejection | Change |
| | Update expectedCompletionDate based on newCompletionDate | Change |
| | Update price according to priceChange | Change |
| | Return current OrderItem details | DesignVersion |

### 4.3 DesignVersion

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know versionNumber | | |
| Know createdDate | | |
| Know dimensions | | |
| Know finish | | |
| Know drawings | | |
| Know the associated OrderItem | | OrderItem |
| Know associated Approval records | | Approval |
| | Determine whether the DesignVersion is approved | Approval |
| | Provide versionNumber | |
| | Preserve existing Approval records | Approval |

### 4.4 Change

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know the StaffMember recording the Change | | StaffMember |
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
| | Associate Change with the StaffMember recording it | StaffMember |
| | Record changeDate | |
| | Record customer responseDate | |
| | Set Change status to Pending | |
| | Set Change status to Accepted | |
| | Set Change status to Rejected | |
| | Determine whether Change has already received a customer response | |
| | Identify the OrderItem affected by the Change | DesignVersion |

### 4.5 Approval

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know StaffMember recording Approval | | StaffMember |
| Know Customer giving Approval | | Customer |
| Know approvalDate | | |
| Know approval scope | | |
| Know approvedParts | | |
| Know associated DesignVersion | | DesignVersion |
| | Record approvalDate | |
| | Associate Approval with the proposed DesignVersion | DesignVersion |
| | Associate Approval with the Customer giving approval | Customer |
| | Associate Approval with the StaffMember recording it | StaffMember |


### 4.6 Customer

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know customer name | | |
| Know associated Orders | | Order |
| Know associated Approval records | | Approval |



### 4.7 StaffMember

| Knowing Responsibilities | Doing Responsibilities | Collaborators |
|---|---|---|
| Know StaffMember name | | |
| Know StaffMember role | | |
| Know associated Change records | | Change |
| Know associated Approval records | | Approval |
| | Create a new Change instance | Change |
| | Record Approval instance | Approval |


## 5. Proposed Design Classes


### 5.1 OrderRepository (Proposed)

OrderRepository is proposed to provide access to existing
Order instances without assigning retrieval responsibilities
to individual domain objects.

| Responsibilities | Collaborators |
|---|---|
| Locate an Order using the supplied orderNumber | Order |
| Provide the identified Order instance | Order |

### 5.2 ChangeRepository (Proposed)

ChangeRepository is proposed to provide direct access to
existing Change instances without requiring navigation
through Order, OrderItem and DesignVersion.

| Responsibilities | Collaborators |
|---|---|
| Locate a Change using the supplied changeNumber | Change |
| Provide the identified Change instance | Change |
| Report when a specified Change does not exist | |

The proposed classes will be evaluated and justified
through GRASP principles before being incorporated
into the Design Class Diagram.



## 6. Scenario Role-Play

The CRC cards are tested by role-playing the selected 
scenarios to ensure that every required responsibility 
has an appropriate owner.


### 6.1 Main Success Scenario – Record a Change

**Gherkin reference:** A change to the price pauses work until the customer agrees.

**Operation Contracts:** OC-01 and OC-02.

| Step | Message or Responsibility | Card Receiving Work |
|---|---|---|
| 1 | Designer requests OrderItem details | TBD |
| 2 | Locate Order 1050 using orderNumber | OrderRepository |
| 3 | Locate OrderItem 1 using itemNumber | Order |
| 4 | Determine the latest approved DesignVersion | OrderItem |
| 5 | Determine whether DesignVersion 2 is approved | DesignVersion |
| 6 | Return current OrderItem details | OrderItem |
| 7 | Designer records the proposed change | (Discussed with customer external to the system) |
| 8 | Create a new Change instance | StaffMember |
| 9 | Create DesignVersion 3 based on DesignVersion 2 | Change |
| 10 | Associate the new DesignVersion with OrderItem | OrderItem |
| 11 | Associate Change with the original and proposed DesignVersions | Change |
| 12 | Associate Change with the StaffMember recording it | Change |
| 13 | Record changeDate | Change |
| 14 | Set Change status to Pending | Change |
| 15 | Pause work on OrderItem 1 | OrderItem |
| 16 | Return changeNumber, newVersionNumber and itemPaused | TBD |

#### Expected Outcome

| Information | Expected Result |
|---|---|
| Latest approved DesignVersion | 2 |
| Proposed DesignVersion | 3 |
| Change status | Pending |
| Recorded priceChange | +€350 |
| Recorded newCompletionDate | 29 November |
| Current OrderItem price | €2,400 |
| Current expectedCompletionDate | 20 November |
| isPaused | True |


### 6.2 Alternative Scenario – Customer Rejection

**Gherkin reference:** A rejected change keeps the previous approved version.

**Operation Contract:** OC-04.

| Step | Message or Responsibility | Card Receiving Work |
|---|---|---|
| 1 | Designer records customer rejection (communicated by the customer outside the system) | TBD |
| 2 | Locate Change using the supplied changeNumber | ChangeRepository |
| 3 | Determine whether Change has already received a customer response | Change |
| 4 | Identify the OrderItem affected by the Change | Change / DesignVersion |
| 5 | Set Change status to Rejected | Change |
| 6 | Record customer responseDate | Change |
| 7 | Lift pause on OrderItem 1 | OrderItem |
| 8 | Determine the latest approved DesignVersion | OrderItem |
| 9 | Determine whether the DesignVersion is approved | DesignVersion |
| 10 | Return current OrderItem details | OrderItem |
| 11 | Return latestApprovedVersion, price, expectedCompletionDate and itemPaused | TBD |

#### Expected Outcome

| Information | Expected Result |
|---|---|
| Latest approved DesignVersion | 2 |
| Proposed DesignVersion | 3 (retained without approval) |
| Change status | Rejected |
| Customer responseDate | Recorded |
| Current OrderItem price | €2,400 |
| Current expectedCompletionDate | 20 November |
| isPaused | False |
| New Approval instance created | No |
| Domain objects created or deleted | None |