import java.util.*;
import java.util.Collections;
ArrayList <PVector> points = new ArrayList<PVector>();
char button;
PVector P0;
void setup() {
  size(600, 600);
  frameRate(60);
  background(0);
  println("The num in setup: "+ points.size());
  /*PVector a= new PVector(0,3);
  PVector b= new PVector(1,1);
  PVector c= new PVector(2,2);
  PVector d= new PVector(4,4);
  PVector e= new PVector(0,0);
  PVector f= new PVector(1,2);
  PVector g= new PVector(3,1);
  PVector k= new PVector(3,3);
  points.add(a);
  points.add(b);
  points.add(c);
  points.add(d);
  points.add(e);
  points.add(f);
  points.add(g);
  points.add(k);*/
  //points.add(PVector(0,3));
}

 void draw() {
  //image(bg, 0, 0);
  //println(points.size());
  int n = points.size();
  if(n>3 && key!='\0')
  {
    convexHull(points, n);
    
  }
  
  
}


void keyPressed()
{
  button=key;
}

void mousePressed()
{
  if(key=='\0')
  {
    PVector p=new PVector(mouseX,mouseY);
    points.add(p);
    ellipse(p.x,p.y,20,20);
  }
  
  /*else if( key!='\0')
  { 
    int n = points.size();
    
    convexHull(points, n);
  }*/
  
  
  
}





PVector nextToTop( Stack <PVector> S)
{
    PVector p = S.peek();
    S.pop();
    PVector res = S.peek();
    S.push(p);
    return res;
}

float distSq(PVector p1, PVector p2)
{
    return (p1.x - p2.x)*(p1.x - p2.x) +
          (p1.y - p2.y)*(p1.y - p2.y);
}

int orientation(PVector p, PVector q, PVector r)
{
    float val = (q.y - p.y) * (r.x - q.x) -
              (q.x - p.x) * (r.y - q.y);
 
    if (val == 0) return 0;  // colinear
    return (val > 0)? 1: 2; // clock or counterclock wise
}

void swap(PVector p1, PVector p2)
{
    PVector temp = p1;
    p1 = p2;
    p2 = temp;
}


int compare(PVector p1, PVector p2)
{
   
   // Find orientation
   int o = orientation(P0, p1, p2);
   if (o == 0)
     return (distSq(P0, p2) >= distSq(P0, p1))? -1 : 1;
 
   return (o == 2)? -1: 1;
}

int m = 1;

void convexHull (ArrayList <PVector> points, int n)
{
   Collections.sort(points, new SortByY());
   P0=points.get(0);  
   points.remove(0);
   Collections.sort(points, new SortByPolarAngle());
   points.add(0,P0);
   
    for (int i=1; i<n; i++)
   {
       // Keep removing i while angle of i and i+1 is same
       // with respect to p0
       while (i < n-1 && orientation(P0, points.get(i),points.get(i+1)) == 0)
       {
          i++;
       }         
       if (i==n || i>n || m==n)
       {
         break;
       }
       
       println("the i is: "+ i +"the m is: "+ m);
       points.set(m, points.get(i));
       
       m++;  // Update size of modified array
   }
    if (m < 3) return;
    Stack<PVector> S =new Stack<PVector>();
   S.push(points.get(0));
   S.push(points.get(1));
   S.push(points.get(2));
   
    for (int i = 3; i < m; i++)
   {
      // Keep removing top while the angle formed by
      // points next-to-top, top, and points[i] makes
      // a non-left turn
      while (orientation(nextToTop(S), S.peek(), points.get(i)) != 2)
         S.pop();
      S.push(points.get(i));
   }
   
   smooth();
   noFill();
   stroke(255);
   beginShape();
    PVector pp = S.peek();
    
    curveVertex(pp.x,pp.y);
     
   while (!S.empty())
   {
       PVector p = S.peek();
       curveVertex(p.x,p.y);
       //cout << "(" << p.x << ", " << p.y <<")" << endl;
       //println("("+ p.x+","+p.y+")");
       /*if(S.size()==1)
       {
         curveVertex(S.peek().x,S.peek().y);
       }*/
       S.pop();
   }
   curveVertex(pp.x,pp.y);
   curveVertex(pp.x,pp.y);
    endShape();
     //fill(255, 0, 0);
     // noStroke();
      
      
}
  //float ymin = points.get(0).y;int min = 0;
  /*for (int i = 1; i < n; i++)
   {
     float y = points.get(i).y;
 
     // Pick the bottom-most or chose the left
     // most point in case of tie
     if ((y < ymin) || (ymin == y && points.get(i).x < points.get(min).x))
        ymin = points.get(i).y; 
        min = i;
   }
    //swap(points[0], points[min]);
    PVector P1; PVector P2;
    P1=points.get(0);
    P2=points.get(min);
    points.set( 0,P2);
    points.set(min,  P1);*/
    //P0=points.get(0);
    
    
  