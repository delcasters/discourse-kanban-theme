Feature: Re-ordering one topic by tag within the same column and same board settings

Background:
  And there is a NON top-level category named "Category A" with id "2"
  And the category doesn't have any subcategories
  And there are following topics in the category:
    | id | name    | tags  |
    | 1  | Topic A | now   |
    | 2  | Topic B | next  |
    | 3  | Topic C | next  |
    | 4  | Topic D | next  |
    | 5  | Topic E | later |
    | 6  | Topic F | later |
    | 7  | Topic G |       |
  And I go to the board view viw the "Category A"
  And the board view has settings in the URL "tags:now,next,later,@untagged"
  And assumiug the topics are ordered in the columns by their ids by default

Scenario: Drag along order indicator
  When I drag the topic up in the column

Scenario: Drag and drop re-order 
  When I drag and drop the "Topic D" item to the second posiotion in the "#next" column
  Then it becomes then second item in the "#next" column
  
Scenario: Persistce with the same board settings
  When I drag and drop the topic "Topic D" item to the second position in the "#next" column
  And I reload the page
  Then I can see the "Topic D" as a second item in he "#next" column

Scenario: Persistce with a different board settings
  When I drag adn drop the topic "Topic D" item to the second position of the "#next" column
  And I reload the page
  Then I can see the "Topic D" as the second item i the "#next" column

Scenario: API
  When I drag and drop the topic "Topic D" item to the top of the "#next" column
  And I fetch the API "/c/2/topic-board-order.json"
  Then I get a response containing:
  """
    {
      {
        "topic_id": "2": 
        order: {
          "category_id": 2,
          "type": "tag",
          "id": "next",
          "order": "0"
        }
      },
      {
        "topic_id": "4": 
        order: {
          "category_id": 2,
          "type": "tag",
          "id": "next",
          "order": "2"
        }
      },
     {
        "topic_id": "3": 
        order: {
          "category_id": 2,
          "type": "tag",
          "id": "next",
          "order": "2"
        }
      },      
    }
  """





