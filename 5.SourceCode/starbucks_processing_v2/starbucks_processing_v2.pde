import starbucksTeam.*; //<>//

import starbucks.*;
import java.awt.Point;
import java.util.Arrays;

int rectX, rectY, rectWidth, rectHeight;

boolean rectOver = false;
boolean debug=true;
boolean enablePay = false;

float a = 95;

color buttontHighlight;

String[] screens = { "PinScreen", "MyCards", "AddCard", "MyCardsOptions","MyCardsMoreOptions", "MyCardsPay", "Rewards","Settings", "Store","Payments","SetPin"};
String[] keypadButtons = { "One", "Two", "Three", "Four","Five", "Six", "Seven","Eight", "Nine","Spacer","Zero","BackSpace"};
PImage[] screenImages = new PImage[screens.length];
PImage[] keypadButtonImages = new PImage[keypadButtons.length];
PImage[] keypadButtonRollImages = new PImage[keypadButtons.length];
PImage[] keypadButtonDownImages = new PImage[keypadButtons.length];
ImageButtons[] keypadImageButtons = new ImageButtons[keypadButtons.length];

PImage[] keypadButtonImagesPS = new PImage[keypadButtons.length];
PImage[] keypadButtonRollImagesPS = new PImage[keypadButtons.length];
PImage[] keypadButtonDownImagesPS = new PImage[keypadButtons.length];
ImageButtons[] keypadImageButtonsPS = new ImageButtons[keypadButtons.length];

int kx,ky;
int headerHeight=60;

PFont font;
PImage screenBlur;
PImage mycardPayTouch;

String pin = "1234";
String pinInput = "";
int w=320;
int h=headerHeight+55*8;//before:480; now: 500
IApp app = new AppAuthProxy() ;
String[] lines ;
String balance = "$0.00";

IItemJar setPin= new PinScreen();      //add team members screens.

void setup() {


  size(320,500);  //480
  rectX = 0;
  rectY = 20;
  rectWidth = 100;
  rectHeight = 30;
  buttontHighlight = color(49,49,49);
  // Make a new instance of a PImage by loading an image file
  for (int i=0; i < screens.length; i++) {
    screenImages[i] = loadImage("/Images/"+screens[i]+".jpg");
    screenImages[i].resize(w,h);
  }
  screenBlur = loadImage("/Images/MyCardsPayBlur.png");
  screenBlur.resize(w,h);
  mycardPayTouch = loadImage("/Images/MyCardsPayTouch.png");
  mycardPayTouch.resize(w,h);
  
  for (int i = 0; i<keypadButtons.length; i++)
  {
    keypadButtonImages[i] = loadImage("/keypadButtons/AddCard/new/"+keypadButtons[i]+".png");
   // keypadButtonImages[i].resize(106,56);
    keypadButtonRollImages[i] = loadImage("/keypadButtons/AddCard/new/"+keypadButtons[i]+"Roll.png");
   // keypadButtonRollImages[i].resize(106,56);
    keypadButtonDownImages[i] = loadImage("/keypadButtons/AddCard/new/"+keypadButtons[i]+"Down.png");
   // keypadButtonDownImages[i].resize(106,56);
    
    keypadButtonImagesPS[i] = loadImage("/keypadButtons/PinScreen/"+keypadButtons[i]+".png");
    keypadButtonImagesPS[i].resize(106,56);
    keypadButtonRollImagesPS[i] = loadImage("/keypadButtons/PinScreen/"+keypadButtons[i]+"Roll.png");
    keypadButtonRollImagesPS[i].resize(106,56);
    keypadButtonDownImagesPS[i] = loadImage("/keypadButtons/PinScreen/"+keypadButtons[i]+"Down.png");
    keypadButtonDownImagesPS[i].resize(106,56);
    
    if(i<3)
    {
      keypadButtonImages[i].resize(106,55);
      keypadButtonRollImages[i].resize(106,55);
      keypadButtonDownImages[i].resize(106,55);
      keypadImageButtons[i] = new ImageButtons(i*106, h-((4)*56), 106, 56, keypadButtonImages[i], keypadButtonRollImages[i], keypadButtonDownImages[i]);
      keypadImageButtonsPS[i] = new ImageButtons(i*106, h-((4)*56), 106, 56, keypadButtonImagesPS[i], keypadButtonRollImagesPS[i], keypadButtonDownImagesPS[i]);
    }
    else if(i<6)
    {
      keypadImageButtons[i] = new ImageButtons((i%3)*106, h-((3)*56), 106, 56, keypadButtonImages[i], keypadButtonRollImages[i], keypadButtonDownImages[i]);
      keypadImageButtonsPS[i] = new ImageButtons((i%3)*106, h-((3)*56), 106, 56, keypadButtonImagesPS[i], keypadButtonRollImagesPS[i], keypadButtonDownImagesPS[i]);
    }
    else if(i<9)
    {
      keypadImageButtons[i] = new ImageButtons((i%3)*106, h-((2)*56), 106, 56, keypadButtonImages[i], keypadButtonRollImages[i], keypadButtonDownImages[i]);
      keypadImageButtonsPS[i] = new ImageButtons((i%3)*106, h-((2)*56), 106, 56, keypadButtonImagesPS[i], keypadButtonRollImagesPS[i], keypadButtonDownImagesPS[i]);
    }
    else {
      keypadImageButtons[i] = new ImageButtons((i%3)*106, h-((1)*56), 106, 56, keypadButtonImages[i], keypadButtonRollImages[i], keypadButtonDownImages[i]);
      keypadImageButtonsPS[i] = new ImageButtons((i%3)*106, h-((1)*56), 106, 56, keypadButtonImagesPS[i], keypadButtonRollImagesPS[i], keypadButtonDownImagesPS[i]);
    }
    
    
  }
  textAlign(LEFT);
  fill(0, 102, 153, 204);
  frameRate(12);
  
  
  //member screen need to accept by app here.
  setPin.accept((IAppVisitor)app);

}

