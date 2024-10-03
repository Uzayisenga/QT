@One-to-OneMessaging @QTCON-145
Feature: One-to-One Messaging
  Background:
    Given the user is on home screen of QTConnect application

	#Verify that a user can send text message to a contact
  @TEST_QTCON-39 @TESTSET_QTCON-131
  Scenario Outline: User sends a text message in real-time
    When the user is on the Chats screen with a contacts
    And the user types <message> in the message input field
    And the user clicks the send button
    Then the message <message> should appear in the conversation window
    And a single tick should appear next to the sent message
    And double ticks should appear next to sent message when the message is delivered

    Examples:
      |message|
      |Hello  |

	#Verify If a user can forward a message to a contact
  @TEST_QTCON-47 @TESTSET_QTCON-131
  Scenario: User to forward a message
    When the user has an existing conversation with messages
    And the user long-press on a message
    And the user taps on the "Forward" option
    And the user tap of forward icon
    And the user chooses a contact to forward the message to
    And the user taps on "Forward"
    Then the selected message should be forwarded to the chosen contact
    And the forward sign should be visible on message to differentiate written and forwarded messages

	#Verify if a user can copy and paste a message
  @TEST_QTCON-48 @TESTSET_QTCON-131
  Scenario: User to copy and paste a message
    When the user has an existing conversation with messages
    And the user long-presses on a message
    And the user taps on the "Copy" option
    And the user long-press on a message text field
    And the user pastes the copied message
    Then the message should be copied and pasted correctly

	#Verify if a user can swipe and reply a message
  @TEST_QTCON-49 @TESTSET_QTCON-131
  Scenario: Swipe and reply to a message
    When the user has an existing conversation with messages
    And the user swipes a message to the right
    And the user enters a reply-message in the text field
    And the user taps on send message icon
    Then the reply-message should be sent and linked to the message

	#Verify if a user can check message info
  @TEST_QTCON-50 @TESTSET_QTCON-131
  Scenario: User to check message info
    When the user has an existing conversation with messages
    And the user long-presses on a message
    And the user taps on "Info"
    Then the correct timestamps for when the message was sent, delivered, and seen should be display

	#Verify if a user can delete a message
  @TEST_QTCON-51 @TESTSET_QTCON-131
  Scenario: User to delete a message
    When I am in chat conversion with a contact
    And I long-press on a message
    And I tap on "Delete"
    And I select messages to delete
    And I tap on delete icon
    Then the selected message should disappear from the conversation screen

	#Verify if a user can clear chat history from a conversation screen
  @TEST_QTCON-52 @TESTSET_QTCON-131
  Scenario: User to clear chat history from conversation screen
    When the user is inside a conversation screen with a contact
    And the user taps on the options menu
    And the user selects "Clear History"
    And the user confirms the action "Are you sure, you want to clear history?"
    And the user taps on "Yes"
    Then all messages in the conversation should be cleared
    And the conversation itself should remain in the chat list

	#Verify if a user can swipe and clear chats from chats screen
  @TEST_QTCON-53 @TESTSET_QTCON-131
  Scenario: User to swipe and clear chat from Chats screen
    When the user has a chat with a contact in Chats screen
    And the user swipes left on a chat
    And the user taps on "Clear"
    And the user confirms the action
    Then all messages in the chat should be deleted
    And the contact will stay in chat with empty conversation

	#Verify if a user can delete chat from a conversation window
  @TEST_QTCON-54 @TESTSET_QTCON-131
  Scenario: Delete a chat from conversation window
    When the user is inside a chat screen
    And the user swipe left and clicks "Delete"
    And the user confirms the action
    Then the entire chat should be deleted from both the conversation screen and the chat list

	#Verify if a user can delete a single message after writing multiple messages in a row.
  @TEST_QTCON-152 @TESTSET_QTCON-131
  Scenario Outline: User deletes last message after sending multiple messages in a row
    When I am in a chat conversation with a contact
    And I send the following messages:
      | message    |
      | <message1> |
      | <message2> |
      | <message3> |
      | <message4> |
      | <message5> |
      | <message6> |
      | <message7> |
      | <message8> |
      | <message9> |
      | <message10>|
    And I delete the last sent message
    Then the last message "<message10>" should be removed from the chat
    And the remaining 9 messages should still be visible in the chat

    Examples:
      | message1 | message2 | message3 | message4 | message5 | message6 | message7 | message8 | message9 | message10 |
      | Hello    | How are you? | What's new? | Nice weather | Lunch plans? | Meeting at 3 | Don't forget | See you soon | Take care | Goodbye |
      | Hi there | Good morning | Any updates? | Project status? | Team meeting | Deadline tomorrow | Need help? | Great work | Well done | Oops, typo |

  @TEST_QTCON-154 @TESTSET_QTCON-131
  Scenario: User to delete selected messages in a conversation after sending multiple messages
    When I am in a chat conversation with "Paci"
    And I send the following messages:
      | message                                   |
      | Hi Paci, how's your day going?             |
      | I wanted to discuss the project deadline   |
      | Can we meet tomorrow at 2 PM?              |
      | I've prepared some documents for review    |
      | Let me know if you need anything else      |
      | Oops, I sent that last message too soon    |
      | Looking forward to our meeting             |
    Then all messages should be visible in the chat
    And I select the following messages for deletion:
      | message                                   |
      | I've prepared some documents for review    |
      | Oops, I sent that last message too soon    |
    And I confirm the deletion
    Then the selected messages should be removed from the chat
    And the remaining messages should still be visible:
      | message                                   |
      | Hi Paci, how's your day going?             |
      | I wanted to discuss the project deadline   |
      | Can we meet tomorrow at 2 PM?              |
      | Let me know if you need anything else      |
      | Looking forward to our meeting             |
    And the chat history should be updated accordingly

  @TEST_QTCON-164 @TESTSET_QTCON-131 @iOS
  Scenario: Send an empty message after adding spaces
    When I am in a chat conversation with "Paci"
    And I add a space to the message
    Then the send button should be disabled
    And no message should be sent

  @TEST_QTCON-165 @TESTSET_QTCON-131 @iOS
  Scenario: Send an empty message after adding return
    When I am in a chat conversation with "Paci"
    And I add a return to the message
    Then the send button should be disabled
    And no message should be sent

  @TEST_QTCON-166 @TESTSET_QTCON-131 @iOS
  Scenario: Send an empty message attached to a media
    when I am in a chat conversation with "Paci"
    And I add a lot of space to the message
    And i attach an image from gallery
    Then the media should be sent with emptied body

  @TEST_QTCON-153 @TESTSET_QTCON-131
  Scenario: User to chat with a contact a very long conversation with instant messages
    When I open a chat conversation with "Paci"
    And I send the following messages instantly:
      | message                                        |
      | Hi Paci, how are you doing today?              |
      | I wanted to discuss the project deadline       |
      | Do you think we can meet it by next Friday?    |
      | I've been working on the design mockups        |
      | They should be ready for review tomorrow       |
      | Let me know if you need any clarifications     |
      | Also, did you get a chance to look at the bug reports? |
      | We should prioritize fixing the critical ones  |
      | Oh, and don't forget about the team meeting at 3 PM |
      | Looking forward to your updates!               |
    And "Paci" should receive each message in real-time
    And I should be able to see "Paci"'s typing indicator when they're responding
    And I should receive "Paci"'s responses instantly
    And the app should handle the long conversation without performance issues
    And I should be able to scroll through the entire conversation history smoothly

  @TEST_QTCON-155 @TESTSET_QTCON-131
  Scenario: Send an empty message
    When I am in a chat conversation with "Paci"
    And I type an empty message
    And I attempt to send the empty message
    Then the send button should be disabled
    And no message should be sent



