import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;

 int angle;
  
   import processing.serial.*;
   Serial port;
    public void setup() {
  // set window, P3D = 3D rendering
      size(720, 720, P3D);
    noFill();
      stroke(255);

  // set LEAP object
  leap = new LeapMotionP5(this);

  // set com port. Currently: "/dev/tty.usbmodemfd121"
  println("Available serial ports:");
  println(Serial.list());
  port = new Serial(this,Serial.list()[1], 9600);
 }
 
 
public void draw() {
  background(0);
      fill(255);
  for (Finger f : leap.getFingerList()) {
    PVector position = leap.getTip(f);
    //PVector velocity = leap.getVelocity(f);
       ellipse(position.x, position.y, 10, 10);
    if (position.y > 720) {
      angle = 180;
    } else if (position.y < 0) {
      angle = 0;
    } else {
      angle = int((position.y) / 4);
    }
    port.write(angle);
    println(angle);
  }
}

public void stop() {
  leap.stop();
 }
