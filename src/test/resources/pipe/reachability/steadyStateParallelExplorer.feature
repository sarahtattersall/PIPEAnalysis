Feature: state space exploration of tangible states only via a parallel implementation

  @tangibleOnly
  Scenario: Parsing a simple Petri net file
    Given I use the Petri net located at /simple.xml
    When I generate the exploration graph in parallel
    Then I expect to see 2 state transitions
    And I expect a record with state
    """
       {"P0" : { "Default" : 1 }, "P1" : { "Default" : 0 } }
    """
    And successor
    """
       {"P0" : { "Default" : 0 }, "P1" : { "Default" : 1 } }
    """
    And rate 1.0
    And I expect a record with state
    """
       {"P0" : { "Default" : 0 }, "P1" : { "Default" : 1 } }
    """
    And successor
    """
       {"P0" : { "Default" : 1 }, "P1" : { "Default" : 0 } }
    """
    And rate 1.0

  @tangibleOnly
  Scenario: Parsing a simple differently rated Petri net file
    Given I use the Petri net located at /simple_rated.xml
    When I generate the exploration graph in parallel
    Then I expect to see 2 state transitions
    And I expect a record with state
    """
       {"P0" : { "Default" : 1 }, "P1" : { "Default" : 0 } }
    """
    And successor
    """
       {"P0" : { "Default" : 0 }, "P1" : { "Default" : 1 } }
    """
    And rate 1.0
    And I expect a record with state
    """
       {"P0" : { "Default" : 0 }, "P1" : { "Default" : 1 } }
    """
    And successor
    """
       {"P0" : { "Default" : 1 }, "P1" : { "Default" : 0 } }
    """
    And rate 5.0


  @tangibleOnly
  Scenario: Parsing a simple vanishing Petri net file
    Given I use the Petri net located at /simple_vanishing.xml
    When I generate the exploration graph in parallel
    Then I expect to see 4 state transitions
    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 1 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And rate 3.75

    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 1 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And rate 3.0

    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 1 }, "8" : { "Default" : 0 }
       }
    """
    And rate 0.75

    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 1 }
       }
    """
    And rate 0.5


  @tangibleOnly
  Scenario: Parsing a cyclic vanishing Petri net file
    Given I use the Petri net located at /cyclic_vanishing.xml
    When I generate the exploration graph in parallel
    Then I expect to see 3 state transitions
    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 1 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And rate 1.8

    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 1 }, "8" : { "Default" : 0 }
       }
    """
    And rate 2.325

    And I expect a record with state
    """
       { "1" : { "Default" : 1 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 0 }
       }
    """
    And successor
    """
       { "1" : { "Default" : 0 }, "2" : { "Default" : 0 },
         "3" : { "Default" : 0 }, "4" : { "Default" : 0 },
         "5" : { "Default" : 0 }, "6" : { "Default" : 0 },
         "7" : { "Default" : 0 }, "8" : { "Default" : 1 }
       }
    """
    And rate 3.875


  @tangibleOnly
  Scenario: Parsing a timeless trap Petri net file
    Given I use the Petri net located at /timeless_trap.xml
    When I generate the exploration graph in parallel
    Then I expect to see 0 state transitions
    And have thrown a TimelessTrapException


  @tangibleOnly
  Scenario: Parsing all immediate transitions
    Given I use the Petri net located at /all_immediate.xml
    When I generate the exploration graph in parallel
    Then I expect to see 0 state transitions

  @tangibleOnly
  Scenario: Parsing simple coloured Petri net
    Given I use the Petri net located at /simple_color.xml
    When I generate the exploration graph in parallel
    Then I expect to see 2 state transitions
    And I expect a record with state
    """
       {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
      """
    And successor
    """
       {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
    """
    And rate 1.0
    And I expect a record with state
    """
       {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
    """
    And successor
    """
       {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
    """
    And rate 1.0

  @tangibleOnly
  Scenario: Parsing individual arc coloured Petri net
    Given I use the Petri net located at /complex_color.xml
    When I generate the exploration graph in parallel
    Then I expect to see 8 state transitions
    And I expect a record with state
    """
         {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
        """
    And successor
    """
         {"P0" : { "Default" : 0, "Red" : 1 }, "P1" : { "Default" : 1, "Red" : 0 } }
      """
    And rate 1.0

    And I expect a record with state
    """
         {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
        """
    And successor
    """
         {"P0" : { "Default" : 1, "Red" : 0 }, "P1" : { "Default" : 0, "Red" : 1 } }
      """
    And rate 1.0



    And I expect a record with state
    """
         {"P0" : { "Default" : 0, "Red" : 1 }, "P1" : { "Default" : 1, "Red" : 0 } }
        """
    And successor
    """
         {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
      """
    And rate 1.0


    And I expect a record with state
    """
         {"P0" : { "Default" : 1, "Red" : 0 }, "P1" : { "Default" : 0, "Red" : 1 } }
        """
    And successor
    """
         {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
      """
    And rate 1.0



    And I expect a record with state
    """
         {"P0" : { "Default" : 0, "Red" : 1 }, "P1" : { "Default" : 1, "Red" : 0 } }
        """
    And successor
    """
         {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
      """
    And rate 1.0


    And I expect a record with state
    """
         {"P0" : { "Default" : 1, "Red" : 0 }, "P1" : { "Default" : 0, "Red" : 1 } }
        """
    And successor
    """
         {"P0" : { "Default" : 1, "Red" : 1 }, "P1" : { "Default" : 0, "Red" : 0 } }
      """
    And rate 1.0



    And I expect a record with state
    """
         {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
        """
    And successor
    """
         {"P0" : { "Default" : 0, "Red" : 1 }, "P1" : { "Default" : 1, "Red" : 0 } }
      """
    And rate 1.0



    And I expect a record with state
    """
         {"P0" : { "Default" : 0, "Red" : 0 }, "P1" : { "Default" : 1, "Red" : 1 } }
        """
    And successor
    """
         {"P0" : { "Default" : 1, "Red" : 0 }, "P1" : { "Default" : 0, "Red" : 1 } }
      """
    And rate 1.0




