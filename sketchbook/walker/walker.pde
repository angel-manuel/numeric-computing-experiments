
void setup() {
  size(600, 600);
  frameRate(10);
  //noStroke();
  strokeWeight(20);
  background(0);
}

float f(float x) {
  return x;
  //return sqrt(x*x*x);
  //return (x > 0.5) ? 1.0 : 0.0;
  //return sin(x*(3.141592/2.0));
}

float div(int a, int b) {
  return ((float)a)/((float)b);
}

void draw() {
  int n = 10;
  int i;
  float x0, y0, x1, y1;
  float x, y;
  float lx, ly;
  float l;
  int c, c1, c2;
  
  x0 = random(600.0);
  y0 = random(600.0);
  x1 = random(600.0);
  y1 = random(600.0);
  
  c1 = color((int)random(255.0), (int)random(255.0), (int)random(255.0));
  c2 = color((int)random(255.0), (int)random(255.0), (int)random(255.0));
  
  lx = x0;
  ly = y0;
  for(i = 1; i <= n; i++) {
    l = div(i, n);
    c = lerpColor(c1, c2, f(l));
    
    x = x0 + (x1-x0)*l;
    y = y0 + (y1-y0)*l;
    
    //fill(c);
    stroke(c);
    //point(x, y);
    line(lx, ly, x, y);
    
    lx = x;
    ly = y;
  }
}