void draw() {
 

  textSize(32);
  String screen=app.screen();
  int sIndex=Arrays.asList(screens).indexOf(screen);
    background(screenImages[sIndex]);
  //System.out.print(screen);
  switch(screen) 
        { 
            case "PinScreen":
            //pinSetting();
                for (int i = 0; i<keypadButtons.length; i++)
                  {
                    keypadImageButtonsPS[i].update();
                    keypadImageButtonsPS[i].display();
                  }
                PinEntryMachine pm;
                pm=app.getPinEntryMachin();
                pinInput=pm.d1()+pm.d2()+pm.d3()+pm.d4();            
                fill(0, 102, 153, 204);
                for (int i =0; i < min(pinInput.length(),4); i++) {
                  text (pinInput.substring(i,i+1), 40+i*70, 90, 50, 50);
                }
              
              lines = app.screenContents().split("\n");
              if(lines[3].trim().equals("Invalid Pin")){
                      textSize(18);
                      textAlign(CENTER);
                      fill(255, 255, 255, 255);
                      text ("Invalid Pin", 20, 160, 270, 50);
              }
              break;
            case "SetPin":  //yinghua  project
              lines = app.screenContents().split("\n");
              pin=lines[5].trim().replace("[","").replace("]","");
              fill(0, 102, 153, 204);
              for (int i =0; i < min(pin.length(),4); i++) {
                text (pin.substring(i,i+1), 40+i*70, 90, 50, 50);
              } 
              break;
              
            case "MyCards":  
              a = 95;
              fill(255,255,255);
              font = loadFont("Georgia-50.vlw");
              lines = app.screenContents().split("\n");
               balance=lines[7];
               textFont(font);
                      textAlign(CENTER);
                      
                      //text (balance, 20, 160, 270, 50);
                      text (balance, 160, 330);
                      //loadDefaultFont();
              break;  
            case "AddCard":
              for (int i = 0; i<keypadButtons.length; i++)
              {
                keypadImageButtons[i].update();
                keypadImageButtons[i].display();
              }
              font = loadFont("YuGothic-Bold-20.vlw");
              lines = app.screenContents().split("\n"); 
              String cardId=lines[4].trim().replace("[","").replace("]",""); //assertEquals("[123456789]", lines[4].trim()); 
              String cardcode=lines[5].trim().replace("[","").replace("]",""); //assertEquals("[999]", lines[5].trim());
              textFont(font);
              fill(50);
              text (cardId, 96, 158);
              text (cardcode, 144, 199);
              loadDefaultFont();
              break;              
            case "MyCardsMoreOptions":
              lines = app.screenContents().split("\n");
              String ba = balance; 
              textAlign(CENTER);
              fill(255,255,255,255);
              text(ba,260, 130);
              break;
            case "MyCardsPay":
              font = loadFont("SegoeUI-Semibold-18.vlw");
              lines = app.screenContents().split("\n");
              cardId =lines[6].trim().replace("[","").replace("]","");           
              textAlign(CENTER);
              textFont(font);
              fill(50);
              //text (balance, 20, 160, 270, 50);
              //textSize(20);
              text (cardId, 75, 91, 225, 91);  
               if(kx==2 && (ky == 4) || (ky == 5) || (ky == 6))
               {
                 background(screenBlur);
                 textSize(20);
                 text (cardId, 75, 91, 225, 91); 
                 strokeWeight(3);
                 line(a, 110, a, 182);
                 a = a + 3.5;
                if (a > 275) { 
                  background(mycardPayTouch); 
                  kx = 3;
                  loadDefaultFont();
                  if(enablePay)
                  {
                   invokePay();
                   enablePay = false;
                  }
                }
                
               }
            
              break;
            case "Rewards":
              break;
            case "Settings":
              break;
            case "Store":
              break;
            case "Payments":
              break;
             
        }
     if (debug) {
       fill(0, 102, 153);
      textSize(25);
      textAlign(LEFT);
      fill(255, 255, 255, 255);
      //text (mouseX + " : " + mouseY, 0, 20, 270, 50);
      text ("-"+kx+"-"+ky+"-", 0, 20, 270, 50);
      
    }

}

