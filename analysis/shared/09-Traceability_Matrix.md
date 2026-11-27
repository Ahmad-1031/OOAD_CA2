# Traceability Matrix - UC6 Record Change

## 1. Purpose

This traceability matrix links the agreed requirements and business rules for UC6 - Record Change to the corresponding behavioural and object-oriented design artefacts.

It supports consistency verification across the product backlog, Gherkin scenarios, SSD, Operation Contracts, CRC cards, GRASP decisions, Design Class Diagram and Object Interaction Diagram.

### Related Artefacts
| Artefact | Reference |
|---|---|
| Revised Analysis Baseline | [Baseline](./03-Revised_analysis_baseline.md) |
| Detailed Use Case | [UC6 Record Change](./03a-UC6_Detailed_Use_Case.md) |
| Prioritised Implementation Catalogue | [Implementation Catalogue](./04-Prioritised_Implementation_Catalogue.md) |
| Gherkin Scenarios | [Record Change](../../features/record-change.feature) |
| Domain Model | [UC6 Domain Model](../../uc6-domain-model.puml) |
| System Sequence Diagram | [SSD Documentation](./05-System_Sequence_Diagrams.md), [PlantUML](../../ssd-uc6-record-change.puml) |
| Operation Contracts | [Operation Contracts](./06-Operation_Contracts.md) |
| CRC Cards | [CRC Cards](./07-CRC_Cards.md) |
| GRASP Decisions | [GRASP](./08-Grasp.md) |
| Design Class Diagram | [PlantUML](../../dcd-uc6-record-change.puml), [Diagram](../../dcd-uc6-record-change.png) |
| Object Interaction Diagram | [Interaction Documentation](./10-Object_Interaction_Diagrams.md), [PlantUML](../../sd-uc6-record-change.puml) |
| Design Structure and Interface | [Design Structure](./11-Design_Structure_and_Interfaces.md) |
| Package Diagram | [PlantUML](../../package-uc6-record-change.puml), [Diagram](../../package-uc6-record-change.png) |
| Decision Log | [Decision Records](../../docs/decisions/decisions_backlog.md) |

## 2. Use Case Traceability
| Use Case | Backlog | Requirements / Rules | Gherkin | SSD | Operation Contracts | CRC / GRASP | Object Interaction | Design Classes |
|---|---|---|---|---|---|---|---|---|
| [UC6-Record Change](./03a-UC6_Detailed_Use_Case.md) | US2, VS1-VS3 | FR4, FR5, FR7, NFR4, BR3, BR6, BR7 | GH3, GH4, GH6-GH14 (all four operations and all five refusal types covered; partial operation-level refusal coverage) | SSD-01 | OC-01 - OC-04 | CRC-06, DR-06 (awaiting peer review) | [SD-01 - SD-04](./10-Object_Interaction_Diagrams.md) - verification in progress | [DCD](../../dcd-uc6-record-change.puml) - verification in progress |

