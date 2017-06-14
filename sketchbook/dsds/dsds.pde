
int a = 0;

void setup() {
  size(600, 600);
  frameRate(1);
}

void recur(int l, int x, int y, int w, int h) {
  if(l == 0) {
    rect(x, y, w, h);
  } else {
    recur(l - 1, x, y, w/2, h/2);
    recur(l - 1, x + w/2, y, w/2, h/2);
    recur(l - 1, x, y + w/2, w/2, h/2);
    recur(l - 1, x + w/2, y + w/2, w/2, h/2);
  }
}

void draw() {
  a += 1;
  recur(a, 200, 200, 200, 200);
}

