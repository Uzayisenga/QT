@QTCON-189 @GroupMessaging @iPhone15_18 @iPhoneX-Physical_16.7 @iPhoneXR-Physical_17.6 @iPhone8_12.1
Feature: Group Messaging
	#Verify if the group users can forward message from groups to contacts.
  @TEST_QTCON-82
  Scenario: Group user to forward a message from group to contacts
    Given the user is a participant in the group
    And the group has an existing conversation with messages
    And the user taps on the "Forward" option
    And the user tap of forward icon
    And the user chooses a contact to forward the message to
    And the user taps on "Forward"
    Then the selected message should be forwarded to the chosen contact

	#Verify if group admins can dismiss group admin roles to other admins in the same group.
  @TEST_QTCON-92
  Scenario: Group admin to dismiss group admin role to other admins
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And taps on a group participant who is also admin
    And chooses "Dismiss Admin"
    Then "Admin" label should be removed near the participant's name in group info
    And group participants should be notified about the dismissed admin

	#Verify if users can create groups
  @TEST_QTCON-75
  Scenario Outline: User creates a group
    Given the user is logged in
    When the user taps on the UserProfile icon
    And the user taps on "Create a Group"
    And the user fills in the groupName "<name>" and "<description>"
    And the user taps on create button
    And the user selects group participants from the contact list
    And the user taps on "Add"
    Then the group should be successfully created
    And the user should be added as the group admin by default
    And the created group should be displayed on chats

    Examples:
      |name      |description|
      | TSRGroup |TestSolutions|

	#Verify if group admins can add group praticipants from the contact list
  @TEST_QTCON-76
  Scenario: Group admin adds a participant to the group
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And taps on "Add Participants"
    And the admin selects participants from the contact list
    And the admin taps on "Add"
    Then the participant should be successfully added
    And the added participant should be notified that they have been added to the group
    And all existing group participants should be notified of the new participant

	#Verify if group admins can remove group participants
  @TEST_QTCON-77
  Scenario: Group admin removes a participants from the group
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And taps on a group participant
    And chooses "Remove From group"
    And Confirms to remove
    Then the participant should be successfully removed
    And group participants should be notified about the removed participant

	#Verify if group admin can change participants role to admin
  @TEST_QTCON-79
  Scenario: Group admin makes other participant group admin
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And taps on a group participant
    And chooses "Make Admin"
    Then "Admin" label should appear near the participant's name in group info
    And group participants should be notified about the user become an admin

	#Verify if the group admin can change the name and description of the group.
  @TEST_QTCON-80
  Scenario: Group admin changes the group name and description
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And the user taps on "Edit"
    And the admin updates the group name and description
    And the admin taps on "Save"
    Then the group name and description should be successfully updated
    And all group users must see the changed name and description instantly

	#Verify if the group users can reply to a message in the group chat by long pressing to a message.
  @TEST_QTCON-81
  Scenario: Group user uses long-press to reply to a message in the group
    Given the user is a participant in the group
    And the group has an existing conversation with messages
    When the user long press to a message
    And Chose "Reply" option
    And the user enters a reply-message in the text field
    And the user taps on send message icon
    Then the reply-message should be sent and linked to the message
    And all participants in the group will get the reply message with its linked message

	#Verify if group user deletes a message in the group
  @TEST_QTCON-84
  Scenario: Group user deletes a message in the group
    Given the user is a participant in the group
    And the group has an existing conversation with messages
    When the user long press on a message
    And the user choses delete
    And clicks on the delete icon
    Then the only selected message should be deleted successfully

	#Verify if a group user can forward a message from one group to another.
  @TEST_QTCON-104
  Scenario: Group user forwards a message in the group
    Given the user is a participant in the group
    And the group has an existing conversation with messages
    And the user taps on the "Forward" option
    And the user tap of forward icon
    And the user chooses a group to forward the message to
    And the user taps on "Forward"
    Then the selected message should be forwarded to the chosen group

	#Verify if the group users can swipe to reply to a message in the group
  @TEST_QTCON-85
  Scenario: Group user uses swipe-to-reply to a message in the group
    Given the user is a participant in the group
    And the group has an existing conversation with messages
    When the user swipes a message to the right
    And the user enters a reply-message in the text field
    And the user taps on send message icon
    Then the reply-message should be sent and linked to the message
    And all participants in the group will get the reply message with its linked message

	#Verify if group users can delete group they exited
  @TEST_QTCON-87
  Scenario: Group users to delete group they exited
    Given the user is logged in
    And the user has exited the group
    And the user is on conversation screen of the group they exited
    When the user taps on options and choose "Group Info"
    And the user taps on "Delete group"
    And the user confirms to delete the group
    Then the group should disappear from chats screen.

	#Verify if group admins can delete groups.
  @TEST_QTCON-88
  Scenario: Group admin deletes the group
    Given the user is logged in
    And the user created a group with participants
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And the user choses "close group"
    And the group user confirms to close the group
    Then a pop up notification opens, stating the group is closed
    When the user taps on options and choose "Group Info"
    And the user taps on delete group option
    And confirms to delete the group
    Then the group will be deleted and no longer appearing in chats screen

	#Verify if group admins and users can send messages to participant of the group
  @TEST_QTCON-89
  Scenario: Group users and admins to send messages to participants of the group instantly.
    Given the user is a participant in the group
    When the user sends a message in the group
    Then the message  should be sent in real-time
    And double ticks are displayed next to the message when it has been delivered to all participants
    And double blue tick is displayed next to the message when it has been read by all group participants

	#Verify if a User can create a group without name
  @TEST_QTCON-90
  Scenario: User creates a group without a name
    Given the user is logged in
    When the user taps on the plus icon
    And the user taps on "Create a Group"
    And the user does not fill in the group name
    Then the group should not be created with error message saying "Error, At least Name should be more than one character."

	#Verify if the group admin can add group participants that are already in the group
  @TEST_QTCON-91
  Scenario: Group admin to add a participant who is already in the group
    Given the user is logged in
    And user is in conversation of the group
    When the user taps on group name for info
    And the user taps on "Add Participant"
    Then user in the group should not appear in list of users to add

	#Verify if group users can exit from the group.
  @TEST_QTCON-86
  Scenario: Group users to exit group
    Given the user is logged in
    And the user is a participant in the group
    When the user taps on options and choose "Group Info"
    And the user taps on "Exit group"
    And the user confirms to exit the group
    Then the user will get "You left" message displayed in the group chat window.
    And the user can not be able to send message to the group.

	#Verify if group admin can exit group while they still an Admin
  @TEST_QTCON-208
  Scenario: Group Admin to exit group
    Given the admin is logged in
    And the admin is a participant in the group
    When the admin taps on options and choose "Group Info"
    And the admin taps on "Exit group"
    And the admin confirms to exit the group
    Then the admin will get "You left" message displayed in the group chat window.
    And the admin can not be able to send message to the group.

	#Verify if creating group with empty spaces which make a group without the name is possible.
  @TEST_QTCON-211
  Scenario: Creating group with empty spaces as name.
    Given the user is logged in
    When the user taps on the UserProfile icon
    And the user taps on "Create a Group"
    And the user fills in the groupName taps space on keyboard
    And the user taps on create button
    Then the user should see an error message saying "Error, At least Name should be more than one character."

	#Verify if group Admin can rename an existing group with blank name
  @TEST_QTCON-213
  Scenario: Group admin to change the group name with blank name
    Given the user is logged in
    And the user is the group admin
    And the user has a group chat conversation open
    When the user taps on options and choose "Group Info"
    And the user taps on "Edit"
    And the admin updates the group name by deleting existing group name to complete empty
    And the admin taps on "Save"
    Then the group name should not be updated with an error message saying "Error, At least Name should be more than one character."

