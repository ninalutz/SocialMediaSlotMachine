/*------------------------------------------------------------------------
  Example sketch for Adafruit Thermal Printer library for Arduino.
  Demonstrates the available gamut of barcodes.
  See 'A_printertest' sketch for a more generalized printing example.

  BARCODE AVAILABILITY VARIES WITH FIRMWARE.  Not all barcodes may be
  displayed, this is normal.  Sketch may need changes for older firmware.
  ------------------------------------------------------------------------*/

#include "Adafruit_Thermal.h"

// Here's the syntax when using SoftwareSerial (e.g. Arduino Uno) --------
// If using hardware serial instead, comment out or remove these lines:

//32 characters per line, so make sure processing outputs correctly

#include "SoftwareSerial.h"
#define TX_PIN 6 // Arduino transmit  YELLOW WIRE  labeled RX on printer
#define RX_PIN 5 // Arduino receive   GREEN WIRE   labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial);     // Pass addr to printer constructor
// Then see setup() function regarding serial & printer begin() calls.

// Here's the syntax for hardware serial (e.g. Arduino Due) --------------
// Un-comment the following line if using hardware serial:

//Adafruit_Thermal printer(&Serial1);      // Or Serial2, Serial3, etc.

// -----------------------------------------------------------------------

String Thing = "Hello there,";
int redPin = 8;
int greenPin = 9;
int bluePin = 10;
int buttonPin = 13;

int buttonState = 0;
int t = 1;
int timebutton = 0;
int timesincebutton = 0;
int val = 0;
int emotion = 1;

boolean printed = false;
boolean startprint = false;
boolean colors = false;

void setup() {
  pinMode(buttonPin, INPUT);

  Serial.begin(9600);

  setColourRgb(0,0,0);
}

void loop() {
  
  
//To processing
//  Serial.println("Hello, world!");

//From processing
   if (Serial.available()) 
   { // If data is available to read,
     val = Serial.read(); // read it and store it in val
   
   if (val == '1') 
   { // If 1 was received
     setColourRgb(0, 0, 255);
   }
   }


  buttonState = digitalRead(buttonPin);

  if(buttonState == HIGH){
     timesincebutton = 0;
     t+=1;
    colors = true;
    printed = false;
    }

  unsigned int rgbColour[3];

  if(colors == true){
  rgbColour[0] = 0;
  rgbColour[1] = 0;
  rgbColour[2] = 0;  
    timesincebutton+=1;
      if(printed == false){
          rgbColour[0] = 255;
         rgbColour[1] = 0;
        rgbColour[2] = 0;  
  for (int decColour = 0; decColour < 3; decColour += 1) {
    int incColour = decColour == 2 ? 0 : decColour + 1;

    // cross-fade the two colours.
    for(int i = 0; i < 255; i += 1) {
      rgbColour[decColour] -= 1;
      rgbColour[incColour] += 1;
      
      setColourRgb(rgbColour[0], rgbColour[1], rgbColour[2]);
      delay(1);
    }
  }
  }
    }

  if(printed == true){
    if(emotion == 0 || emotion == 1){
      //anger
     setColourRgb(255, 0, 0);
    }
   else if(emotion == 2){
      //sad
    setColourRgb(0, 18, 234);
      }
   else if(emotion == 3){
      //happy
    setColourRgb(255, 255, 0);
      }
   else if(emotion == 4){
      //fear
      setColourRgb(0, 117, 63);
      }  
//    else{
//      setColourRgb(0, 255, 0);  
//      }
    }

  if(timesincebutton > 10){
    startprint = true;
    timesincebutton = 0;
    colors = false;
    }

    
  if(printed == false && startprint == true){
          // This line is for compatibility with the Adafruit IotP project pack,
  // which uses pin 7 as a spare grounding point.  You only need this if
  // wired up the same way (w/3-pin header into pins 5/6/7):
  pinMode(7, OUTPUT); digitalWrite(7, LOW);

  mySerial.begin(19200);  // Initialize SoftwareSerial
  //Serial1.begin(19200); // Use this instead if using hardware serial
  printer.begin();        // Init printer (same regardless of serial type)

  printer.justify('C');
  printer.boldOn();
  printer.println();

  if(emotion == 0){
    printer.println("This is what propaganda looks");
    printer.println("like as CNN normalizes the");
    printer.println("maniac. There's no disagreement");
    printer.println("CNN. Report facts instead of");
    printer.println("reality TV garbage.");
     printer.println();
      printer.println();
       printer.println();
    }

  if(emotion == 1){
    printer.println("Reading #Aleppo tweets and");
    printer.println("reminded of @PGourevitch 'we");
    printer.println("wish to inform you that tomorrow");
    printer.println("we will be killed with our");
    printer.println("families' - devastating");
     printer.println();
      printer.println();
       printer.println();
    }


  if(emotion == 2){
    printer.println("All 5 of our AWESOME TAs :) ..");
    printer.println("(oops, looks like 6). Thanks for");
    printer.println("a spectacular semester! #009rtm");
     printer.println();
      printer.println();
       printer.println();
    }

  if(emotion == 3){
    printer.println("Recent hack on Russia's central");
    printer.println("bank attempted to steal a total");
    printer.println("of $45 million. Fortune has the");
    printer.println("story. http://for.tn/2hka34");
     printer.println();
      printer.println();
       printer.println();
    }
  
  printer.println();
  printer.boldOff();
  printer.justify('L');

  printer.feed(2);
  printer.setDefault(); // Restore printer to defaults
    printed = true;
    emotion+=1;
    startprint = false;
    }
  
}


void setColourRgb(unsigned int red, unsigned int green, unsigned int blue) {
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);
 }
