Feature: Record a change to an approved design

  Scenario: A change to the price pauses work until the customer agrees
    Given order 1050 item 1 has approved design version 2
    And item 1 is quoted at €2,400
    And the expected completion date for item 1 is 20 November
    And the cutting stage for item 1 has started
    When the designer records a change that adds €350 and moves completion to 27 November
    Then design version 3 is created from design version 2
    And work on item 1 is paused until the customer responds

  Scenario: A rejected change keeps the previous approved version
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
