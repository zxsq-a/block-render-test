PImage img;
int smallPoint, largePoint;
int blockWidth, blockHeight, xLoopMult, yLoopMult;

void setup() {
  size(1120, 700);
  img = loadImage("moonwalk.jpg");
  smallPoint = 4;
  largePoint = 10;
  xLoopMult = 1;
  yLoopMult = 1;
  blockWidth = 100;
  blockHeight = 100;
  imageMode(CENTER);
  noStroke();
  background(255);
}
void drawLine(int yVal){
  float pointillize = random(smallPoint, largePoint);
  for(int ix=(0+((xLoopMult-1)*blockWidth)); ix<(blockWidth*xLoopMult); ix++){
    color pix = img.get(int(ix), int(yVal));
    fill(pix,255);
    ellipse(ix, yVal, pointillize, pointillize);
  }
}
void draw() {
  
  for(int ix=0; ix<(blockWidth*xLoopMult); ix++){
    for(int iy=0/*(0+((yLoopMult-1)*blockHeight))*/; iy<(blockHeight*yLoopMult) && (blockHeight*yLoopMult <= height); iy++){
      drawLine(iy);
    }
  }
  //xLoopMult++;
  if(blockWidth*(xLoopMult+1) > width && blockHeight*(yLoopMult+1) < height){
    xLoopMult = 1;
    yLoopMult++;
  }else if(blockWidth*(xLoopMult+1) <= width && blockHeight*(yLoopMult+1) < height){
    xLoopMult++;
  }else if(blockWidth*(xLoopMult+1) > width && blockHeight*(yLoopMult+1) > height){
    return;
  }
}
