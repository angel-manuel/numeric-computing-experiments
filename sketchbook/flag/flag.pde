PImage flag_img;
int px, py;
int w, h;
float time, dt;
float A, B;

void setup() {
  time = 0;
  dt = 0.05;
  frameRate(40);
  
  A = 15.0;
  B = 0.75;
  
  w = 450;
  h = 300;
  px = 15;
  py = 10;
  size(600, 480, P3D);
  flag_img = loadImage("flag_img.png");
  textureMode(NORMAL);
  noStroke();
}

void draw() {
  float dx, dy;
  int f, c;
  float fpx = (float)(px), fpy = (float)(py);
  
  dx = w/px;
  dy = h/py;
  
  background(0);
  
  beginCamera();
  camera();
  rotateY(-PI/6);
  rotateX((float)(mouseX-300)/1000);
  rotateY((float)(mouseY-240)/1000);
  translate(-100, 0, -100);
  endCamera();
  
  for(f = 0; f < py; ++f) {
    beginShape(QUAD_STRIP);
    texture(flag_img);
    vertex(100, 100 + f*dy, A*sin(time), 0, ((float)(f))/fpy);
    for(c = 0; c < px; ++c) {
      vertex(100 + c*dx, 100 + (f+1)*dy, A*sin(time + c*B),
      ((float)(c))/fpx, ((float)(f+1))/fpy);
      vertex(100 + (c+1)*dx, 100 + f*dy, A*sin(time + (c+1)*B),
      ((float)(c+1))/fpx, ((float)(f+0))/fpy);
    }
    vertex(100 + px*dx, 100 + (f+1)*dy, A*sin(time + px*B),
    1, ((float)(f+1))/fpy);
    endShape();
  }
  
  time += dt;
}
