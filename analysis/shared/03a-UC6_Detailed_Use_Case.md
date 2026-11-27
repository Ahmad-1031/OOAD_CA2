# 03a - UC6 Detailed Use Case

## UC6 Record Change

| Element | Description |
| --- | --- |
| Use case | UC6 Record Change |
| Scope | Workshop order system |
| Level | User goal |
| Primary actor | Designer |
| Stakeholders and interests | Customer (SH6), who wants to be told about any change to the price or date before more work is done. Designer (SH2), who needs each change linked to the version it replaces. Production worker, who should only work from the latest approved version. |
| Preconditions | The order item exists and has at least one fully approved design version. |
| Trigger | The customer asks for a change, or staff find that part of the design is not practical. |

### Main success scenario

1. The designer identifies the order item by order number and item number.
2. The system shows the latest approved design version, item status, price and expected completion date.
3. The designer enters the change: its description, the new design (dimensions, finish, drawings), the price change and the new completion date.
4. The system records the change with a unique change number, creates a new design version based on the latest approved version, and records who recorded the change and when.
5. The change affects the price or date, so the system pauses work on the item (BR3).
6. The system shows the change number, the new version number and that the item is paused.
7. The customer agrees to the change outside the system, and the designer records the agreement against the change number.
8. The system records a full approval of the new version from the customer, makes it the latest approved version, updates the price and date, records who recorded the response and when, and lifts the pause.

### Extensions

- 2a, 4a. The order does not exist. The system refuses with ORDER_NOT_FOUND and nothing is recorded.
- 2b, 4b. The item is not in the order. The system refuses with ORDER_ITEM_NOT_FOUND and nothing is recorded.
- 4c. The item has no approved design version. The system refuses with NO_APPROVED_VERSION and nothing is recorded.
- 4d. The item already has a change waiting for a response. The system refuses with PENDING_CHANGE_EXISTS and nothing is recorded (BR7).
- 5a. The change does not affect the price or date. The item is not paused, and the use case resumes at step 6.
- 7a. The customer does not agree to the change. The designer records the rejection against the change number. The previous version stays the latest approved version, the price and date do not change, the response and who recorded it are stored, the pause is lifted, and the use case ends.
- 7b. The change number is unknown or the change has already been answered. The system refuses with INVALID_CHANGE and nothing is modified.

| Element | Description |
| --- | --- |
| Minimal guarantee | The previous approved version stays in use, and the price and date do not change. |
| Success guarantee | There is one latest approved version, the change is linked to both versions with its effect on price and date, and the customer's response is recorded with who recorded it and when. |
| Special requirements | Every change, approval and response records who made it and when (NFR4). |
| Related | FR4, FR5, FR7, NFR4, BR3, BR6, BR7, SSD-01, OC-01 to OC-04, GH3 to GH14 |

### Links to scenarios and system operations

| Step or extension | System operation | Gherkin |
| --- | --- | --- |
| 1-2 | findOrderItem | GH13 |
| 3-6 | recordChange | GH3 |
| 2a, 4a | findOrderItem, recordChange | GH9 |
| 2b, 4b | findOrderItem, recordChange | GH10 |
| 4c | recordChange | GH11 |
| 4d | recordChange | GH8 |
| 5a | recordChange | GH7 |
| 7-8 | recordCustomerAgreement | GH6 |
| 7a | recordCustomerRejection | GH4 |
| 7b | recordCustomerAgreement, recordCustomerRejection | GH12, GH14 |

### Changes from CA1

| CA1 | CA2 | Reason |
| --- | --- | --- |
| 7a. Customer agrees to part of the change | Removed. Only full approval is recorded | OQ-02 |
| 5a. Committed materials flagged for the workshop manager | Removed | Materials are deferred (04) |
| 6a. Item not in production, nothing to pause | Removed. Pause depends only on price or date | OQ-06 |
| Open issues Q1 and Q2 | Resolved | OQ-02 |
| No refusals | Not found, no approved version, pending change and invalid change refusals added | OQ-04, OQ-07 |
| Response recorded by order and item | Recorded against a change number | OQ-01 |
