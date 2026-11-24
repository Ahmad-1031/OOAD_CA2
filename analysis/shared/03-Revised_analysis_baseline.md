## Selected User Story
>[!NOTE]
>**Purpose:** This baseline sets out the agreed analysis f or US2 (Record Change) and its use case, UC6. It records the scope, stakeholders, requirements, business rules, use case, Gherkin scenarios, and domain classes that US2 depends on.

**US2** - As a designer, I want to record a change against the design version it replaces, along with its effect on the price and date, so that the customer can be told before more work is done.

## 1. Scope

**In scope:** 
<br>
|Ref| The System will |
|---|---|
|S3| Keep a complete design history, show which one is the latest approved version and record if the customer approved all of it or only partially.|
|S4 | Link any change to the price or date to the design version that caused it.| 

**Out of scope:**

|Item| Reason | Belongs to |
|---|---|---|
|Deciding whether a change is practical | Staff decide; the system records the decision (2.1) | Staff|
|Defining what counts as customer agreement | Not confirmed (Q1, A1) | Open question |
|Calculating the new price or date | The report doesn't define how changes are priced | Open question|


## 2. Stakeholders

| ID | Stakeholder | Goal | Use cases |
|---|---|---|---|
| SH2 | Designer (direct) | As a designer, I want to record a change against the design version it replaces, along with its effect on the price and date, so that the customer can be told before more work is done. | UC06 |
| SH6 | Customer (indirect) | A clear quotation, and to be told about any change to the price or date before more work is done. | UC06|

## 3. Requirements

| ID | Requirement | Priority | Source | Use case | Status |
|---|---|---|---|---|---|
| FR4 | The system shall save each design version as a new numbered version without changing earlier versions.| Must | S3, AG2, P1 | UC6 | Open / Agreed |
|FR5 | The system shall record each approval against one design version, stating whether it is full or partial, the date and who recorded it. | Must | S3, AG3, A1 | Open / Agreed |
| FR7 | The system shall link each change to the design version it replaces and record how it affects the price and completion date.| Must | S4, AG4, P3 | UC06 | Open / Agreed |
|NFR4 | Accountability - Every approval, change and quality decision records who made it and when | Must | S7, FR5, FR10 | Must | Open / Agreed| 



## 4. Business rules

| ID | Rule | Condition | Applies to | Status |
|---|---|---|---|---|
| BR3 | If a change affects the price or date, the customer must agree to it before work carries on. | [when it applies, or "Not yet defined"] | UC06 | Draft|
|BR6 | The price on a quotation may change if the specification is revised or unusual materials are chosen. | | UC6| Draft|

## 5. Use cases

| ID | Use case | Primary actor | Summary | Core or optional | Gherkin file |
|---|---|---|---|---|---|
| UC6 | Record Change | Designer | Allows designer to change design version keeping the record of price, date, customer response, and having a link to both versions | Core | [Feature - Record Change](/features/record-change.feature) |

## 6. Gherkin scenarios

| Feature file | Use case | Covers | Status |
|---|---|---|---|
| [record-change.feature](../../features/record-change.feature) | UC6 | GH3: a change pauses work until the customer agrees. GH4: a rejected change keeps the previous approved version. | Draft (not yet checked against the feature file) |


## 7. Domain model

Source: [Source Code](/uc6-domain-model.puml)
<br>
Export: [Image](/UC06-Domain-Model.png)

| Concept | Responsibility | Classification |
|---|---|---|
|Order | Groups one or more order items for one customer order | Class
| OrderItem | One item in an order, with it's price, expected completion date and status | Class |
|Design Version | Keeps version of orderItem and can have changes made to it and receives approval|
|Change | Links the replaced and created versions, with the proposed version | Class |
|Approval |Records whether the customer approved a design version in full or in part, with the date and scope| Class |
|StaffMember | Records change, and customer approval | Class|
|Customer | Places Order and gives approval on design version | Class |




## 8. Consistency check before agreement

- [ ] Every requirement maps to at least one use case
- [ ] Every core use case has a Gherkin file
- [ ] Every business rule names the use case it applies to
- [ ] Every domain model concept is a class, attribute, actor or open design question
- [ ] One term is used for the work item throughout


**Written by:** Ahmad
<br>
**Agreed by:** Andrii, Ryan