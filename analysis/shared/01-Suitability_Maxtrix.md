
# Scenario Suitability Matrix

## Team and scenarios

| Member | Scenario | CA1 analysis | Scenario profile |
|---|---|---|---|
| Ahmad Shahzad | 30: Digital Archive Contribution Service (Kerry Community Digital Archive) | [CA1](https://github.com/Ahmad-1031/OOAD_CA1) | [Profile](..\individual\shahzad\Scenario_Profile.md) |
| Andrii Badieiev | Kerry Kitchen Collective (small batch food production) | [CA1](../individual/[name]/[file-name].docx) | [Profile](../individual/[name]/scenario-profile.md) |
| Ryan Lock | CA1 Scenario 17 Furniture Manufacturing & Custom Order Service (Dingle Bay Furniture Workshop) | [CA1](https://github.com/rlock111/ca1-analysis/blob/main/report/report.md) | [Profile](../individual/[name]/scenario-profile.md) |

## Scoring system

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

| Criteria | Kerry Kitchen Collective | Digital Archive Contribution Service | [Scenario C] |
|---|:---:|:---:|:---:|
| Scope | | | |
| Behavioural richness | | | |
| OO potential | | | |
| Sliceability | | | |
| Testability | | | |
| Comparability | | | |
| **Total (out of 30)** | | | |
| **Gate passed (Sliceability ≥ 3 and Testability ≥ 3)** | | | |
| **Rank among eligible scenarios** | | | |

### Evaluation Notes

**Kerry Kitchen Collective**
- **Strengths:** clear business scope, rich business behaviour, strong OO potential
- **Limitations:** approval responsibilities for recipe versions and ingredient substitutions require clarification, mandatory quality checks and release conditions need further definition, batch allocation and traceability relationships may increase design complexity.
- **Key considerations for CA3:** 
    - identify independently buildable and testable vertical slices.
    - define clear interfaces between related system components
    - ensure each slice includes meaningful business logic and observable outcomes
    - use test fixtures or substitutes to avoid dependencies on other students` implementations

**Scenario B**
- **Strengths:**
- **Limitations:**
- **Key considerations for CA3:** 

**Scenario C**
- **Strengths:**
- **Limitations:**
- **Key considerations for CA3:** 

### Scenario Selection Rationale

One of the key reasons for selecting Kerry Kitchen Collectve was its rich business behaviour. The scenario involves meanful business rules and interactions between objects, rather than simply a large number of classes. This makes it particularly suitable for System Sequence Diagrams (SSDs), Operation Contracts, CRC Cards, and the application of GRASP principles.

### Group Decision
- Selected scenario: 
- Decision date:
- Participants:
- Decision process:
