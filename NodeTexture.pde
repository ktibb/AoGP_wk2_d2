class NodeTexture extends NodeGeom { 
  // texture properties:
  PShape planet;
  float globeRadius = 1;


  //PVector mPosition, mRotation, mScale;
  // Rendering properties:
  //color mColor;
  //float mDiameter;


  NodeTexture() {
    // Initialize base class (NodeGeom)
    super();
    // Initialize transformations
    //mPosition   = new PVector( 0.0, 0.0, 0.0 );
    //mRotation   = new PVector( 1.0, 0.0, 0.0 );
    //mScale      = new PVector( 1.0, 1.0, 1.0 );
    // Initialize properties
    //mColor      = color( 255, 255, 255 );
   // mDiameter = 1.0;

   
  // initialize the PShape
  planet = createShape (SPHERE, globeRadius);

  }

  void setPlanetSize(float planetSize){
    planet.scale(planetSize, planetSize, planetSize);
  }

  void setTexture(PImage img){
    // save the image
    planet.texture(img);
    // so you can use it in draw
    // set the image to be the texture of the PShape
  }

  void draw(){
    // do something
  
      
    // Draw node if visible
    if ( getVisibility() ) {
      // Enter node's transformation matrix
      pushMatrix();
      // Perform transformations
      translate( mPosition.x, mPosition.y, mPosition.z );
      scale( mScale.x, mScale.y, mScale.z );
      rotateX( mRotation.x );
      rotateY( mRotation.y );
      rotateZ( mRotation.z );
      // Draw node contents
      // For testing purposes, we'll just draw a rectangle
      //CHANGED TO ELLIPSE
      noStroke();
      //fill( mColor );
      //ellipse( -mDiameter/2.0, -mDiameter/2.0, mDiameter, mDiameter );
      // Draw children
      //sphere(mDiameter/2.0);
      // instead draw the PShape:
      shape(planet);
      
      
      int tChildCount = getChildCount();
      for (int i = 0; i < tChildCount; i++) {
        getChild(i).draw();
      }
      // Exit node's transformation matrix
      popMatrix();
    }
    
  
  }
}
