# CA2 Design Dossier - Dingle Bay Furniture Workshop

**Group:** Ahmad Shahzad, Andrii Badieiev, Ryan Lock
**Selected use case:** UC6 Record Change

> Target length: 3,000-4,000 words, excluding diagrams, tables, references and appendices.
> Explain and justify the design. Link to repository files rather than copying them.
> Remove the guidance notes (lines starting with `>`) before submission.

---

## 1. Product Goal and selected design scope

> Owner: Group | Target: ~250 words | Rubric: Product Backlog, selected design scope and traceability (10%)
> - State the Product Goal (same wording as the README).
> - Explain why UC6 was selected: value, requirements and rules it covers, dependencies (UC4, UC5) and what is deferred.
> - Links: [README](../../README.md), [04 Catalogue](../../analysis/shared/04-Prioritised_Implementation_Catalogue.md)

### 1.1 Product Goal

### 1.2 Selected use case and reason

---

## 2. Scenario selection and agreed baseline

> Owner: Andrii / Ahmad | Target: ~500 words (2-4 pages including tables) | Rubric: Scenario selection and agreed design baseline (10%)
> - Short comparison of the three scenarios and why Scenario 17 was selected.
> - Lecturer approval and any expansion items.
> - Only the corrections and additions made to CA1, not the full CA1 analysis.
> - Links: [01 Suitability matrix](../../analysis/shared/01-Suitability_Matrix.md), [02 Reconciliation](../../analysis/shared/02-Reconiliation-recored.md), [03 Baseline](../../analysis/shared/03-Revised_analysis_baseline.md), decisions [0001](../decisions/decisions_list/0001_decision_Selected_Scenario.md) to [0003](../decisions/decisions_list/0003_decision_Agreed_Baseline.md)

### 2.1 Scenario comparison and selection

### 2.2 Baseline changes from CA1

---

## 3. Product Backlog and traceability

> Owner: Andrii | Target: ~300 words | Rubric: Product Backlog, selected design scope and traceability (10%)
> - How the backlog was ordered (value, risk, dependency) and how items link to the design.
> - How the traceability matrix connects backlog, requirements, rules, Gherkin, SSD, contracts, CRC/GRASP, interactions and DCD.
> - Links: Trello board, [09 Traceability matrix](../../analysis/shared/09-Traceability_Matrix.md)

### 3.1 Product Backlog

### 3.2 Traceability

---

## 4. Behavioural design

> Owner: Ryan / Andrii | Target: ~700 words | Rubric: Behavioural design (20%)
> - Detailed use case: main success scenario, alternatives and refusals.
> - Gherkin: which scenarios cover success, alternative, refusal and boundary behaviour.
> - SSD: system events, returns and why recordChange takes the change and new version as one event.
> - Operation contracts: preconditions, postconditions and controlled failures. Highlight one important contract.
> - Decision 0005 and how OQ-01 to OQ-07 changed the behaviour.
> - Links: [record-change.feature](../../features/record-change.feature), [05 SSD](../../analysis/shared/05-System_Sequence_Diagrams.md), [06 Contracts](../../analysis/shared/06-Operation_Contracts.md), [0005](../decisions/decisions_list/0005_decision_UC6_Operation_Contracts.md)

### 4.1 Detailed use case

### 4.2 Gherkin scenarios

### 4.3 System sequence diagram

### 4.4 Operation contracts

---

## 5. Responsibilities and design class model

> Owner: Ahmad / Ryan | Target: ~800 words | Rubric: Responsibilities and design class model (25%)
> - CRC cards: knowing, doing and collaborators for the main classes.
> - At least four GRASP decisions, each with candidates, decision, principle, rejected alternative and consequence.
> - Controller choice (RecordChangeCoordinator) and why it is not a God controller.
> - DCD: how it was built from the CRC cards and GRASP, and the methods added while drawing the sequence diagrams.
> - Links: [07 CRC](../../analysis/shared/07-CRC_Cards.md), [08 GRASP](../../analysis/shared/08-Grasp.md), [DCD](../../dcd-uc6-record-change.puml), [uc6-domain-model.puml](../../uc6-domain-model.puml)

### 5.1 CRC cards

### 5.2 GRASP decisions

### 5.3 Design class diagram

---

## 6. Object interactions and model consistency

> Owner: Ryan | Target: ~600 words | Rubric: Object interactions and model consistency (20%)
> - SD-01 to SD-04: what each shows and how it follows the contract.
> - How sequence messages map to DCD operations (one worked example).
> - Refusals happen before any object is created or changed.
> - Pause and resume, itemPaused in responses, price or date impact.
> - Consistency check across SSD, contracts, CRC, DCD and Gherkin.
> - Links: [10 Object interaction](../../analysis/shared/10-Object_Interaction_Diagrams.md), [sd-uc6-record-change.puml](../../sd-uc6-record-change.puml)

### 6.1 Sequence diagrams

### 6.2 Messages to operations

### 6.3 Consistency

---

## 7. Design structure and evaluation

> Owner: Ryan / Group | Target: ~450 words | Rubric: Design structure, evaluation and rationale (5%)
> - Package/layer view: application, domain, persistence.
> - Shared interfaces, result types and the refusal convention.
> - Evaluation: cohesion, coupling, controller, object validity, assumptions, risks, rejected alternatives and limitations (e.g. pauses outside UC6 out of scope, single use case).
> - Links: package view and interface catalogue (11)

### 7.1 Package structure and shared interfaces

### 7.2 Design evaluation

### 7.3 Assumptions, risks and limitations

---

## 8. Process, review and AI use

> Owner: Group | Target: ~400 words | Rubric: Process, review and individual evidence (10%)
> - How the work was planned and tracked on the board, Definition of Done, iteration goals.
> - How reviews were done and recorded (feedback, review points, decisions).
> - Decision log summary.
> - AI use: tools, affected artefacts, how AI suggestions were checked and approved.
> - Retrospective summary.
> - Links: [Decision log](../decisions/decisions_backlog.md), [AI usage log](../../evidence/ai/Ai_usage_log.md), [Contributions](../../evidence/contributions/contributions.md), docs/reflection

### 8.1 Planning and Definition of Done

### 8.2 Peer review and decisions

### 8.3 AI use

### 8.4 Retrospective

---

## 9. Conclusion

> Owner: Group | Target: ~100 words
> - How the design meets the Product Goal and what would come next.

---

## Appendices

### A. Word count by section

| Section | Target | Actual |
| --- | --- | --- |
| 1. Product Goal and scope | 250 | |
| 2. Scenario selection and baseline | 500 | |
| 3. Product Backlog and traceability | 300 | |
| 4. Behavioural design | 700 | |
| 5. Responsibilities and DCD | 800 | |
| 6. Object interactions | 600 | |
| 7. Structure and evaluation | 450 | |
| 8. Process, review and AI | 400 | |
| 9. Conclusion | 100 | |
| **Total** | **4,100** | |

### B. Walkthrough preparation

Each member should be able to explain:

- the Product Goal and selected design scope
- how UC6 relates to the Product Backlog
- UC6 and its system events
- an important operation contract
- at least one CRC or GRASP decision
- part of an object-interaction sequence
- how sequence messages map to design-class operations
- one rejected alternative, risk or limitation
- their own contribution
- how AI-supported content was checked and revised
