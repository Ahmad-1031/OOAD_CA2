Feature: Record a change to an approved design

  Scenario: GH3 - A change to the price pauses work until the customer agrees
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    And the cutting stage for item 1 has started
    When the designer records a change that adds €350 and moves completion to 27 November
    Then design version 3 is created from design version 2
    And work on item 1 is paused until the customer responds

  Scenario: GH4 - A rejected change keeps the previous approved version
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    And a change has created design version 3
    And work on item 1 is paused until the customer responds
    When the designer records that the customer rejected the change
    Then design version 2 is still the latest approved version
    And item 1 is still quoted at €2,400
    And the expected completion date for item 1 is still 20 November
    And work on item 1 is no longer paused

  Scenario: GH6 - An agreed change becomes the latest approved version
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    And a change that adds €350 and moves completion to 27 November has created design version 3
    And work on item 1 is paused until the customer responds
    When the designer records that the customer agreed to the change
    Then design version 3 is the latest approved version
    And design version 3 is fully approved
    And item 1 is quoted at €2,750
    And the expected completion date for item 1 is 27 November
    And work on item 1 is no longer paused

  Scenario: GH7 - A change that does not affect price or date does not pause work
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    When the designer records a change to the finish that does not affect the price or completion date
    Then design version 3 is created from design version 2
    And work on item 1 is not paused

  Scenario: GH8 - A second change while one is waiting is refused
    Given order 1050 item 1 has approved design version 2
    And a change has created design version 3
    And work on item 1 is paused until the customer responds
    When the designer records another change to item 1
    Then the change is refused because item 1 already has a change waiting for a response
    And no new design version is created

  Scenario: GH9 - A change to an order that does not exist is refused
    Given order 1099 does not exist
    When the designer records a change to order 1099 item 1
    Then the change is refused because the order cannot be found
    And no new design version is created

  Scenario: GH10 - A change to an item not in the order is refused
    Given order 1050 does not contain item 5
    When the designer records a change to order 1050 item 5
    Then the change is refused because the item cannot be found in the order
    And no new design version is created

  Scenario: GH11 - A change to an item with no approved design version is refused
    Given order 1050 item 2 has no approved design version
    When the designer records a change to order 1050 item 2
    Then the change is refused because item 2 has no approved design version
    And no new design version is created

  Scenario: GH12 - A response to an already answered change is refused
    Given order 1050 item 1 has approved design version 2
    And a change has created design version 3
    And the customer has rejected the change
    When the designer records that the customer agreed to the change
    Then the response is refused because the change has already been answered
    And design version 2 is still the latest approved version

  Scenario: GH13 - Finding an order item shows its current approved version
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    And the cutting stage for item 1 has started
    When the designer looks up order 1050 item 1
    Then design version 2 is shown as the latest approved version
    And the cutting stage is shown as started
    And item 1 is shown quoted at €2,400 with completion on 20 November

  Scenario: GH14 - A rejection of an already answered change is refused
    Given order 1050 item 1 has approved design version 2
    And a change has created design version 3
    And the customer has agreed to the change
    When the designer records that the customer rejected the change
    Then the response is refused because the change has already been answered
    And design version 3 is still the latest approved version
