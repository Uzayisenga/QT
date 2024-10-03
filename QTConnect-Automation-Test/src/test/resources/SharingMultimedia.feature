@QTCON-183
Feature: Sharing Multimedia
	#As a user of the QT Connect app I want to send multimedia to a contact So that I can easily share audio, video, images, and files
	@TEST_QTCON-73 @positive
	Scenario Outline: Send Various Multimedia Types
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		When I select to send a "<file_type>" file
		And I choose a "<file_name>" from my device
		And I send the file
		Then the "<file_name>" should appear in my chat conversation as sent

		Examples:
			| file_type | file_name               |
			| audio     | We are the champions.mp3|
			| audio     | my_mixtape_recording.wav|
			| video     | my_first_video_clip.mp4 |
			| video     | animation.gif           |
			| image     | my_proposal.jpg         |
			| image     | wedding.png             |
			| document  | report.pdf              |
			| document  | spreadsheet.xlsx        |
			| compressed| my_archive.zip          |

	#As a user of the QT Connect app I want to send multimedia to a contact So that I can easily share audio, video, images, and files
	@TEST_QTCON-93 @positive
	Scenario: Successfully send a large multimedia file
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		When I select to send a video file "virunga_national_parc_video.mp4" of size 1.9 GB
		And I send the file
		Then the "virunga_national_parc_video.mp4" should appear in the chat conversation as sent

	#I want to view PDF within the app
	@TEST_QTCON-94 @iOS
	Scenario: View PDF Attachment Within Chat Window
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		When I send a PDF file "our_report.pdf" to Receiver
		And I tap on the sent "our_report.pdf" in the chat
		Then the PDF should open and be viewable within the chat window

	#As a user of the QT Connect app I want to send multimedia to a contact So that I can easily share audio, video, images, and files
	@TEST_QTCON-95 @positive
	Scenario: Forward received multimedia
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		And Sender has sent me an image "friday_party.jpg"
		When I select to forward the "friday_party.jpg"
		And I choose Receiver as the recipient
		Then the "friday_party.jpg" should appear in my chat conversation with the Receiver

	#As a user of the QT Connect app I want to delete a sent multimedia.
	@TEST_QTCON-96 @positive
	Scenario: Delete sent multimedia
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		Given I have sent an image "selfie.jpg" to Receiver
		When I select to delete the "selfie.jpg" from the chat
		Then the "selfie.jpg" should disappear from the chat conversation

	@TEST_QTCON-97 @negative
	Scenario: Send Unsupported File Formats
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		When I select to send an "audio" file with format ".aac"
		Then I should see an error message indicating the format is not supported

	#Send File Exceeding Size Limit
	@TEST_QTCON-98 @negative
	Scenario: Send File Exceeding Size Limit
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		When I select to send a video file "summer_party_record.mp4" of size 2.1 GB
		Then I should see an error message indicating the file size exceeds the limit

	#Send Multimedia with Poor Network Connection
	@TEST_QTCON-99 @negative
	Scenario: Send Multimedia with Poor Network Connection
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		Given I have a poor network connection
		When I select to send an image "City Tower.jpg" of size 50 MB
		Then the app should attempt to send the file
		And I should see a warning about slow upload speed
		And the app should retry sending if the connection drops

	@TEST_QTCON-100 @negative
	Scenario: Send Multimedia to Blocked Contact
		Given I have blocked the contact Blocked_Contact
		When I try to send an image "my_dog.jpg" to Blocked_Contact
		Then I should see an error message indicating I cannot send files to blocked contacts

	@TEST_QTCON-101 @edge_case
	Scenario: Send Multimedia While Offline
		Given I am logged into the QT Connect app
		And I am in a chat conversation with Receiver
		Given I am offline
		When I select to send an image "my_room.jpg" to Receiver
		Then the image should be queued for sending
		And when I come online, the image should be sent automatically

	@TEST_QTCON-102 @edge_case
	Scenario: Cancel multimedia sent mid-upload
		When I start sending a large video file "summer_party_record.mp4"
		And I cancel the upload midway
		Then the upload should stop
		And the partial file should be removed from the chat conversation

