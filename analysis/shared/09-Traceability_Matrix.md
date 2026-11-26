# Traceability Matrix - UC6 Record Change

## 1. Purpose

This traceability matrix links the agreed requirements and business rules for UC6 - Record Change to the corresponding behavioural and object-oriented design artefacts.

It supports consistency verification across the product backlog, Gherkin scenarios, SSD, Operation Contracts, CRC cards, GRASP decisions, Design Class Diagram and Object Interaction Diagram.

### Related Artefacts
| Artefact | Reference |
|---|---|
| Revised Analysis Baseline | [Baseline](./03-Revised_analysis_baseline.md) |
| Prioritised Implementation Catalogue | [Implementation Catalogue](./04-Prioritised_Implementation_Catalogue.md) |
| Gherkin Scenarios | [Record Change](../../features/record-change.feature) |
| Domain Model | [UC6 Domain Model](../../uc6-domain-model.puml) |
| System Sequence Diagram | [SSD Documentation](./05-System_Sequence_Diagrams.md), [PlantUML](../../ssd-uc6-record-change.puml) |
| Operation Contracts | [Operation Contracts](./06-Operation_Contracts.md) |
| CRC Cards | [CRC Cards](./07-CRC_Cards.md) |
| GRASP Decisions | [GRASP](./08-Grasp.md) |
| Design Class Diagram | Pending |
| Object Interaction Diagram | Pending |
| Decision Log | [Decision Records](../../docs/decisions/decisions_backlog.md) |

## 2. Use Case Traceability
| Use Case | Backlog | Requirements / Rules | Gherkin | SSD | Operation Contracts | CRC / GRASP | Object Interation | Design Classes |
|---|---|---|---|---|---|---|---|---|
| UC6 - Record Change | US2, VS1-VS3 | FR4, FR5, FR7, NFR4, BR3, BR6 | GH3, GH4 (partial coverage) | SSD-01 | OC-01 - OC-04 | CRC-06, DR-06 (awaiting peer weview) | Pending | Pending |

## 3. Operation-Level Traceability
| Contract | SSD Operation | Backlog | Requirements / Rules | Gherkin Coverage | Principal CRC Classes | DCD / Interaction | DCD / Interation |
|---|---|---|---|---|---|---|---|
| OC-01 | findOrderItem() | VS1 | FR4 | No explicit scenario | OrderRepository, Order, OrderItem, DesignVersion, RecordChangeCoordinator | IE-01 - IE-03, PF-01, CT-01 | Pending |
| OC-02 | recordChange() | VS1 | FR4, FR7, NFR4, BR3, BR6 | GH3 - Partial | OrderRepository, Order, OrderItem, Change, DesignVersion, StaffMember, RecordChangeCoordinator | IE-01 - IE-03, IE-05, IE-06/07, IE-08, CR-01, CR-02, PF-01, CT-01 | Pending |
| OC-03 | recordCustomerAgreement() | VS2 | FR5, FR7, NFR4, BR3, BR6 | GH3 - Agreement outcome not covered | ChangeRepository, Change, Approval, StaffMember, Customer, DesignVersion, OrderItem, RecordChangeCoordinator | IE-02 - IE-05, IE-06/07, CR-03, PF-02, CT-01 | Pending |
| OC-04 | recordCustomerRejection() | VS3 | FR4, FR7, NFR4, BR3 | GH4 - Partial | ChangeRepository, Change, DesignVersion, OrderItem, RecordChangeCoordinator | IE-02, IE-03, IE-05, IE-06/07, PF-02, CT-01 | Pending |

LC-01, HC-01 and IP-01 support the overall UC6 design through separation of coordination, domain and persistence responsibilities.

CRC and GRASP mapping reflect the current design proposals and remain subject to peer review and consistency verification.

## 4. Outstanding Consistency Checks
| ID | Related Artefacts | Outstanding Check | Status | 
|---|---|---|---|
| TC-01 | Baseline, OC-02, OQ-04 | Add the business rule restricting each OrderItem to one pending Change. | Open |
| TC-02 | Baseline | Correct the use case references for FR5 and NFR4 | Open |
| TC-03 | Gherkin , OC-03 | Add a customer agreement scenario covering full approval and updated price / date | Open |
| TC-04 | Gherkin, BR3, OQ-06 | Cover changes without price or completion date impact | Open |
| TC-05 | Gherkin, SSD-01, OC-01 - OC-04 | Cover the defined refusal outcomes and preservation of domain state. | Open |
| TC-06 | CRC-06, OQ-04, OQ-07 | Assign responsibilities for missing order, missing item and existing pending change refusals | Open |
| TC-07 | CRC-06, NFR4, OQ-05 | Include the rsponseRecordedBy association for customer agreement and rejection | Open |
| TC-08 | CRC-06, BR3, OQ-06 | Align pause resume responsibilities with the agreed conditional pause rules. | Open |
| TC-09 | CRC-06, DR-06 | Align controller responsibilities and scenario role-play with CT-01 | Open |
| TC-10 | CRC-06, Gherkin | Align the proposed completion date used in the scenario examples (29 November versus 27 November). | Open |
| TC-11 | DCD, Object Interaction | Verify design classes, operations and interaction message against OC-01 - OC-04 and Dr-06 | Pending |

The outstanding checks identify traceability and consistency gaps in the current artefacts. They do not constitute completed peer review or approval.

Agreed design decisions are documented in the [Decision Log](../../docs/decisions/decisions_backlog.md).
