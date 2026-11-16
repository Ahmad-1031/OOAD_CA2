## 04 - Prioritised Implementation Catalogue

**Target Use Case:** UC6 - Record Change

**Team decision:** Only UC6 will be developed in detail for CA2.

### 1. Target Use Case and Priorities

| Item | Priority | Business value | Implementation rationale |
|---|---|---|---|
| UC6 - Record Change | Must | Maintains a reliable history of design changes and their effects on price and completion date. | Main CA2 target; addresses FR7 and the problem of changes not being linked to approved design. |
| UC4 - Create Design Version | Supporting dependency | Preserves earlier designs when a change creates a new version. | Required behaviour within UC6, not a separate target use case (FR4). |
| UC5 - Record Approval | Supporting dependency | Ensures customer decisions are recorded against the relevant version. | Required behaviour within UC6, not a separate terget use case (FR5) |
| Materials and production coordination | Deferred | Helps identify effects on committed materials or ongoing work. | UC6 may flag an impact or request a pause; full material and production workflows are outside this catalogue`s scope. |

### 2. Independent vertical slices

All three slices belong to UC6. Each has its own input, business rule, stored result and observable output. Each can be tested independently using a prepared order/design fixture and fake persistence dependencies, without running another slice first.

| Slice | Priority | Input and behaviour | Observable outcome | Main dependencies |
|---|---|---|---|---|
| VS1 - Propose Change | Must | Designer records a proposed change against an approved design version, including price/date impact. | New proposed DesignVersion and linked Change are saved; previous approved version remains unchanged. | Existing OrderItem, approved DesignVersion, persistence interface. |
| VS2 - Accept Change | Must | Designer records the customer`s full acceptance of an existing proposal. | Approval is recorded; proposed version becomes approved and agreed price/date take effect. | Pre-seeded proposed change, approval record, persistence interface. |
| VS3 - Reject Change | Must | Designer records the customer`s rejection of an existing proposal. | Rejection is recorded; previous approved version and effective price/date remain unchanged. | Pre-seeded proposed change, approval/decision record, persistence interface. |

### 3. Dependencies, boundaries and retionale
- Core requirements: FR7 (change linked to the version it replaces, with price/date impact); FR4(retain design version history); FR5(record customer approval).
- Core domain concepts: OrderItem, DesignVersion, Change, Approval. DesignVersionand Change remain reparate classes.
- Design dependency: DesignVersionRepository is a proposed design-level interface, not a conceptual domain class. Other persistence interface can be agreed during design.
- Scope boundary: UC4 and UC5 supply only the behaviour needed by UC6. Full inventory, production scheduling, payment and production-release workflows are not reparate implementation targets.
- Unresolved rules: The evidence needed for customer approval, handling partial approval, and whether price/date changes must pause production require agreement.

