// Art of Graphics Programming
// Section Example 001: "Basic Scenegraph: Node trees and nested matrices"
// Example Stage: B
// Course Materials by Patrick Hebron

import processing.opengl.*;

NodeTexture root;
NodeTexture childA; // NodeTexture childA;
NodeTexture childB;
NodeTexture childC;

void setup() {
  
  // In this example, we've extended the scenegraph node object to include a few basic geometric properties (see NodeGeom tab).
  // Most importantly, we've added the geometric transformations - translate, rotate and scale. 
  
  // To test the scenegraph system, we'll use the same node hierarchy as the last example,
  // but use NodeGeom's transformation properties to visualize the nodes as squares of varied size, location and color.
  // We'll again periodically toggle the visibility of a particular branch of the scenegraph (see below).
  
  // At this stage, NodeGeom only draws squares. After this, we'll look at how a variety of geometries are created, stored and drawn
  // in OpenGL, leading towards a generic geometry container based on NodeGeom.
  
  size( 500, 500, OPENGL );
    noStroke();
  
  root = new NodeTexture();
 root.setName( "root" );
 root.setColor( color( 255, 153, 0) );
//  root.setPosition( new PVector( 0.0, 0.0, 0.0 ) );
  //root.setDiameter( 50.0 );
   root.setPlanetSize(50);
  
 
  root.setTexture(loadImage("sun.jpg"));
 scale(5.0);
  
  childA = new NodeTexture();
  childA.setTexture(loadImage("world.jpg")); 
  childA.setName( "childA" );
  childA.setColor( color( 200, 0, 0 ) );
  childA.setPosition( new PVector( -100.0, 100, 0.0 ) );
 // childA.setDiameter( 25.0 );
  childA.setPlanetSize(20);
  

  
  root.addChild( childA );
  
  childB = new NodeTexture(); // new NodeTexture();
  childB.setTexture(loadImage("mars.jpg"));
  childB.setName( "childB" );
  childB.setColor( color( 0, 200, 100 ) );
//  childB.setPosition( new PVector( 0.0, (position of childA) 100.0, 0.0 ) );
  childB.setPosition( new PVector( 0.0 , 60, 0.0 ) );
 // childB.setDiameter( 12.0 );
  childB.setPlanetSize(15);
  


  
  childA.addChild( childB );
  
  childC = new NodeTexture();
  childC.setTexture(loadImage("moon.jpg"));
  childC.setName( "childC" );
  childC.setColor( color( 0, 100, 200 ) );
  childC.setPosition( new PVector( 40.0, 0.0, 0.0 ) );
  //childC.setDiameter( 10.0 );
  childC.setPlanetSize(15);
  
  
  
  childA.addChild( childC );
  
  /*NodeGeom childA1 = new NodeGeom();
  childA1.setName( "childA1" );
  childA1.setColor( color( 255, 128, 0 ) );
  childA1.setPosition( new PVector( -50.0, 0.0, 0.0 ) );
  childA1.setDiameter( 12.5 );
  childA.addChild( childA1 );
  
  NodeGeom childA2 = new NodeGeom();
  childA2.setName( "childA2" );
  childA2.setColor( color( 255, 0, 128 ) );
  childA2.setPosition( new PVector( 0.0, 50.0, 0.0 ) );
  childA2.setDiameter( 12.5 );
  childA.addChild( childA2 );
  
  NodeGeom childB1 = new NodeGeom();
  childB1.setName( "childB1" );
  childB1.setColor( color( 0, 255, 128 ) );
  childB1.setPosition( new PVector( 0.0, 50.0, 0.0 ) );
  childB1.setDiameter( 12.5 );
  childB.addChild( childB1 );
  
  NodeGeom childC1 = new NodeGeom();
  childC1.setName( "childC1" );
  childC1.setColor( color( 0, 128, 255 ) );
  childC1.setPosition( new PVector( 50.0, 0.0, 0.0 ) );
  childC1.setDiameter( 12.5 );
  childC.addChild( childC1 );
  
  NodeGeom childA1A = new NodeGeom();
  childA1A.setName( "childA1A" );
  childA1A.setColor( color( 255, 128, 128 ) );
  childA1A.setPosition( new PVector( -25.0, 0.0, 0.0 ) );
  childA1A.setDiameter( 6.25 );
  childA1.addChild( childA1A );
*/
}

void draw() {
  
  
  
  
  // Clear window
  background( 0 );
  lights();
  noStroke();
  ambientLight(40,40,40);
  directionalLight(100, 100, 90, 1, -1, 0);
  spotLight(200, 200, 200, 0, 200, 0, -1, -1, 0, PI/8, 200);
  // Translate to center of screen
  translate( width/2, height/2, 0.0 );
 // rotateY(spin);
  // Draw the scenegraph
  root.draw();
  // Increment the root node's rotation
  // The root's children will rotate with it
  root.getRotation().z += 0.01;
  childA.getRotation().z += 0.05;

  
 //  if (spin <= TWO_PI) spin = spin + 0.01;
 // else spin = 0.0;
   
 // if (d < 360) d++;
 // else d = 0;

  
  
  
  /*if( frameCount % 60 == 0 ) {
    println("-----------------");
    // Print the scenegraph
    root.print( 0 );
    // Toggle childA's visibility
    NodeGeom childA = (NodeGeom)root.getChild( 0 );
    // NodeGeom's getChild() method will safely prevent invalid array access,
    // but if a child does not exist at the given index 0, the parent will return null.
    // So before operating on the child, we need to make sure the returned object is valid.
    if( childA != null ) {
      // Notice that when childA's visibility is turned off, all of its children and grandchildren
      // become invisible as well. Without a scenegraph, we would have needed to toggle each
      // descendant node individually.
      childA.toggleVisibility();
    }
  }*/
}
