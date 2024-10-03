@QTCON-135
Feature: Manage contacts
	#The user should be able to delete the existing contact and the contact name should be disappeared from contact list.
  @TEST_QTCON-71 @TESTSET_QTCON-131
  Scenario Outline: Delete A Contact
    Given The user is logged into the app
    And The user navigates to the "Contacts" section
    When The user views their contact list
    And swipe left on "<contact_name>"
    And The user taps on the "Delete" option
    And A confirmation dialog should appear asking "Do you really want to remove the contact?"
    And The user confirms by tapping on "Yes"
    Then The contact "<contact_name>" should be removed from the contact list
    And A notification "Contact deleted successfully" should be displayed
    And The contact "<contact_name>" should no longer appear in the contact list

    Examples:
      | contact_name   |
      | Aminatha       |
      | Pacy           |
      | Neza           |
      | Byiri          |

  @TEST_QTCON-45 @TESTSET_QTCON-131
  Scenario: Block an existing contact
    Given I am in contacts screen and i have more than one contact
    When I select a contact from contact list
    And I click on menu three dots
    And I see a popup to click on "Block" navigation
    And I click on "Block" and i see block confirm prompt
    And I confirm to block the contact
    Then The contact is blocked

	#As a user I want to unblock any contact i have blocked, So that i can make communication with them.
  @TEST_QTCON-46 @TESTSET_QTCON-124
  Scenario: Unblock a friend or existing contact trough chat screen
    Given I am on "contacts" screen
    When I click on my contact who is blocked
    And I click "Unblock"
    Then My contact should be unblocked
    And See "You unblocked" contact notification
    And I should see message input area to send a message to my contact

  Scenario: Unblock a friend or existing contact trough contact info
    Given I am on "contacts" screen
    When I click "Contact" name
    And I click "Unblock" contact
    Then My contact should be unblocked
    And See "You unblocked" contact notification
    And I should message input area to send a message to my contact

	#The user should be able to add new contact, so that the new contact will display to contact list.
  @TEST_QTCON-55 @TESTSET_QTCON-131
  Scenario Outline: The user adds a new contact by filling in the new contact form
    Given The user is logged in to QT Connect
    And The user navigates to the contact list
    When The user taps on the "Add Contact" icon
    And The user taps on the "Add Contact" button
    And New contact form is displayed
    And The user fills in the new contact form with "<name>" and "<QT pin>"
    And The user taps on the "Add" button
    Then The new contact "<name>" should be added to the contact list

    Examples:
      | name       | QT pin   |
      | Aminatha   | 034567829|
      | Pacy  | 00893648 |
      | Thie    | 08907888 |
      | Christa  | 089324578|

	#A user can edit existing contact, so that he can see the updated names.
  @TEST_QTCON-60
  Scenario: User edit their existing contact.
    When the user taps on a contact
    And the conversation opened
    And the user taps View more icon
    And the user taps on View Profile button
    And Taps on Edit button
    And the user edit contact 'name'
    And the user taps on the save
    Then updated name should be displayed on profile user.

  @TEST_QTCON-167 @TESTSET_QTCON-131
  Scenario: Block an existing contact passing in contact info
    Given The user is in contacts screen and i have more than one contact
    When the user selects a contact from contact list
    And the user taps on contact info
    And taps on "Block" contact and i see block confirm prompt
    And confirms to block the contact by taping on "Yes"
    Then The contact is blocked
    And the user should no longer receive messages from the blocked contact

	#When i delete the contact and the contact add me again and i want to edit their name.
  @TEST_QTCON-136 @TESTSET_QTCON-131 @iOS
  Scenario: Edit new contact after deleting it
    Given I am logged into the QT Connect app
    And I am on contacts screen
    When I tap on "Accept"
    And Click on contact to go in chat with the contact
    And click on contact
    And click on "Edit" button and type new name
    And "Save" button should be active and clickable
    Then The contact name is edited

	#I want to add an Invalid contact so that I can check if the invalid contact can't be added to contact list.
  @TEST_QTCON-181 @TESTSET_QTCON-131
  Scenario: Adding a contact with an invalid QT pin
    Given The user is logged into the application
    And The user navigates to the "Add Contact" screen
    When The user enters "A" as the contact name
    And The user enters "1234567890" as the QT pin
    And The user clicks on "Add" to save the contact
    Then The system should display an error message saying "Invalid QT pin"
    And The contact should not be added to the contact list


