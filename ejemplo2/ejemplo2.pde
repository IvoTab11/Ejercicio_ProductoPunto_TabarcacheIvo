Vector vectorPersonaje;
PVector posicionTesoro;
Vector vectorPersonajeTesoro;

public void setup(){
  size(400,400);
  vectorPersonaje = new Vector(new PVector(0,0),new PVector(20,0));
  posicionTesoro = new PVector(width/2,height/2);
  vectorPersonajeTesoro = new Vector();
}

public void draw(){
  background(255);
  dibujarTesoro();
  vectorPersonaje.setOrigen(new PVector(mouseX,mouseY));
  vectorPersonaje.display();
  dibujarVectorPersonajeTesoro();
  escribirMensaje();
}

public void dibujarVectorPersonajeTesoro(){
  vectorPersonajeTesoro.setOrigen(vectorPersonaje.getOrigen());
  vectorPersonajeTesoro.setDestino(PVector.sub(posicionTesoro,vectorPersonaje.getOrigen()).normalize().mult(20));
  vectorPersonajeTesoro.display();
}

public void dibujarTesoro(){
  strokeWeight(10);
  point(posicionTesoro.x,posicionTesoro.y);
}

public void escribirMensaje(){
  float productoPunto = vectorPersonaje.obtenerProductoPunto(vectorPersonajeTesoro);
  fill(0);
  text(productoPunto, 20, 350);
  if(productoPunto>0f){
    text("Adelante",100,40);
  }else{
    if(productoPunto<0){
     text("Atras",100,40);
    }else{
      text("En la misma linea",100,40);
    }
  }
}
