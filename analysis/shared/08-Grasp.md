# GRASP Design Rationale – UC6 Record Change

## 1. Purpose

This document evaluates and justifies the responsibility
assignments identified during the CRC modelling of UC6 –
Record Change using GRASP principles.

## 2. Source Artefacts

- UC6 – Record Change
- Gherkin Scenarios
- Domain Model
- System Sequence Diagram
- Operation Contracts (OC-01 to OC-04)
- CRC Cards and Scenario Role-Play

## 3. GRASP Responsibility Assignment

### 3.1 Information Expert

|ID | Responsibility | Assigned Class | GRASP Rationale | Alternative Rejected |
|---|---|---|---|---|
|IE-01 | Locate OrderItem using itemNumber | Order | Information Expert: Order own its associated orderItems and therefore has the information required to locate them using their itemNumber | OrderRepository: Assigning this responsibility to the repository would introduce unnecessary coupling and move responsibility away from the appropriate domain object |
|IE-02 | Determine the latest approved DesignVersion | OrderItem | Information Expert: OrderItem maintains its associated DesignVersions and can determine the latest approved version by collaborating with them. |  DesignVersion: An individual DesignVersion knows its own versionNumber and Approval records rather than the complete design history. Assigning this responsibility to DesignVersion would introduce unnecessary coupling|
| IE-03 | Determine whether a DesignVersion is approved | DesignVersion | Information Expert: DesignVersion knows its associated Approval records and therefore possesses the information required to determine whether it is approved. | OrderItem: Assigning this responsibility to OrderItem would require it to access and interpret the Approval records of individual DesignVersions, introducing unnecessary coupling and reducing cohesion. |
| IE-04 | Update price and expectedCompletionDate | OrderItem | Information Expert: OrderItem owns its price and expectedCompletionDate and should be responsible for updating these attributes, maintaining encapsulation and reducing the risk of an inconsistent state. | Change: Assigning this responsibility to Change would increase coupling and weaken encapsulation by allowing another class to directly manage OrderItem's attributes. |
| IE-05 | Pause and resume work | OrderItem | Information Expert: OrderItem owns its isPaused attribute and should be responsible for modifying its pause state based on information provided by Change and applicable business rules. | Change: Allowing Change to directly modify the pause state of OrderItem would weaken encapsulation, increase coupling and risk leaving OrderItem in an inconsistent state. |
| IE-06/07 | Manage Change status and responseDate, and determine whether a customer response has already been received | Change | Information Expert: When a StaffMember records a customer response received outside the system, Change is responsible for managing its own status and responseDate. It possesses the information required to determine whether a customer response has already been received. | OrderItem: Assigning this responsibility to OrderItem would require it to access and manage the internal state of Change, increasing coupling and reducing cohesion. |
| IE-08 | Determine the next versionNumber | OrderItem | Information Expert: OrderItem maintains the complete history of its associated DesignVersions and therefore possesses the information required to determine the next versionNumber. | Change: Assigning this responsibility to Change would require it to navigate to OrderItem and examine its design history, introducing unnecessary coupling and reducing cohesion. |



### 3.2 Creator

|ID| Responsibility | Assigned Class | GRASP Rationale | Alternative Rejected |
|---|---|---|---|---|
| CR-01 | Create Change | StaffMember | Creator: StaffMember records Change instances, as represented by the association in the Domain Model, making it a suitable class for creating new Change instances. | OrderItem: Although OrderItem maintains the affected design history, assigning Change creation to OrderItem would introduce an additional responsibility unrelated to its primary role of managing its own design history and item state, potentially reducing cohesion. |
| CR-02 | Create DesignVersion | Change | Creator: Change knows the original approved DesignVersion and represents the proposed modification that results in a new DesignVersion, making it a suitable creator. | OrderItem: Although OrderItem is a valid Creator candidate because it maintains the design history, assigning creation to Change keeps the responsibility with the object representing the proposed modification, while OrderItem remains responsible for maintaining the design history. |
| CR-03 | Create Approval | StaffMember | Creator: StaffMember records Approval instances, making it a suitable class for creating a new Approval when customer agreement is recorded. | DesignVersion: Although DesignVersion is a valid Creator candidate because it maintains associated Approval records, StaffMember is preferred because it explicitly records approvals, allowing DesignVersion to remain focused on its design information and approval state. |
### 3.3 Controller

|ID| Responsibility | Assigned Class | GRASP Rationale | Alternative Rejected |
|---|---|---|---|---|
| CT-01 | Receive system events, coordinate operations and return outcomes | RecordChangeCoordinator | Controller: RecordChangeCoordinator acts as a use-case controller for UC6, providing a single point of entry for its system events and coordinating operations by delegating responsibilities to the appropriate domain objects. | StaffMember: Assigning system event handling to StaffMember would introduce use-case coordination responsibilities into a domain class. As the system grows, this could overload StaffMember with unrelated responsibilities, reducing cohesion and increasing coupling. |

### 3.4 Low Coupling and High Cohesion

|ID| Responsibility | Assigned Class | GRASP Rationale | Alternative Rejected |
|---|---|---|---|---|
| LC-01 | Separate object retrieval from domain responsibilities | OrderRepository, ChangeRepository | Low Coupling: Assigning retrieval responsibilities to repositories reduces dependencies on the underlying storage technology and separates persistence responsibilities from domain responsibilities, minimising the impact of future storage changes. | RecordChangeCoordinator: Assigning direct retrieval from persistent storage to RecordChangeCoordinator would introduce unnecessary dependencies on storage technology and reduce its focus on coordinating system events. |
| HC-01 | Separate use-case coordination from domain responsibilities | RecordChangeCoordinator | High Cohesion: Grouping UC6 coordination responsibilities within RecordChangeCoordinator allows domain classes to remain focused on their own responsibilities rather than managing the entire use case. | StaffMember: Assigning use-case coordination to StaffMember could overload the class with unrelated responsibilities as the system grows, resulting in low cohesion and making future changes more difficult. |