boolean overMyCardsPayCircle() {
  float disX = 270 - mouseX;
  float disY = 225 - mouseY;
  int diameter = 60;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  //int x = 0;
  //int y = 260;
  //int button_width = 106;
  //int button_height = 55;
 
  
  Point kpRowColumn=new Point(3,8);
  Point kpLeftTop=new Point(0,headerHeight);  //260:keypad;40:touch
  Point buttonSize=new Point(106,55);

  //int kx,ky;  //keypress at (kx,ky):4x3
  kx=((int)(mouseX - kpLeftTop.x))/((int)buttonSize.x)+1;
  ky=((int)(mouseY - kpLeftTop.y))/((int)buttonSize.y)+1;
  
  
  //boolean kpzone= ( ky > 4 && ky<9 && kx<=3 && kx>=1 );
  //boolean tzone= (fullScreen || ky <= 4 );
  if (app.screen().equals("MyCardsPay")) {
       if (overMyCardsPayCircle()) {
                kx = 3;  // set to some random keys
                ky = 3;  
              }
     }
     
    if (app.screen().equals("Settings")) {
       if ((kx == 1 || kx == 2 || kx == 3) && (ky == 1 || ky == 2 || ky == 3)) {
                kx = 2;  // set to some random keys
                ky = 1;  
              }
     }
  if (app.screen().equals("MyCards")) {
    if ((kx == 2 && ky == 4) || (kx == 3 && ky == 3)) {
      kx = 1;  // set to some random keys
      ky = 4; 
    }
    if ( mouseX >= 60 && mouseX <= 260 &&
      mouseY >= 295 && mouseY <= 370) { 
      kx = 2;
      ky = 4;
    }
    
    if (overMyCardsPayCircle()){
      kx = 3;
      ky = 3;
      enablePay = true;
    }    
  }

  if((kx>=1 && kx<=kpRowColumn.x) && (ky>=1 && ky<=kpRowColumn.y)) {
    app.touch(kx,ky);
  }
  

  Point menuSize=new Point(w/5,55);
  String testS=app.screen();
  
  boolean hasMenu=(!app.screen().equals("PinScreen") && !app.screen().equals("AddCard")); //<>//
  if(hasMenu && ky==8) {
       char mA='A';
       int mIndex=((int)(mouseX - kpLeftTop.x))/((int)menuSize.x);
       char mTrigger=(char)((int)mA+mIndex);
       app.execute(String.valueOf(mTrigger)) ;
  }
  
  if(app.screen().equals("AddCard")) {
    if(kx==3 && ky==1) app.next();
    if(kx==1 && ky==1) app.prev();
  }
  
  if(app.screen().equals("MyCards")) {
    if(kx==3 && ky==1) app.next();
  }

}


void loadDefaultFont()
{
 font = loadFont("SansSerif.plain-20.vlw");
 textFont(font);
}

void invokePay()
{
 app.touch(2,2); 
}

void pinSetting()
{
  update(mouseX, mouseY);
   println(rectOver);
   if (rectOver) {
    fill(color(#3C3C3C));
  } else {
    fill(color(#333333));
  }
  //stroke(141);
  font = loadFont("Calibri-Bold-18.vlw");
  rect(rectX, rectY, rectWidth, rectHeight, 10, 10,10,10);
  textAlign(CENTER, CENTER);
  fill(255);
  textFont(font, 18);
  //image(img,rectX+rectWidth-img.width-6,rectY+4);
  //textSize(13);
  text("Set Pin", rectX + (rectWidth / 2), rectY + (rectHeight / 2));
  
}

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
    rectOver = true;
  } 
  else {
    rectOver = false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
