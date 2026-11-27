# OOAD CA2 - Dingle Bay Furniture Workshop

## Product Goal

Give the designers and customers of Dingle Bay Furniture Workshop one reliable record of every design change, linked to the approved version it replaces and its effect on price and completion date, so that customers agree to price or date changes before more work is done and production only works from the latest approved design.

## Selected scenario and scope

- **Scenario:** CA1 Scenario 17, Furniture Manufacturing and Custom Order Service ([decision 0001](docs/decisions/decisions_list/0001_decision_Selected_Scenario.md))
- **Selected use case:** UC6 Record Change ([catalogue](analysis/shared/04-Prioritised_Implementation_Catalogue.md))

## Team

| Member | Main artefacts |
| --- | --- |
| Ahmad Shahzad | Revised analysis baseline, CRC cards, GRASP, decision log |
| Andrii Badieiev | Operation contracts, traceability matrix, decision 0005 |
| Ryan Lock | SSD, domain model, Gherkin, design class diagram, object interaction diagrams |

Full contributions: [evidence/contributions/contributions.md](evidence/contributions/contributions.md)

## Group Design Dossier

The group design dossier is organised into ten numbered artefacts, located in the `analysis/shared/` directory.

Artefacts 01 to 10 collectively form the repository-based technical design dossier and should be read in numerical order. They document the progression of the project from scenario selection and reconciliation through behavioural analysis, responsibility-driven design, traceability and detailed object interactions.



| No. | Stage | Artefact |
| --- | --- | --- |
| 01 | Scenario selection | [Suitability matrix](analysis/shared/01-Suitability_Matrix.md) |
| 02 | Reconciliation | [Reconciliation record](analysis/shared/02-Reconiliation-recored.md) |
| 03 | Baseline | [Revised analysis baseline](analysis/shared/03-Revised_analysis_baseline.md) |
| 04 | Scope and prioritisation | [Prioritised implementation catalogue](analysis/shared/04-Prioritised_Implementation_Catalogue.md) |
| 05 | System sequence diagrams | [System sequence diagrams](analysis/shared/05-System_Sequence_Diagrams.md) |
| 06 | Operation contracts | [Operation contracts](analysis/shared/06-Operation_Contracts.md) |
| 07 | Responsibility assignment | [CRC cards and scenario role-play](analysis/shared/07-CRC_Cards.md) |
| 08 | Design rationale | [GRASP design rationale](analysis/shared/08-Grasp.md) |
| 09 | Traceability | [Traceability matrix](analysis/shared/09-Traceability_Matrix.md) |
| 10 | Object interactions | [Object interaction diagrams](analysis/shared/10-Object_Interaction_Diagrams.md) |

<br>

## Where to find things

### Supporting design artefacts

| Artefact | File |
| --- | --- |
| UC6 domain model | [uc6-domain-model.puml](uc6-domain-model.puml) |
| Gherkin scenarios | [record-change.feature](features/record-change.feature) |
| System sequence diagram | [ssd-uc6-record-change.puml](ssd-uc6-record-change.puml) |
| Design class diagram | [dcd-uc6-record-change.puml](dcd-uc6-record-change.puml) |
| Object interaction diagrams | [sd-uc6-record-change.puml](sd-uc6-record-change.puml) |

### Project evidence

| Artefact | Description |
| --- | --- |
| [Individual contributions](evidence/contributions/contributions.md) | Individual responsibilities, completed work and supporting commit references. |
| [Decision log](docs/decisions/decisions_backlog.md) | Recorded group decisions, design rationale and agreed changes. |
| [AI usage log](evidence/ai/Ai_usage_log.md) | Recorded use of AI throughout the project. |


## Viewing diagrams

Each `.puml` file has a matching `.png` export in the repository root. Edit the `.puml` and re-export with PlantUML to update a diagram.
