# Scenario
## 17 - Furniture Manufacturing and Custom Order Service
https://github.com/rlock111/ca1-analysis

[CA1 Scenario 17 specification](https://github.com/Ahmad-1031/OOAD_CA2/blob/main/analysis/individual/lock/SAAD71000_CA1_Scenario_17_Furniture_Manufacturing_and_Custom_Order_Service.docx)

## Description:
Dingle Bay Furniture Workshop produces standard furniture and accepts custom commissions from households, cafés, offices and community organisations. Enquiries, quotations, design versions and production updates are spread across emails, folders, spreadsheets and a whiteboard, so staff cannot always tell which design was approved, which materials are committed or when an order will be finished.

The proposed workshop order system keeps one record of each order from enquiry to delivery, showing the approved design, committed materials and the stage of each item.

## Scope

**In Scope:**

**Designers** can record enquiries, quotations, orders, design versions, approvals and changes. The **workshop manager** can commit materials, release items to production and review progress. **Production workers** can record production stages and quality checks, **finishers** can record curing, and the **delivery coordinator** can plan full and partial deliveries.

**Out of Scope:**

Detailed CAD, payroll, accounting and machine control, as stated in the scenario. Buying materials and taking payments are also left out.

## Analysis Decisions

- Customers are offstage, as staff record everything on their behalf
- CAD software is a dependency, not an actor
- Design is merged into DesignVersion, as a design always means a particular version
- Production only starts once the full design is approved (A1)

## Behaviour
The main business rules are:

- An item is only released to production with full design approval and a deposit (BR1-2)
- A change to the price or date pauses work until the customer agrees (BR3)
- Committed material is not free for another order (FR8)
- An item cannot be delivered until it has finished curing (BR4)

## OO Potential
The CA1 domain model has 15 classes. A customer makes an enquiry, which is answered by quotations, and an accepted quotation becomes an order containing items. Each item has numbered design versions, which receive approvals and are linked by changes. Items also use materials, go through production stages, are quality checked and are delivered.

## Sliceability

The system can be divided into vertical slices, each ending in an observable outcome:

- **Record change** - a change is recorded with its effect on price and date. **Outcome:** a new design version, with the item paused until the customer responds
- **Release to production** - needs full approval and a deposit. **Outcome:** accepted, or rejected with a reason
- **Commit materials** - material is committed to an item. **Outcome:** the free quantity is reduced
- **Plan delivery** - finished items are added to a delivery. **Outcome:** a full or partial delivery, with curing items left out

## Testability
Each rule has an observable outcome, such as a rejected release or a partial delivery. These can be checked with fixtures and test doubles, such as a fake accounting system and a fixed clock for curing dates. CA1 already has five Gherkin scenarios.

## Comparability
The scenario can be counted on the same measures as the other profiles:

| Actors | Use cases | Functional requirements | Business rules | Gherkin scenarios | Domain classes |
| ------ | --------- | ----------------------- | -------------- | ----------------- | -------------- |
| 6      | 13        | 14                      | 6              | 5                 | 15             |

---

The CA1 domain model shows these concepts and their relationships.

![Diagram](https://github.com/rlock111/ca1-analysis/blob/main/diagrams/domain-model.png?raw=true)
