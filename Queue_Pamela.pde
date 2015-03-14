/*Yessica Pamela Flores Subias 
A01337297
302
Queue Animation
#IBCS2
Profesor: José Vega Cebrian 
*/

int[] a;
int QUEUE_SIZE;
int front;
int back;
int n=-1;

void setup(){

 QUEUE_SIZE = 6;
 a = new int[QUEUE_SIZE];
 back = -1; // Queue is empty
 front= -1;
 size(900,700,P3D);
 float fov =PI/3.0;
 float cameraz=(height/2.0)/tan(fov/2.0);
 perspective(fov, float(width)/float(height),cameraz/100.0,cameraz*10.0); 
}
void draw(){
  background(0);
  //Text statements 
  String s = "Stack Representation";
  String f = "Press:";
  String k = "1: Yellow 2: Pink 3: Green" ;
  String l="4:blue 5:Purple and f:dequeue";
  String h="Queue size: 6";  
  textSize(10);
  text(s, -30, -20,-20);  // Specify a z-axis value
  textSize(5);
  text(f, -20, 20,-20);
  text(k, -20, 30,-20);
  text(l, -20, 35,-20);
  text(h, -20,40,-20);
  camera(100*mouseX/500.0-50, -45*mouseY/500.0, 45,  0,0,0,  0,1,0);
  
  //Static Box shows color of the dequeue box 
  fill(255);
  if(n==1) fill(#FFEC94);
  else if(n==2) fill(#FFAEAE);//colors are in hexadecimal
  else if(n==3) fill(#B0E57C);
  else if(n==4) fill(#B4D8E7);
  else if(n==5) fill(#C3C3E5);
  pushMatrix();
  translate(0,0,10);
  box(5);
  popMatrix();

  //Draws the boxes
  for(int j=front+1;j<=back;j++){
   if (a[j]==1) fill(#FFEC94);
   else if(a[j]==2) fill(#FFAEAE);
   else if(a[j]==3) fill(#B0E57C);
   else if(a[j]==4) fill(#B4D8E7);
   else if(a[j]==5) fill(#C3C3E5);
   box(5);
   translate(0,-5,0);
  }
}

//enqueue
int enqueue(int number){ 
  if(back+1 < QUEUE_SIZE){ 
     back = back+1;//states the position of back 
     a[back] = number;//Keeps the color that the user introduce
     return 0; 
  }
  else{
    return -1; 
  }
}

int dequeue(){
    if(front==back){
    front=-1;
    back=-1;
  }
  if(front< back){
    front =front+1;//states the front  
    n=a[front];//Keeps the color of the stationary box
    return 0;
  }
  else{
    return -1; 
  } 
}
void keyReleased()
{
   if (key == '1') enqueue(1); //yellow 
  else if (key == '2') enqueue(2);//pink
  else if (key == '3') enqueue(3);//green 
  else if (key == '4') enqueue(4);//blue
  else if (key == '5') enqueue(5);//purple
  else if(key=='f') dequeue(); //dequeue
}
