
| CA1 Element | Group Decision | Rationale |
|---|---|---|
| DesignVersion and Change | Keep as separate entities | They have different responsibilities. |
| Design version storage | Introduce DesignVersionRepository | Store and retrieve all design versions |

We decided to keep DesignVersion and Change as separate entities because they have different responsibilities. DesignVersion represents the design specifications at a particular point in time, while Change records the modifications between versions, including their impact on price and completion date. 

Keeping these entities separate provides clearer traceability and allows rejected changes to be recorded without affecting the previously approved design version. This also supports the Single Responsibility Principle by separating design information from change management.

We decided to inroduce a DesignVersionRepository abstraction to store and retrieve all design versions independently of the underlying storage technology. This allows the system to preserve design history without depending on a specific storage implementation.

---
## our discussions / will not be included in the final report
### Why we shoul keep DesignVersion and Change as separate entities
- defferent responsibilities. DesignVersion stores the design specifications as a particular point in time, including dimensions, materials, finishes. Change records what has been modified and how those modifications affect the price and completion date.
- change history and traceability. Keeping Change as a separate entity allows us to track transitions between design versions and understand the reasons behind each modification.
- rejected changes. If customer rejects proposed change, previously approved design  version remains valid. At the same time, information about the rejected change can be still presented.
- Single Responsibility Principle. 

### DesignVersionRepository add to Design Class Diagram as an interface
- dont need to change Domain Model because DesignVersionRepository is a technical abstraction responsible for storing and retrieving objects. Conceptual Domain Model represents business concepts like DesignVersion, Change, Approval