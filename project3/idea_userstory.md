Jared Yamauchi 

Date: May 
Ideas for the Project 3
- Interactive Photo/Video Blog Website
	Title: Journalz
- Personal Journal
	Title: My Journal

User Story for Project 3
1. The User must sign-up/log-in before proceed to the home page. 
2. Should create its own profile such as create its own name, description, upload the picture, etc.
3. Should find the google/youtube style images-search engine and search for pictures
4. The webpage should display the interactively photos or videos popping up. 
5. Save photos/videos to the user's account system
6. Have the interactive slide show inside the user's profile page. 

Ice-Box
1. Users can customize its own profile
2. Should be able to maximumize the video/photo's screen
3. Include comments for users to "comment" about the blogs, photos, or videos. 

Models: 
1. Users
	- Devise
	- Email
	- Password
	-Has_one Profile
2. Profiles
	- User ID
	- Has many photos
	- has many videos
	- has many blogs
2. Photos
	- ID
	- Belongs to profiles
3. Videos
	- ID 
	- Belongs to profiles
4. Blogs
	- ID
	- belongs to profiles
	- has many comments 
5. Comments 
	-ID
	- belongs to profiles
