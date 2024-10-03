@QTCON-194
Feature: Track history activities for Audio Calls
	#I want to view complete call history
  @TEST_QTCON-70
  Scenario: Viewing audio call history
    Given I am logged into the QT Connect app
    When I navigate to the call history screen
    Then I should see a list of all my audio calls
    And each entry should display the contact name, date, time, and duration of the call

	#Verify if as a user you can clear call log
  @TEST_QTCON-121
  Scenario: Clear call history
    Given I am logged into the QT Connect app
    Given I am on the call history screen
    When I select the option to clear call history
    And I confirm the action
    Then my call history should be empty
    And I should see a message indicating "No Recent Calls"

  @TEST_QTCON-122 @iOS
  Scenario Outline: Initiate a call with a contact from call history
    Given I am logged into the QT Connect app
    And I am on the call history screen
    When I tap on a call history entry for "<contact>"
    Then I should see options to call or message the "<contact>"
    When I select the call option
    Then the app should initiate an audio call with "<contact>"
    Examples:
    |contact  |
    |Pacifique|
    |Christian|
