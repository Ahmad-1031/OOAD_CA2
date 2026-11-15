# Reconciliation and Expansion Record

## CA1 to CA2 Design Decisions

| CA1 Element | Group Decision | Rationale | Related Requirements | Status | 
|---|---|---|---|---|
| DesignVersion and Change | Keep as separate entities | DesignVersion represents design specifications, while Change records modifications and their impact on price and completion date. This supports traceability and preserves rejected changes. | FR4, FR7, UC6, GH4 | Agreed |
| Design version storage | Introduce DesignVersionRepository as an interface | Separates design version retrieval and persistence from the underlying storage technology and preserves version history. | FR4, UC4 | Agreed |
| Change and Approval | Clarify the difference between customer response and formal design approval | Change contains customerResponse, while Approval records approval of a DesignVersion. Their responsibilities need to be clearly distingushed. | FR5, FR7, UC5, UC6 | Open |
| Design version relationships | Review the relationship between OrderItem and DesignVersion | The model must clearly identify which design versions belong to an order item and how the approved version is determined. | FR4, FR5, UC4, UC5 | Open |

We decided to keep DesignVersion and Change as separate entities because they have different responsibilities. DesignVersion represents the design specifications at a particular point in time, while Change records the modifications between versions, including their impact on price and completion date. 

Keeping these entities separate provides clearer traceability and allows rejected changes to be recorded without affecting the previously approved design version. This also supports the Single Responsibility Principle by separating design information from change management.

We decided to introduce a DesignVersionRepository abstraction to store and retrieve all design versions independently of the underlying storage technology. This allows the system to preserve design history without depending on a specific storage implementation.

### DesignVersionRepository add to Design Class Diagram as an interface
- dont need to change Domain Model because DesignVersionRepository is a technical abstraction responsible for storing and retrieving objects. Conceptual Domain Model represents business concepts like DesignVersion, Change, Approval

### Design Impact
- DesignVersion and Change remain separate domain concepts.
- DesignVersionRepository will be represented as an interface in the CA2 Design Class Diagram.
- The repository is a design-level abstraction and does not need to be added to the CA1 Conceptual Domain Model.
- The implementation of the repository is outside the scope of the current design decisions.

--- 
### Proposed Core Use Cases
| Use Case | Description | Status |
|---|---|---|
| UC4 | Create Design Version | Proposed |
| UC6 | Record Change | Proposed |

These use cases are proposed because they focus on design version management and change traceability.

The final selection required group agreement.

### Deferred Analysis

Other CA1 use cases will remain part of the original analysis but may be deferred from detailed CA2 design, subject to the group`s final scope decision.

### Open Questions
- Shoul the group focus on UC4 and UC6?
- How will customer approval be represented when UC5 is not selected for detailed design?
- Which requirements and business rules must be retained to support the selected use cases?