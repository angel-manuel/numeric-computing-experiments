
a = 1;

function setup() {
  size(600, 600);
}

function draw() {
  ellipse(300, 300, a, a);
  a = a * 2;
}

