# CMPE 202 - Team Project - Starbuck Mobile App on Processing

The idea is to leverage the individual project implementation and re-build the Starbuck Mobile App on processing with animation UI. 

![](https://github.com/nguyensjsu/fa18-202-mystic/blob/master/yinghua_qin/GifMaker_20181120214214887.gif)

Download and install the Processing. https://processing.org/

References:
- Sample code from professor. https://github.com/paulnguyen/cmpe202/tree/master/processing
- Java Programming with Processing from professor. https://slack-files.com/files-pri-safe/T0AMW0A3S-FE1PXQENB/java_programming_with_processing.pdf?c=1542777253-18a17676a94dbe8e972df65fdb4a86d335ebf835
- Processing official website.   https://processing.org/

Development environment setup instruction: 

      1) download the jar here: https://github.com/nguyensjsu/fa18-202-mystic/blob/master/yinghua_qin/starbucks.jar
      2) put this jar to the processing lib folder , such as: processing\modes\java\libraries\starbucks\library\starbucks.jar
      3) restart the process IDE
      4) import the lib into processing
      5) download the project from here: https://github.com/nguyensjsu/fa18-202-mystic/tree/master/yinghua_qin/starbucks
      6) start to update the starbucks.pde and commit the changes


## Journal Week #1

### Feasibilty experiments in Processing (Thol Chidambaram)

What I have done this week

- Implemented examples in processing for loading images. 
- Added default screenshots from new Starbucks app, rendered them in processing.
- Modified the images to match the same functionaliy in Starbucks requirements pdf.
- Try out rendering live Google map loading for Starbucks stores.
- Showcase for week 1.

What I plan to do next week

- Get all screens ready to match the functionality in requirements.
- Is it possible to use eclipse for IDE instead of using Processing?
- Check the possibility of Features IDE modeling using AspectJ for feature selection.
- How should I implement MyCards page to MyCardsOptions navigations? which pattern should I use?

### Login Function (Yinghua Qin)

What I have done this week

- I started from looking at some examples of the Processing. 
- Building UI and annimation on processing seems simple. 
- Showcase for week 1

What I plan to do next week

- How to import my individual project Java files to Processing so that I could reuse the source code? 
- Which design patterns I should implement on Login function? The state machine? The observation? Those are implemented on the individual project. 
- Would it be cool to create a QR code scan for login on Processing? It seems there is a QR code scan lib avaiable. 
- Would it be cool to add sound when login fail and a happy sound when login success? 

### AddCard Functionality (Srivatsa Mulpuri)

What I have done this week

- I went through the Processing tutorial online and examples on cmpe202 github
- Created shapes and GUI elements like buttons using processing

What will I do do next week?

- Integrate the personal project source code for Settings and Add Card Functionalities
- Create Buttons in Settings screen for a better user experience
- Implement the screen redirection functionality from settings to AddCard

## Journal Week #2

### Login Function (Yinghua Qin)

What I have done this week

- Imported the individaul project Java files to Processing
- Built a login UI with a pre-set PIN 1234
- Tested the login success case - input 1234 (use mouse click)
- Tested the login fail case - input wrong pin (use mouse click)
- Tested the "x" cancel last input chat
- Created a video recording for the showcase


What I plan to do next week

- Implement the design pattern on Login function
- Link with the starbuck source code for screen flow

### MyCards Functionality (Thol Chidambaram)

What I have done this week

- Completed implementing the processing code in eclipse.
- Ingegrated existing starbucks code along with projcessing's "core.jar"
- Started wireframing on coordinate conversion between the new and old Starbucks app screens.
- Completed creating new screen designs.
- Enabled gradle to download and test processing jar files during project compile.

What I'm blocked

- Login screen implementation from Yinghua

What I plan to do next week

- Discuss with team on where they stand
- Complete the entire app functionality in processing.

### AddCard Functionality (Srivatsa Mulpuri)

What I have done this week

- I have integrated the source code for settings and Add card functionalities
- Designed 'Add Starbucks Cards' button on settings screen, implemented onhover and onClick events
- Successfully implemented screen redirection functionality from settings to AddCard
- Showcase for week 2

![](https://github.com/nguyensjsu/fa18-202-mystic/blob/master/srivatsa_mulpuri/20181122_230851.gif)

What will I do do next week?

- Check if can reuse the starbucks personal project source code completely for add card. if not, identify the necessary modifications
- Create fields for cardnumber and cvv code using processing
- Write logic to convert keypad touch event to starbucks app touch event 


## Journal Week #3

### Login Function (Yinghua Qin)

What I have done this week
- I found a way to use the .jar file in processing. 
- With this, I could put all my personal project java code into a jar file and use it in this team project. 
- Instruction: 

      Put the starbucks.jar into the library folder under Processing software.
      processing\modes\java\libraries\starbucks\library\starbucks.jar
      Import the library to the project. 

![](https://github.com/nguyensjsu/fa18-202-mystic/blob/master/yinghua_qin/AddStarbuckJar.png)

- I got all the screens from professor's PDF of personal project
- I worked out the size of the screen and the position mapping as listed on the PDF.
      
      The height should same as the 500 in the size function
      
      int headerHeight=60;
      int h=headerHeight+55*8;  //before:480; now: 500
      
      size(320,500);  //480

- Showcase for week 3

![](https://github.com/nguyensjsu/fa18-202-mystic/blob/master/yinghua_qin/GifMaker_20181122180117424.gif)

What I plan to do next week
- Think about some wow factors to add into the project
- Work with the team to get all screens implemented


### AddCard Functionality (Srivatsa Mulpuri)

What I have done this week

- Developed Add Card functionality using starbucks personal project source code
- Created font for card number and cvv
- Made code changes to display carrd number and cvv in the appropriate fields
- Add Card showcase version 1.0

![](https://github.com/nguyensjsu/fa18-202-mystic/blob/master/srivatsa_mulpuri/20181124_163907.gif)

What will I do do next week?

- Come up with ideas to improve user experience
- Work with team members and integrate the code

## Journal Week #4

### Login Function (Yinghua Qin)

What I have done this week
- I found a way to use the .jar file in processing. 

What will I do do next week?

