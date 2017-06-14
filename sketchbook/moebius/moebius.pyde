def setup():
    frameRate(1)
    size(600, 600, P3D)
    
def linspace(a, b, step):
    ret = []
    
    while a <= b:
        ret.append(a)
        a = a + step
    
    return ret

def draw():
    background(255)
    s = 20
    r = 100
    translate(300, 300, 100)
    fill(200, 80, 0)
    beginShape(QUAD_STRIP)
    for tau in linspace(0, 6.29, 0.02):
        rho = 3.14*(tau/6.28)
        disA = r+s*sin(rho)
        zA = s*cos(rho)
        disB = r-s*sin(rho)
        zB = s*cos(rho)
        xA, yA = (disA*cos(tau), disA*sin(tau))
        xB, yB = (disB*cos(tau), disB*sin(tau))
        vertex(xA, yA, zA)
        vertex(xB, yB, zB)
        
    endShape();
        
        
        
