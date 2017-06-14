PImage flag_img

def setup():
    size(600, 480, P3D)

def draw():
    background(255)
    beginShape(QUAD_STRIP)
    vertex(100, 100, 0)
    vertex(100, 300, 0)
    vertex(300, 100, 0)
    vertex(300, 300, 0)
    endShape()
