
#include <Servo.h>
Servo myServo;
Servo myServo1;


//int handPos;
//int angle;


void setup() {
  myServo.attach(2);
  myServo1.attach(3);
  Serial.begin(9600);
  myServo.write(0);
  myServo1.write(0);
}


void loop() {
  byte angle;

  if (Serial.available()) {
    // Read angle from Processing
    angle = Serial.read();
    Serial.println(angle);
    // If fingers in window, read servo angle
    myServo.write(angle);
     myServo1.write(180-angle);

  }
}
