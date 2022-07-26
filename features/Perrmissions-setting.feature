Feature: Perrmissions setting

Scenario: Default behavior
  Given there are no group names in the "display user groups" theme settings
  And there are no other settings than the defaults
  When I'm loggged in as any user visitor
  And I go to any random category
  Then I can see the "Board" link at top
 
Scenario: Admin - Show settings option
  Given I'm logged in as Admin
  When I go to the "Ordered Kanban Board Theme" settings
  Then I can see the "display user groups" settting section

Scenario: Admin - Edit & Save settings
  Given the "display user groups" setting section is empty
  When I input "board-viewers" in the "display user groups"
  And I confirm the edit with the green "check" button
  And I reload the page
  Then I can see the "board-viewers" in the "display user groups"
