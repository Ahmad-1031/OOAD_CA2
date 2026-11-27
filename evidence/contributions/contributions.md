# Contributions

Each member records the work assigned to them and the work they did, with commit references as evidence.

## Ahmad Shahzad

### Work assigned to

| Artefact | File |
| --- | --- |
|  |  |
| Scenario suitability assessment | [01-Suitability_Matrix.md](../../analysis/shared/01-Suitability_Matrix.md) |
| Revised analysis baseline | [03-Revised_analysis_baseline.md](../../analysis/shared/03-Revised_analysis_baseline.md) |
| CRC Cards and Scenario Role-Play (CRC-06) | [07-CRC_Cards.md](../../analysis/shared/07-CRC_Cards.md) |
| GRASP Design Rationale (DR-06) | [08-Grasp.md](../../analysis/shared/08-Grasp.md) |

### Work by stage

#### Scenario selection (01)

- Created the initial project file structure and shared artefact templates
- Added my CA1 scenario, Kerry Community Digital Archive, including its scenario profile and supporting domain model
- Assessed the suitability of all three proposed scenarios
- Participated in the selection of Scenario 17, Dingle Bay Furniture Workshop

Commits: 223a599, 550d54b, 731b346, 20a6b5f, 22159ba, 6419a5b

#### Reconciliation and revised analysis baseline (03)

- Prepared and maintained the revised analysis baseline for the selected scenario
- Consolidated the functional requirements, non-functional requirements, business rules and user stories
- Contributed to defining the agreed scope of UC6 Record Change
- Updated the decision log and documented agreed team decisions
- Updated the baseline to address identified consistency checks and maintain alignment with the operation contracts

Commits: 6419a5b, 986536d, 14d8187, eb9ae49, c08add4

#### Reviews

- Reviewed the operation contracts OC-01 to OC-04
- Reviewed the open design questions OQ-01 to OQ-07


Commits: 0df1949, c0502b0



#### Design (CRC Cards and GRASP)

- Created and maintained CRC-06 for UC6 Record Change
- Identified and assigned knowing and doing responsibilities to domain and software design classes
- Identified class collaborators and documented alternative responsibility assignments
- Prepared scenario role-plays for successful change recording and customer rejection
- Created and maintained DR-06, justifying responsibility assignments using GRASP principles
- Applied Information Expert, Creator, Controller, Low Coupling, High Cohesion, Pure Fabrication, Indirection and Protected Variations
- Incorporated peer feedback and updated CRC responsibilities and GRASP decisions to align with the operation contracts, DCD and object interaction diagrams
- Refined responsibility assignments for globally unique changeNumber allocation, Change registration, conditional pause and resume behaviour, staff accountability and operation outcomes
- Extended the Information Expert decisions with IE-09 to IE-14
- Updated the Creator, Controller, Low Coupling, High Cohesion, Pure Fabrication, Indirection and Protected Variations rationale to reflect the revised design
- Performed consistency checks across the CRC cards, GRASP decisions, DCD and object interaction diagrams

Commits: 2e5c1aa, 3648beb, c08add4, cc357f2, 1bfaa8e, adcf8c6
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
