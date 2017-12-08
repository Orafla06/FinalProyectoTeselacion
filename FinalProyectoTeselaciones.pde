PImage  camaleon;

ArrayList <Figura> figuras;
float lado = 45;
float altura = sqrt(sq(lado) - sq(lado/2f));
float apotema = lado/ 2*tan(PI/6f);
float radio = altura - apotema;
float delta = 0;
void setup()
{
  camaleon= loadImage("camaleon.jpg");
  size(800,600);
  figuras = new ArrayList<Figura>();
  for (float j = radio; j<=height/2; j+= altura){
    int paso = (round((j - radio)/altura));
    float offset =0;
    if (paso%2 == 0){
      offset = lado/2f;
    }
    for (float i =-offset; i<=width/2; i+= lado){
      figuras.add(new Triangulo(i,j,lado,0));
    }
    for (float i =lado/2f-offset; i<=width/2; i+= lado){
      figuras.add(new Triangulo(i,j-apotema,lado,PI));
    }
  }
  

}

void draw()
{
  //delta += 0.01; 
  background(0);
    image(camaleon,-100,-50);
  noStroke();

  fill(0);
  for (Figura f: figuras){
    f.display();
  }
}

interface Figura
{
  float perimetro ();
  float area ();
  void display();
}


class Triangulo implements Figura
{
  float x,y,l,rc,ri,a,a1,deltax,deltay,h,b,rota;
  Triangulo (float x_,float y_,float l_, float rota_)
  {
    x=x_;
    y=y_;
    l=l_;
    rc=(l*sqrt(3))/3f;
    b=l;
    a1=TWO_PI/3;
    rota = rota_;
  }
  
  float perimetro ()
  {
    
   return l*3;
  }
  
  float area ()
  {
    return ((l*l)*(sqrt(3)))/4;
  }
  
  void display()
  {
    fill (random(20,180),random(20,180),150,random(180,200));
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI - PI/3+ rota);
    beginShape();
      for(float a = 0;a<TWO_PI*PI;a+=a1)
      {
    
        deltax=cos(a*HALF_PI)*rc+ (mouseX/0.9)/6;
        deltay=sin(a*HALF_PI)*rc+(mouseY/0.9)/6;
        vertex(deltax,deltay);
        
      }
      endShape(CLOSE);
      popMatrix();
  }
}