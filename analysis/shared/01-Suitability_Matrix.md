
# Scenario Suitability Matrix

## Team and scenarios

| Member | Scenario | CA1 analysis | Scenario profile |
|---|---|---|---|
| Ahmad Shahzad | 30: Digital Archive Contribution Service (Kerry Community Digital Archive) | [CA1](https://github.com/Ahmad-1031/OOAD_CA1) | [Profile](..\individual\shahzad\Scenario_Profile.md) |
| Andrii Badieiev | Kerry Kitchen Collective (small batch food production) | [CA1](../individual/[name]/[file-name].docx) | [Profile](../individual/[name]/scenario-profile.md) |
| Ryan Lock | CA1 Scenario 17 Furniture Manufacturing & Custom Order Service (Dingle Bay Furniture Workshop) | [CA1](https://github.com/rlock111/ca1-analysis/blob/main/report/report.md) | [Profile](../individual/lock/Scenario_Profile.md) |

## Scoring system

### Criteria definitions

| Criterion | What it measures | Evidence to look for | Question to ask |
|---|---|---|---|
| Scope | Whether the scenario is the right size for CA2 and CA3, with a clear core flow and boundary | In-scope and out-of-scope lists, a named core flow | Can we name the core flow, and is anything important excluded? |
| Behavioural richness | How much business behaviour the scenario contains | Rules with stated conditions, states, alternative flows, failure cases | How many rules have stated conditions, and how many states and failure cases are named? |
| OO potential | Whether the domain has entities with distinct responsibilities and relationships, not just data to store | Candidate classes with stated responsibilities and relationships | Can we name the classes, say what each one is responsible for, and say which others it works with? |
| Sliceability | Whether the scenario can be divided into independent vertical slices, each with a fallback | Candidate slices, each with a trigger, rules and an observable outcome | Can we name three slices that don't need each other to be finished? |
| Testability | Whether the rules can be checked through observable outcomes using fixtures and test doubles | Rules with expected outcomes, and the dependencies that would need faking | For each rule, what result would we observe, and what would we need to replace? |
| Comparability | Whether the scenario can be measured on the same counts as the other scenarios | Counts made using the agreed definitions | Can we give the same counts as every other profile, using the same definitions? |

Score each criterion from 1 to 5, using the anchors below. Agree these anchors as a group before anyone scores. Each score must cite evidence in the scenario's profile.

| Criterion | 1 | 3 | 5 |
|---|---|---|---|
| Scope | Too small or too large to build in CA2 and CA3 | Fits the time and team size, with some trimming | Fits cleanly, with a defined core flow and out-of-scope list |
| Behavioural richness | Few rules, no states | Several rules with conditions, some states | Many rules with conditions, states, alternatives and failure cases, all stated |
| OO potential | Mostly data handling | Several entities with clear responsibilities | Clear entities, responsibilities and relationships, with open design questions identified |
| Sliceability | No independent slices | Three slices, each with an input and outcome | Four or more independent vertical slices, each with a fallback |
| Testability | Outcomes not observable | Most rules observable with fixtures | All rules observable, with test doubles stated |
| Comparability | Counts cannot be made | Counts for most measures | All measures counted using the shared definitions |

**Gate:** a scenario is eligible for selection only if it scores at least 3 on both Sliceability and Testability. A scenario that fails the gate cannot be selected, however high its total.

**Ranking:** among eligible scenarios, rank by total score (out of 30). Record any tie in the decision record and resolve it by discussion.

## Scores

| Scorer | Scenarios scored |
|---|---|
| Ahmad Shahzad | Kerry Kitchen Collective, Dingle Bay Furniture Workshop |
| Andrii Badieiev | Kerry Community Digital Archive, Dingle Bay Furniture Workshop |
| Ryan Lock | Kerry Community Digital Archive, Kerry Kitchen Collective |



### Ahmad Shahzad

| Criterion | Kerry Kitchen Collective | Reason | Dingle Bay Furniture Workshop | Reason |
|:---:|:---:|:---|:---:|---|
| Scope | 5 | Explicit in-scope list (recipe management, Ingredient management, Customer order management, Production planning, Production batch recording etc) and out-of-scope list (Kitchen equipment control, Kitchen equipment control, Full financial accounting) | 5 | Well defined in scope (Enquiry management, Quotation management, History management etc) and clear out of scope list (CAD, Payroll accounting and Machine-control systems) |
| Behavioural richness | 3 | Good behavioural richness with 4 good identifiable business rules from scenario. However more business rules from the scenario are missed eg S3 L4, L5 and S5 L3 | 5 |Good behavioural richness with 6 identified business rules that are evidenced from the scenario and state confirmation check, and any unclear rules that need defining are stated |
| OO potential | 3  | The model gives strong OO potential as a base for design. Production Batch is a clear hub that can own the release and allocation responsibilities, and the explicit multiplicities show where collaboration will happen. The design will need a Packaged Unit class and named open questions, such as whether Substitution and Reservation are classes, before responsibilities can be assigned with confidence   | 5 | Strong OO Potential with 15 classes each having clear responsibilities and relationships as well as Staff and Customer classes that show each entity's role and interaction with the other classes |
| Sliceability | 3 | The use case diagram shows eight use cases, and at least three can be split into slices for the three members, such as Recipe Versions with Ingredient Information, and Quality Check. Most batch use cases depend on Production Batch, so each slice needs a fake for it to be tested on its own. The domain model should be revised to reduce that dependency before the slices can be called independent | 5 | Sufficient sciceability available with with 13 use cases and room for selecting which area of the system the team decides to build |
| Testability | 3 |Most rules have results we can check. For example, a batch can’t be released until its quality checks are done, and affected orders can be traced from an ingredient batch. Each can be tested with fake data. The coupling on Production Batch makes the tests harder to set up, but it doesn’t stop them | 5 | Most rules can be checked with a clear result e.g. the testing that an old version stays unhanged when a new one is saved and an item with only partial approval can't be released. Each can also be tested with fake data.  | 
| Comparability | 5 | The scenario analysis contains plenty of information to be comparable to other team members scenarios | 5 | Scenario analysis contains sufficient information to compare with other member's scenarios |
| **Total (out of 30)** | 22 | | |

### Andrii Badieiev

| Criterion | Kerry Community Digital Archive | Dingle Bay Furniture Workshop | Reason |
|---|:---:|:---:|---|
| Scope | | | |
| Behavioural richness | | | |
| OO potential | | | |
| Sliceability | | | |
| Testability | | | |
| Comparability | | | |
| **Total (out of 30)** | | | |

### Ryan Lock

| Criterion | Kerry Community Digital Archive | Reason | Kerry Kitchen Collective | Reason |
|:---:|:---:|:---|:---:|:---|
| Scope | 3 | In scope list by role (contributors, staff, coordinators, administrator, reviewer) and an out ofscope list (specialist systems, financial accounting, public website). No core flow is mentioned, and five roles is a lot to cover | | |
| Behavioural richness | 3 | There are four rules, request states named (paused, withdrawn, partially complete, awaiting action). The readiness criteria for allocation are not listed, so the main rule has no stated condition | | |
| OO potential | 4 | Domain model has 13 classes with named associations and multiplicities. Some attributes point at other classes (responsible : Staff, appliedBy : Staff), which would be better as associations. | | |
| Sliceability | 4 | Four slices (submit contribution, allocate request, process request, release stalled allocations), each with a trigger and an outcome. No fallbacks are stated | | |
| Testability | 3 | Outcomes are observable (rejected allocation, updated request history). Fixtures and test doubles are mentioned but not named | | |
| Comparability | 2 | The profile says the scenario has actors, use cases and candidate classes, but gives no counts for them. Some could be taken from the domain model (13 classes), the matrix asks for counts using shared definitions, none have been provided | | |
| **Total (out of 30)** | 19 | | | |

## Final averages

| Scenario | Final average |
|---|:---:|
| Kerry Kitchen Collective | |
| Kerry Community Digital Archive | |
| Dingle Bay Furniture Workshop | |



## Evaluation Notes

**Kerry Kitchen Collective**
- **Strengths:** clear business scope, rich business behaviour, strong OO potential
- **Limitations:** approval responsibilities for recipe versions and ingredient substitutions require clarification, mandatory quality checks and release conditions need further definition, batch allocation and traceability relationships may increase design complexity.
- **Key considerations for CA3:** 
    - identify independently buildable and testable vertical slices.
    - define clear interfaces between related system components
    - ensure each slice includes meaningful business logic and observable outcomes
    - use test fixtures or substitutes to avoid dependencies on other students` implementations

**Kerry Community Digital Archive**
- **Strengths:** Clear system boundary with in-scope and out-of-scope lists. Business rules with states (paused, withdrawn, partially complete, awaiting action). Candidate classes with stated relationships
- **Limitations:** Priority, capacity and stalled-request rules have no stated conditions. Readiness criteria is not listed for contributions. Exceptions and Operational changes may be events attributes or events rather than classes
- **Key considerations for CA3:** 
    - Agree the Contribution contract before CA3, since it is the main coupling point between slices
    - Use an in-memory store and fixed clock for the allocation and stalled-request slices
    - Each slice should be buildable and testable on its own, using test fixtures and test doubles in place of other slices' implementations.

**Dingle Bay Furniture Workshop**
- **Strengths:** In scope and out of scope lists are taken from the scenario, business rules with stated conditions, a 15-class domain model, five Gherkin scenarios already written.
- **Limitations:** 13 use cases and six actors are too many to be covered by three members. I recommend the designer's use cases (UC1-6) to be considered for CA2.
-  What counts as enough approval for a design version is not confirmed by the scenario (A1).
- **Key considerations for CA3:** 
    - The designer's use cases (UC1-6) form one flow from enquiry to an approved design and deal with the main problem, so they are the suggested focus.
    - Each slice needs its own fixtures, such as an item with an approved design version for record change.
    - Replace the accounting system with a fake and use a fixed clock for dates.
  
### Scenario Selection Rationale

One of the key reasons for selecting Kerry Kitchen Collectve was its rich business behaviour. The scenario involves meanful business rules and interactions between objects, rather than simply a large number of classes. This makes it particularly suitable for System Sequence Diagrams (SSDs), Operation Contracts, CRC Cards, and the application of GRASP principles.

### Group Decision
- Selected scenario: 
- Decision date:
- Participants:
- Decision process:
