/* Show horse running around with alps in the background, and sand on the ground */

//http://glgraphics.sourceforge.net/

import processing.opengl.*;
import javax.swing.*; //for popupmenues!
import java.awt.event.*; //for popupmenues!
float x=0;
float z = 0;
float zdecay = 0;
PImage b;
PImage sand;
float ortx = 0;
float orty = 50;
float ortz = 75;

void setup(){
  size(400, 400, OPENGL);
  smooth();
  noFill();
  b = loadImage("alps.jpg");
  kak
  sand = loadImage("sandy.jpg");
  
  final JPopupMenu menu = new JPopupMenu();
   
   // Create and add a menu item
   JMenuItem item = new JMenuItem("Item Label 1");
   item.addActionListener(new ActionListener() {
       void actionPerformed(ActionEvent e) {
           System.out.println("Item Label 1");
       }
   });
   menu.add(item);
   item = new JMenuItem("Item Label 2");
   menu.add(item);
   
   // Set the component to show the popup menu
   addMouseListener(new MouseAdapter() {        
       public void mouseReleased(MouseEvent evt) {
           //if (evt.isPopupTrigger()) {
               menu.show(evt.getComponent(), evt.getX(), evt.getY());
           //}
       }
   });
  
  
}

void draw(){
  background(204);
  pushMatrix();
  rotateX(PI/2);
  rotateZ(PI);
  image(b,-300,-400);
  popMatrix();
  image(sand, -300, 0);
  camera(0, 400, 60.0, 20.0+4*sin(x/4), 20.0, 20.0,   0.01*sin(x), 0.0, -1.0);
  
    x+=0.01;
  

  if(keyPressed) {
    if (key == 'b' || key == 'B') {
      zdecay = 0.2;
    }
  }
  z-=zdecay;

  float sfx = 45*sin(x);   
  float sfy = 45*cos(x);
  float sfz = z;
  drawSphere(sfx + ortx, sfy + orty, ortz + sfz, 50);
  //huvud
  drawSphere(sfx + ortx - 15*cos(x), sfy + orty -15*sin(x), ortz + sfz + 40+10*sin(5*x), 30); //orka tänka!
  drawLeg(ortx + sfx, sfy + orty, sfz + ortz, 0, 10, x);
  drawLeg(ortx + sfx, sfy + orty, sfz + ortz, PI/2, 10, x);
  drawLeg(ortx + sfx, sfy + orty, sfz + ortz, PI, 10, x);
  drawLeg(ortx + sfx, sfy + orty, sfz + ortz, 3*PI/2, 10, x);  
}

void drawLeg (float x, float y, float z, float arg, float s, float angular){
  drawSphere(30*sin(arg) + x, y + 30*cos( arg), z - 50, s);
  drawSphere(30*sin(arg + 0.1*sin(5*angular)) + x, y + 30*cos( arg + 0.1*sin(5*angular)), z - 70, s);  
}

//recursiveness
void drawSphere(float x, float y, float z, float s){
  pushMatrix();
  translate(x,y,z);
  //the sphere look:
  //stroke(242,24,24,240);
  stroke(0,0,0,255);
  //noStroke();
  fill(127,127,127);
  sphereDetail(10);
  sphere(s);
  popMatrix();
  

}
  

