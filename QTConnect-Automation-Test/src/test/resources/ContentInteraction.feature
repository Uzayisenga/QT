@QTCON-191
Feature: Search for specific messages, contacts, or groups within the app
	#User should be able to search of a contact they have.
  @TEST_QTCON-107
  Scenario: Search for an existent contact by name
    Given I am logged in
    When I swipe down in Chats Screen
    And enter contact name in the search input
    Then the contact should appear in the search results

	#User should be able to search for a group by name
  @TEST_QTCON-108 @iOS
  Scenario: User to search for a Group
    Given I am logged in
    When I swipe down in Chats Screen
    And enter group name in the search input
    Then the group should appear in the search results

	#Verify if a user can search non existing contact
  @TEST_QTCON-109 @iOS
  Scenario: User to search non-existing contact
    Given I am logged in
    And I have existing groups chats and chats with a contact
    When I swipe down in Chats Screen
    And enter "qwert@134455dfg" in the search input
    Then the search results should be blank
    And No group or contact is displayed

	#Verify if a user can search with an empty message query
  @TEST_QTCON-110 @iOS
  Scenario: User to search with empty query
    Given I am logged in
    When I swipe down in Chats Screen
    And tap on search on keyboard
    Then the search button should be disabled

  @TEST_QTCON-175
  Scenario: User to search non-existing group
    Given I am logged in
    When I swipe down in Chats Screen
    And enter "NON_EXISTING_GROUP12237774321" in the search input
    Then the search results should be blank
    And No Group is displayed

