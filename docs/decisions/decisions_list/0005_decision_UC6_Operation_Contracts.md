## 0005: Agreed UC6 Design Decisions

### Context

Seven open design questions were identified during the development of the Operation Contracts for UC6 - Record Change.

### Decision

| ID | Agreed Decision |
|---|---|
| OQ-01 | Globally unique changeNumber |
| OQ-02 | Full approval when the original version was fully approved and the customer agrees to the complete revised design |
| OQ-03 | Separate production status and isPaused attribute |
| OQ-04 | Only one pending Change per OrderItem |
| OQ-05 | Separate recordedBy and responseRecordedBy associations |
| OQ-06 | Pause work only when the change affects the price or expected completion date. | 
| OQ-07 | Separate PRDER_NOT_FOUND and ORDER_ITEM_NOT_FOUND refusal outcomes. |

### Options considered
- Allow multiple pending changes or restrict each OrderItem to one pending Change.
- Pause work for every change or retain the conditional pause defined by BR3.

### Rationale

The agreed decisions improve consistency, accountability and clarity of system behaviour while preserving the design history.

OQ-04 was accepted sunject to updating the affected artefacts. OA-06 was revised following Ryan's feedback to preserve BR3.

All seven decisions have been incorporated into the Operation Contracts. Cross-artefact consistency verification remains pending.

Detailed decisions and team feedback: [Operation Contracts](../../../analysis/shared/06-Operation_Contracts.md)

## Sign-off
- Andrii, Ryan, Ahmad - agreed