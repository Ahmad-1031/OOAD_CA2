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

## Design artefacts

| Stage | Artefact |
| --- | --- |
| Scenario selection | [01 Suitability matrix](analysis/shared/01-Suitability_Matrix.md) |
| Reconciliation | [02 Reconciliation record](analysis/shared/02-Reconiliation-recored.md) |
| Baseline | [03 Revised analysis baseline](analysis/shared/03-Revised_analysis_baseline.md) |
| Scope | [04 Prioritised implementation catalogue](analysis/shared/04-Prioritised_Implementation_Catalogue.md) |
| Domain model | [uc6-domain-model.puml](uc6-domain-model.puml) |
| Gherkin | [record-change.feature](features/record-change.feature) |
| System sequence diagram | [05 SSD](analysis/shared/05-System_Sequence_Diagrams.md), [ssd-uc6-record-change.puml](ssd-uc6-record-change.puml) |
| Operation contracts | [06 Operation contracts](analysis/shared/06-Operation_Contracts.md) |
| CRC cards | [07 CRC cards](analysis/shared/07-CRC_Cards.md) |
| GRASP | [08 GRASP](analysis/shared/08-Grasp.md) |
| Traceability | [09 Traceability matrix](analysis/shared/09-Traceability_Matrix.md) |
| Design class diagram | [dcd-uc6-record-change.puml](dcd-uc6-record-change.puml) |
| Object interaction | [10 Object interaction diagrams](analysis/shared/10-Object_Interaction_Diagrams.md), [sd-uc6-record-change.puml](sd-uc6-record-change.puml) |

## Decisions and evidence

- [Decision log](docs/decisions/decisions_backlog.md)
- [AI usage log](evidence/ai/Ai_usage_log.md)
- [Contributions](evidence/contributions/contributions.md)

## Viewing diagrams

Each `.puml` file has a matching `.png` export in the repository root. Edit the `.puml` and re-export with PlantUML to update a diagram.
