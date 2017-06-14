l = 50.0
n = 10
tex = loadImage("img.png")

def setup():
    global l, n
    
    textureMode(NORMAL)
    \\noStroke()
    
    h = l*sqrt(3)/2.0
    
    size(int(n*l), int(n*h), P3D)
    frameRate(20)
    stroke(0, 0, 0)
    strokeWeight(3)

def draw():
    global tex
    
    background(0)
    prop = sqrt(3)/2.0
    h = l*prop
    
    tud = map(mouseX, 0, 600, 0, 0.4) 
    tvd = map(mouseY, 0, 600, 0, (1 - prop*0.6))
    
    tul = [u + tud for u in [0, 0.6, 0.3]]
    tvl = [v + tvd for v in [0, 0, prop*0.6]]
    
    beginShape(TRIANGLES)
    texture(tex)
    for y in range(0, n):
        for x in range(0, n+1):
            desp = 0.5*(y%2) - 1
            td = x - (y % 2)
            
            x = x + desp
            
            vertex(x*l, y*h, 0, tul[(0+td) % 3], tvl[(0+td) % 3])
            vertex((x+1)*l, y*h, 0, tul[(1+td) % 3], tvl[(1+td) % 3])
            vertex((x+0.5)*l, (y+1)*h, 0, tul[(2+td) % 3], tvl[(2+td) % 3])
            
            vertex((x+0.5)*l, (y+1)*h, 0, tul[(2+td)%3], tvl[(2+td)%3])
            vertex((x+1)*l, y*h, 0, tul[(1+td)%3], tvl[(1+td)%3])
            vertex((x+1.5)*l, (y+1)*h, 0, tul[(0+td)%3], tvl[(0+td)%3])
            
    endShape();