## 3. Operation-Level Traceability
| Contract | SSD Operation | Backlog | Requirements / Rules | Gherkin Coverage | Principal CRC Classes | GRASP Decisions | DCD / Interaction |
|---|---|---|---|---|---|---|---|
| OC-01 | findOrderItem() | VS1 | FR4 | GH13 | OrderRepository, Order, OrderItem, DesignVersion, RecordChangeCoordinator | IE-01 - IE-03, PF-01, CT-01 | [DCD](../../dcd-uc6-record-change.puml), [SD-01](./10-Object_Interaction_Diagrams.md#sd-01-findorderitem) - verification in progress |
| OC-02 | recordChange() | VS1 | FR4, FR7, NFR4, BR3, BR6, BR7 | GH3, GH7-GH11 | OrderRepository, Order, OrderItem, Change, DesignVersion, StaffMember, RecordChangeCoordinator, ChangeRepository | IE-01 - IE-03, IE-05, IE-06/07, IE-08, IE-13, IE-14, CR-01, CR-02, PF-01, PF-02, CT-01 | [DCD](../../dcd-uc6-record-change.puml), [SD-02](./10-Object_Interaction_Diagrams.md#sd-02-recordchange) - verification in progress |
| OC-03 | recordCustomerAgreement() | VS2 | FR4, FR5, FR7, NFR4, BR3 | GH6, GH12 | ChangeRepository, Change, Approval, StaffMember, Customer, DesignVersion, OrderItem, RecordChangeCoordinator, Order | IE-02 - IE-05, IE-06/07, IE-09 - IE-13, CR-03, PF-02, CT-01 | [DCD](../../dcd-uc6-record-change.puml), [SD-03](./10-Object_Interaction_Diagrams.md#sd-03-recordcustomeragreement) - verification in progress |
| OC-04 | recordCustomerRejection() | VS3 | FR4, FR7, NFR4, BR3 | GH4, GH14 | ChangeRepository, Change, DesignVersion, OrderItem, StaffMember, RecordChangeCoordinator | IE-02, IE-03, IE-05, IE-06/07, IE-11, IE-13, PF-02, CT-01 | [DCD](../../dcd-uc6-record-change.puml), [SD-04](./10-Object_Interaction_Diagrams.md#sd-04-recordcustomerrejection) - verification in progress |

LC-01, HC-01 and IP-01 support the overall UC6 design through separation of coordination, domain and persistence responsibilities.

The [Design Structure and Shared Interfaces](./11-Design_Structure_and_Interfaces.md) and [Package Diagram](../../package-uc6-record-change.puml) document the application, domain and persistence boundaries, supporting CT-01, PF-01, PF-02, LC-01, HC-01 and IP-01. Final cross-artefact consistency verification remains outstanding.

CRC and GRASP mapping reflect the current design proposals and remain subject to peer review and consistency verification.

## 4. Outstanding Consistency Checks
| ID | Related Artefacts | Outstanding Check | Status | 
|---|---|---|---|
| TC-01 | Baseline, OC-02, OQ-04 | Add the business rule restricting each OrderItem to one pending Change. | Resolved |
| TC-02 | Baseline | Correct the use case references for FR5 and NFR4 | Resolved |
| TC-03 | Gherkin , OC-03 | Customer agreement scenario covering full approval and updated price/date added in GH6 | Resolved |
| TC-04 | Gherkin, BR3, OQ-06 | Change without price or completion date impact covered in GH7 | Resolved |
| TC-05 | Detailed UC6, Gherkin, SSD-01, OC-01 - OC-04, SD-01 - SD-04, Design Structure | GH13 and GH14 provide direct coverage of OC-01 and the OC-04 refusal. All four operations and all five refusal types are covered. Explicit findOrderItem refusal scenarios, unknown changeNumber scenarios and comprehensive domain state preservation checks remain outstanding. Gherkin mappings in the Detailed Use Case and Design Structure require alignment with actual scenario coverage. | Partially resolved |
| TC-06 | CRC-06, OQ-04, OQ-07 | Assign responsibilities for missing order, missing item and existing pending change refusals. | Resolved |
| TC-07 | CRC-06, NFR4, OQ-05 | Include the responseRecordedBy association for customer agreement and rejection | Resolved |
| TC-08 | CRC-06, BR3, OQ-06 | Align pause resume responsibilities with the agreed conditional pause rules. | Resolved |
| TC-09 | CRC-06, DR-06 | Align controller responsibilities and scenario role-play with CT-01 | Resolved |
| TC-10 | CRC-06, Gherkin | Align the proposed completion date used in the scenario examples (29 November versus 27 November). | Resolved |
| TC-11 | Detailed UC6, DCD, CRC-06, DR-06, SD-01 - SD-04, OC-02, OC-03, OC-04 | itemPaused handling, refusal result conventions and original price/date impact identification have been aligned at design level. Previously missing CRC responsibilities have been assigned and corresponding GRASP decisions IE-09 to IE-14 have been documented. Conditional completion date updates in  the Detailed Use Case, CRC-06 and SD-03, UC6-only pause scope confirmation and CRC alignment, verification of the Detailed UC6 main success scenario, extensions and guarantees against the Operation Contracts, and final cross-artefact consistency verification remain outstanding. | In Progress |
| TC-12 | Detailed UC6, SSD-01, OC-01 - OC-04 | Use case preconditions have been aligned with the Operation Contracts. The identified Designer is the precondition, allowing missing order, missing item and no approved version refusals to be handled within UC6. Resolved in commit 42191ef. Remaining Gherkin and conditional behaviour consistency checks are tracked in TC-05 and TC-11 | Resolved |

The outstanding checks identify traceability and consistency gaps in the current artefacts. They do not constitute completed peer review or approval.

Agreed design decisions are documented in the [Decision Log](../../docs/decisions/decisions_backlog.md).
