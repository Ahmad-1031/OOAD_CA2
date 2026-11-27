# Contributions

Each member records the work assigned to them and the work they did, with commit references as evidence.

## Ahmad Shahzad

### Work assigned to

| Artefact | File |
| --- | --- |
|  |  |

### Work by stage

## Andrii Badieiev

### Work assigned to

| Artefact | File |
| --- | --- |
| Scenario suitability assessment | [01-Suitability_Matrix.md](../../analysis/shared/01-Suitability_Matrix.md) |
| Reconciliation record | [02-Reconiliation-recored.md](../../analysis/shared/02-Reconiliation-recored.md) |
| Prioritised implementation catalogue | [04-Prioritised_Implementation_Catalogue.md](../../analysis/shared/04-Prioritised_Implementation_Catalogue.md) |
| Operation Contracts OC-01 to OC-04 | [06-Operation_Contracts.md](../../analysis/shared/06-Operation_Contracts.md) |
| UC6 design decisions OQ-01 to OQ-07 | [0005_decision_UC6_Operation_Contracts.md](../../docs/decisions/decisions_list/0005_decision_UC6_Operation_Contracts.md) |
| Traceability Matrix | [09-Traceability_Matrix.md](../../analysis/shared/09-Traceability_Matrix.md) |

### Work by stage

**Scenario selection (01)**
- Added my CA1 scenario, Kerry Kitchen Collective, and its supporting analysis artefacts
- Assessed the suitability of the other proposed scenarios
- Participated in the selection of Scenario 17, Dingle Bay Furniture Workshop

**Reconciliation and prioritisation (02, 04)**
- Prepared the reconciliation record and proposed changes to the selected scenario
- Contributed to the reconciliation of the analysis baseline
- Prepared the prioritised implementation catalogue
- Defined the proposed implementation scope and vertical slices VS1 to VS3 for UC6 Record Change
- Documented the reconciliation and prioritisation decisions in decision records 0002 and 0004

**Analysis (Operation Contracts)**
- Prepared and maintained the four operation contracts OC-01 to OC-04
- Defined preconditions, postconditions and refusal outcomes for the selected system operations
- Identified and documented 7 open design questions
- Incorporated team feedback and agreed design decisions into the operation contracts
- Updated the contracts to reflect BR7, conditional pause and resume behaviour, staff accountability and optional completion date handling.

Commits: 8eb2e15, 750faa0, edf0c22, 7d081b8, e22a8b6, c022f22, ae73c2e

**Design consistency and traceability**
- Created and maintained UC6 Traceability Matrix
- Mapped requirements, business rules, backlog items, Gherkin scenarios, SSD, operation contracts, CRC cards and GRASP decisions
- Documented consistency checks TC-01 to TC-11 and tracked their resolution as the design evolved.

Commits: 8b0834b, 82a45bf, cca5f86, e2ea8b6, 59485dd, c022f22, ae73c2e

## Ryan Lock

### Work assigned to

| Artefact | File |
| --- | --- |
| SSD-01 UC6 Record Change | [ssd-uc6-record-change.puml](../../ssd-uc6-record-change.puml) |
| SSD write-up | [05-System_Sequence_Diagrams.md](../../analysis/shared/05-System_Sequence_Diagrams.md) |
| UC6 domain model | [uc6-domain-model.puml](../../uc6-domain-model.puml) |
| Gherkin scenarios GH3 to GH14 | [record-change.feature](../../features/record-change.feature) |
| Design Class Diagram | [dcd-uc6-record-change.puml](../../dcd-uc6-record-change.puml) |
| Object interaction diagrams SD-01 to SD-04 | [sd-uc6-record-change.puml](../../sd-uc6-record-change.puml) |
| Object interaction write-up | [10-Object_Interaction_Diagrams.md](../../analysis/shared/10-Object_Interaction_Diagrams.md) |

### Work by stage

#### Scenario selection (01)

- Added my CA1 scenario (Scenario 17, Dingle Bay Furniture Workshop), its profile and specification
- Rated Ahmad's scenario (Kerry Community Digital Archive) and Andrii's scenario (Kerry Kitchen Collective) in the suitability matrix

Commits: 6daf560, bd49eb8, 2ef5891, 4ed7f02, 6efff69, 9650ab9, 0978ef8, 9dfaffd

#### Analysis (SSD, domain model, Gherkin)

- Created and maintained SSD-01 and its write-up (05)
- Created and maintained the UC6 domain model
- Wrote the Gherkin scenarios GH3 to GH12
- Updated the SSD, domain model and Gherkin for OQ-01 to OQ-07 (decision 0005)

Commits: 23b5351, 7b5ecef, 631aa82, e01c7bb, 89250e8, 8cffb47, 945bce7, b0df68b, e9e7c0c, 792ac16, 2756f14

#### Reviews

- Reviewed the operation contracts
- Reviewed the CRC cards against the domain model and SSD

Commits: a4d234e, 054f256

#### Design (DCD, object interaction)

- Created and maintained the DCD in line with the CRC cards and GRASP decisions
- Created the object interaction diagrams SD-01 to SD-04 and their write-up (10)
- Updated the DCD, sequence diagrams and Gherkin after design review, adding GH13 and GH14

Commits: 4aaefb1, 6b013e3, 436671d, 3dfcded, 53bb1d6, 1271d1e
