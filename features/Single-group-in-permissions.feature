:wFeature: Single group in permissions

Scenario: Admin can see
  When I log in as a non-admin
  And I go to any random category
  Then I can't see the "Board" link at the top

Scenario: Other users can't see
  When I log in as a non-admin
  And I go to any random category
  Then I can't see the "Board" link at the top

Scenario: Visitors can't see
  When I log in as a non-admin
  And I go to any random category
  Then I can't see the "Board" link at the top


