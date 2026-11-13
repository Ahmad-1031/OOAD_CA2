>[!Note]
>**Purpose:** Select one user story and the use cases that relate to them. select stakeholders, requirements, business rules that relate to those use cases

## 1. Scope

**In scope:** [core flows, with the INS IDs they map to]

**Out of scope:** [list, with a reason where it isn't obvious]


## 2. Stakeholders

| ID | Stakeholder | Goal | Use cases |
|---|---|---|---|
| SKH1 | [name] | [goal] | UC01, UC03 |

## 3. Requirements

| ID | Requirement | Priority | Source | Use case | Status |
|---|---|---|---|---|---|
| FR01 | [requirement text] | Must / Should / Could | [SKH, INS] | UC01 | Agreed |

Every requirement maps to at least one use case. A requirement with no in-scope use case is marked Deferred, with a decision record.

## 4. Business rules

| ID | Rule | Condition | Applies to | Status |
|---|---|---|---|---|
| BR01 | [rule] | [when it applies, or "Not yet defined"] | UC02 | Agreed / Open |

## 5. Use cases

| ID | Use case | Primary actor | Summary | Core or optional | Gherkin file |
|---|---|---|---|---|---|
| UC01 | [name] | [actor] | [one sentence] | Core | features/uc01-[name].feature |

Each core use case has a full description (preconditions, main flow, alternatives, failures) in [location], plus a Gherkin file.

## 6. Gherkin scenarios

| Feature file | Use case | Covers | Status |
|---|---|---|---|
| features/[file].feature | UC01 | Success, rejection, boundary | Draft / Agreed |

## 7. Domain model

Source: [models/domain/domain-model.puml]
Export: [models/domain/domain-model.png]

| Concept | Responsibility | Classification |
|---|---|---|
| [Concept] | [one line] | Class / Attribute / Actor / Open question |

**Open design questions:** [e.g. whether Exception is a class or an attribute]

## 8. Consistency check before agreement

- [ ] Every requirement maps to at least one use case
- [ ] Every core use case has a Gherkin file
- [ ] Every business rule names the use case it applies to
- [ ] Every domain model concept is a class, attribute, actor or open design question
- [ ] One term is used for the work item throughout
- [ ] Every element marked Open is linked to a backlog item
- [ ] IDs are unique and match docs/traceability.md