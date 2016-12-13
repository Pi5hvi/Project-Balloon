import java.util.*;
import java.util.Collections;
float a;
PVector v1, v2;
ArrayList <PVector> points = new ArrayList<PVector>();
ArrayList <PVector> points3 = new ArrayList<PVector>();
ArrayList <PVector> points2 = new ArrayList<PVector>();
ArrayList <PVector> points1 = new ArrayList<PVector>();
ArrayList <PVector> pppoints= new ArrayList<PVector>();
ArrayList <PVector> pppoints3= new ArrayList<PVector>();
ArrayList <PVector> pppoints2= new ArrayList<PVector>();
ArrayList <PVector> pppoints1= new ArrayList<PVector>();
ArrayList <PVector> Velocity=new ArrayList<PVector>();
ArrayList <PVector> Velocity1=new ArrayList<PVector>();
ArrayList <PVector> Velocity2=new ArrayList<PVector>();
ArrayList <PVector> Velocity3=new ArrayList<PVector>();
ArrayList <Float> Mag=new ArrayList<Float>();
ArrayList <Float> Mag1=new ArrayList<Float>();
ArrayList <Float> Mag2=new ArrayList<Float>();
ArrayList <Float> Mag3=new ArrayList<Float>();
float bx,bx1,bx2,bx3;
float by,by1,by2,by3;
int boxSize = 50;
boolean overBox = false;
boolean overBox1 = false;
boolean overBox2= false;
boolean overBox3 = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
char button;
float centerX,centerY,radius;
PVector P0;
import java.util.*;
PVector n=new PVector(0,0);
boolean option=false;
boolean option1=false;
boolean option2=false;
boolean option3=false;
boolean curvaturelock=false;
boolean curvaturelock1=false;
boolean curvaturelock2=false;
boolean curvaturelock3=false;
//ArrayList <Float> Mag;
void setup() {
   background(0);
   frameRate(1000);
  size(1000, 1000);
  
    
 /* centerX=centerY=500;
  radius=300;
 for (float x=0;x<width;)                                                                 //Find the potential poins(This is my initial attempt. No matter how I change the step size, the sampling points either too sparse or the memory overflow )
 {
   for(float y=0;y<height;)
   {
     float length=(float)Math.sqrt((2*x-centerX)*(2*x-centerX)+(y-centerY)*(y-centerY));
     //if(Math.abs(length-radius)<0.3&&Math.abs(length-radius)>0)
     if(Math.abs(length-radius)==0)
     {
       PVector point=new PVector(x,y);
       points.add(point);
     }
    
     y=y+1;
   }
   x=x+1;
 }
 */
  bx = width-200;                                   //initialize the coordinates of the button
  by = height-800;
  bx1= width-200;
  by1= height-600;
  bx2=width-200;
  by2=height-400;
  bx3=width-200;
  by3=height-200;
  rectMode(RADIUS);  
 /////////////////////////////////////////////////////
 for(float theta=0;theta<+2*PI;theta+=0.1)         //using superforluma to initialize the curve
 {
   float rad=r(theta,5,5,6,1,1,1);
   float x=rad*cos(theta)*50;
   float y=rad*sin(theta)*50;
   PVector point=new PVector(x,y);
   points.add(point);
 }
 //////////////////////////////////////////////////////
  for(float theta=0;theta<+2*PI;theta+=0.1)
 {
   float rad=r(theta,4,4,20,2,2,1);
   float x=rad*cos(theta)*50;
   float y=rad*sin(theta)*50;
   PVector point=new PVector(x,y);
   points1.add(point);
 }
////////////////////////////////////////////////////// 
 for(float theta=0;theta<+2*PI;theta+=0.1)
 {
   float rad=r(theta,4,4,8,4,3,2);
   float x=rad*cos(theta)*50;
   float y=rad*sin(theta)*50;
   PVector point=new PVector(x,y);
   points2.add(point);
 }
//////////////////////////////////////////////////////// 
   points3.add(new PVector(149,7));                      //initialize the logo of Batman
   points3.add(new PVector(131,14)); 
   points3.add(new PVector(122,22));
   points3.add(new PVector(113,25));
   points3.add(new PVector(106,33));
   points3.add(new PVector(102,36));
   points3.add(new PVector(97,41));
   points3.add(new PVector(91,45));
   points3.add(new PVector(84,49));
   points3.add(new PVector(78,53));
   points3.add(new PVector(75,60));
   points3.add(new PVector(70,63));
   points3.add(new PVector(63,73));
   points3.add(new PVector(60,79));
   points3.add(new PVector(46,93));
   points3.add(new PVector(37,99));
   points3.add(new PVector(28,115));
   points3.add(new PVector(24,120));
   points3.add(new PVector(20,127));
   points3.add(new PVector(16,135));
   points3.add(new PVector(15,145));
   points3.add(new PVector(12,158));
   points3.add(new PVector(13,164));
   points3.add(new PVector(17,160));
   points3.add(new PVector(33,151));
   points3.add(new PVector(42,143));
   points3.add(new PVector(53,141));
   points3.add(new PVector(59,140));
   points3.add(new PVector(62,139));
   points3.add(new PVector(67,139));
   points3.add(new PVector(78,142));
   points3.add(new PVector(84,144));
   points3.add(new PVector(90,145));
   points3.add(new PVector(100,150));
   points3.add(new PVector(107,157));
   points3.add(new PVector(109,165));
   points3.add(new PVector(122,176));
   points3.add(new PVector(127,183));
   points3.add(new PVector(131,189));
   points3.add(new PVector(134,194));
   points3.add(new PVector(141,192));
   points3.add(new PVector(145,188));
   points3.add(new PVector(151,183));
   points3.add(new PVector(160,179));
   points3.add(new PVector(164,177));
   points3.add(new PVector(170,177));
   points3.add(new PVector(176,178));
   points3.add(new PVector(180,179));
   points3.add(new PVector(193,181));
   points3.add(new PVector(203,196));
   points3.add(new PVector(216,199));
   points3.add(new PVector(223,203));
   points3.add(new PVector(229,213));
   points3.add(new PVector(236,221));
   points3.add(new PVector(240,233));
   points3.add(new PVector(244,242));
   points3.add(new PVector(247,251));
   points3.add(new PVector(249,263));
   points3.add(new PVector(252,270));
   points3.add(new PVector(256,262));
   points3.add(new PVector(258,255));
   points3.add(new PVector(259,250));
   points3.add(new PVector(262,244));
   points3.add(new PVector(266,236));
   points3.add(new PVector(270,229));
   points3.add(new PVector(275,219));
   points3.add(new PVector(284,207));
   points3.add(new PVector(286,202));
   points3.add(new PVector(290,197));
   points3.add(new PVector(295,195));
   points3.add(new PVector(299,191));
   points3.add(new PVector(307,183));
   points3.add(new PVector(312,182));
   points3.add(new PVector(321,178));
   points3.add(new PVector(330,179));
   points3.add(new PVector(337,179));
   points3.add(new PVector(347,179));
   points3.add(new PVector(354,176));
   points3.add(new PVector(352,182));
   points3.add(new PVector(358,187));
   points3.add(new PVector(362,190));
   points3.add(new PVector(367,189));
   points3.add(new PVector(372,185));
   points3.add(new PVector(375,178));
   points3.add(new PVector(380,171));
   points3.add(new PVector(385,168));
   points3.add(new PVector(390,164));
   points3.add(new PVector(393,158));
   points3.add(new PVector(401,154));
   points3.add(new PVector(410,139));
   points3.add(new PVector(422,142));
   points3.add(new PVector(438,139));
   points3.add(new PVector(451,141));
   points3.add(new PVector(457,139));
   points3.add(new PVector(470,146));
   points3.add(new PVector(474,145));
   points3.add(new PVector(483,159));
   points3.add(new PVector(481,148));
   points3.add(new PVector(488,166));
   points3.add(new PVector(494,157));
   points3.add(new PVector(490,151));
   points3.add(new PVector(489,144));
   points3.add(new PVector(487,138));
   points3.add(new PVector(482,126));
   points3.add(new PVector(479,119));
   points3.add(new PVector(473,109));
   points3.add(new PVector(468,102));
   points3.add(new PVector(459,85));
   points3.add(new PVector(454,79));
   points3.add(new PVector(449,72));
   points3.add(new PVector(436,61));
   points3.add(new PVector(433,58));
   points3.add(new PVector(424,52));
   points3.add(new PVector(418,45));
   points3.add(new PVector(408,39));
   points3.add(new PVector(398,30));
   points3.add(new PVector(394,25));
   points3.add(new PVector(390,22));
   points3.add(new PVector(382,17));
   points3.add(new PVector(375,16));
   points3.add(new PVector(369,8));
   points3.add(new PVector(364,7));
   points3.add(new PVector(356,5));
   points3.add(new PVector(358,8));
   points3.add(new PVector(366,16));
   points3.add(new PVector(371,23));
   points3.add(new PVector(374,28));
   points3.add(new PVector(378,34));
   points3.add(new PVector(381,43));
   points3.add(new PVector(380,51));
   points3.add(new PVector(373,62));
   points3.add(new PVector(363,70));
   points3.add(new PVector(355,73));
   points3.add(new PVector(347,75));
   points3.add(new PVector(333,77));
   points3.add(new PVector(317,71));
   points3.add(new PVector(307,68));
   points3.add(new PVector(291,52));
   points3.add(new PVector(286,45));
   points3.add(new PVector(282,37));
   points3.add(new PVector(280,30));
   points3.add(new PVector(278,22));
   points3.add(new PVector(277,4));
   points3.add(new PVector(273,12));
   points3.add(new PVector(266,20));
   points3.add(new PVector(261,23));
   points3.add(new PVector(253,25));
   points3.add(new PVector(241,22));
   points3.add(new PVector(236,16));
   points3.add(new PVector(231,14));
   points3.add(new PVector(225,9));
   points3.add(new PVector(222,5));
   points3.add(new PVector(224,12));
   points3.add(new PVector(225,19));
   points3.add(new PVector(221,30));
   points3.add(new PVector(220,31));
   points3.add(new PVector(217,48));
   points3.add(new PVector(207,44));
   points3.add(new PVector(205,66));
   points3.add(new PVector(190,70));
   points3.add(new PVector(186,74));
   points3.add(new PVector(177,76));
   points3.add(new PVector(170,76));
   points3.add(new PVector(162,75));
   points3.add(new PVector(152,74));
   points3.add(new PVector(146,72));
   points3.add(new PVector(137,68));
   points3.add(new PVector(135,63));
   points3.add(new PVector(128,64));
   points3.add(new PVector(124,60));
   points3.add(new PVector(120,52));
   points3.add(new PVector(122,42));
   points3.add(new PVector(128,32));
   points3.add(new PVector(135,23));
   points3.add(new PVector(136,19));
   points3.add(new PVector(141,14));
   points3.add(new PVector(145,9));
 
 
 
 ////////////////////////////////////////////////////////////////////////////
 //println("the size is"+ points.size());
 
 
 
  /*Collections.sort(points, new SortByY());               //sorting by position
   P0=points.get(0);                                     //
   points.remove(0);                                     //
   Collections.sort(points, new SortByPolarAngle());     //
   points.add(0,P0);    */                                 //
                                                           
   /*for(int i=0;i<points.size();i++)                      
  { 
   
    println("the position"+ i+ "is "+points.get(i));
    
  }*/
//////////////////////////////////////////////////////////////////////////////////////////////  
  pppoints.add(points.get(points.size()-1));                          //initialize, prepare for the calculation of curvature
 
  for (int i=0;i<points.size();i++)                         //                     
  {
    Velocity.add(n);
    Mag.add(i,2.0);
    pppoints.add(points.get(i));
  }
   pppoints.add(points.get(0));    
/////////////////////////////////////////////////////////////////////////////////////////////

 pppoints1.add(points1.get(points1.size()-1));                          //initialize
 
  for (int i=0;i<points1.size();i++)                         //                     
  {
    Velocity1.add(n);
    Mag1.add(i,2.0);
    pppoints1.add(points1.get(i));
  }
   pppoints1.add(points1.get(0));    
///////////////////////////////////////////////////////////////////////////////////////////////
pppoints2.add(points2.get(points2.size()-1));                          //initialize
 
  for (int i=0;i<points2.size();i++)                         //                     
  {
    Velocity2.add(n);
    Mag2.add(i,2.0);
    pppoints2.add(points2.get(i));
  }
   pppoints2.add(points2.get(0));    
//////////////////////////////////////////////////////////////////////////////////////////////////
pppoints3.add(points3.get(points3.size()-1));                          //initialize
 
  for (int i=0;i<points3.size();i++)                         //                     
  {
    Velocity3.add(n);
    Mag3.add(i,2.0);
    pppoints3.add(points3.get(i));
  }
   pppoints3.add(points3.get(0));    



}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw()
{
   background(0);
   
  int which = frameCount % num;                                                        
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num-30; i++) {                                   //Mouse effect
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipseMode(RADIUS); 
    //noStroke();
    fill(255);
    ellipse(mx[index], my[index], i, i);
    //noStroke();
   //fill(255, 153); 
  }
  
  
   if (mouseX > bx-boxSize && mouseX < bx+boxSize &&                   //Determine if the button is pressed
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255,5000); 
      fill(153);
      rect(bx, by, boxSize, boxSize);
    } 
    else
    {
      stroke(255,5000); 
      fill(250,0,0);
      rect(bx, by, boxSize, boxSize);
    }
  } 
  /*else {
    stroke(153);
    fill(153);
    overBox = false;
    rect(bx, by, boxSize, boxSize);
  }*/
  
  /*stroke(153);
    fill(153);
    overBox = false;
    rect(bx, by, boxSize, boxSize);*/
  
 //////////////////////////////////////////////////////////////// 
  else if (mouseX > bx1-boxSize && mouseX < bx1+boxSize && 
      mouseY > by1-boxSize && mouseY < by1+boxSize) {
    overBox1 = true;  
    if(!locked) { 
      stroke(255,5000); 
      fill(153);
      rect(bx1, by1, boxSize, boxSize);
    } 
    else
    {
      stroke(255,5000); 
      fill(250,0,0);
      rect(bx1, by1, boxSize, boxSize);
    }
  } 
//////////////////////////////////////////////////////////////////////  
   else if (mouseX > bx2-boxSize && mouseX < bx2+boxSize && 
      mouseY > by2-boxSize && mouseY < by2+boxSize) {
    overBox2 = true;  
    if(!locked) { 
      stroke(255,5000); 
      fill(153);
      rect(bx2, by2, boxSize, boxSize);
    } 
    else
    {
      stroke(255,5000); 
      fill(250,0,0);
      rect(bx2, by2, boxSize, boxSize);
    }
  } 
  /////////////////////////////////////////////////////////////////////
  else if (mouseX > bx3-boxSize && mouseX < bx3+boxSize && 
      mouseY > by3-boxSize && mouseY < by3+boxSize) {
    overBox3 = true;  
    if(!locked) { 
      stroke(255,5000); 
      fill(153);
      rect(bx3, by3, boxSize, boxSize);
    } 
    else
    {
      stroke(255,5000); 
      fill(250,0,0);
      rect(bx3, by3, boxSize, boxSize);
    }
  } 
///////////////////////////////////////////////////////////////////  
  else {
    stroke(153);
    fill(153);
    overBox1 = false;
    overBox=false;
    overBox2=false;
    overBox3=false;
    rect(bx, by, boxSize, boxSize);
    rect(bx1, by1, boxSize, boxSize);
    rect(bx2,by2,boxSize,boxSize);
    rect(bx3,by3,boxSize,boxSize);
  }
 //////////////////////////////////////////////////////////////////////  
   translate(width/3, height/2); 
   
   if(option)                                                           //When the button is pressed, trigger the program
   {
       pppoints.set(0,points.get(points.size()-1));
    for (int i=0;i<points.size();i++)
    {
       pppoints.set(i+1,points.get(i));
    }
    pppoints.set(pppoints.size()-1,points.get(0));
   
   /*for(int i=0;i<pppoints.size();i++)
   {
     println("the position is: "+i+" the value is: "+pppoints.get(i) );
   }
   
  for(int i=0;i<points.size();i++)
  { 
   
    //ellipse(points.get(i).x,points.get(i).y,10,10);
    
  }*/
  //ellipse
   /*for(int i=0;i<pppoints.size();i++)
   {
      //noStroke();
      //fill(100);
     // ellipse(pppoints.get(i).x, pppoints.get(i).y, 6, 6);
   }*/
   
   float ma,mb,xx,yy;
   float Xcentre,Ycentre;
   if (!curvaturelock)
   {
        for(int i=0;i<points.size();i++)                                                                  //calculation process for curcature and the magnitude of the speed
     {
       if (pppoints.get(i+1).x-pppoints.get(i).x==0)
       {
         if ((pppoints.get(i+2).x-pppoints.get(i+1).x)==0)
         {
           PVector pp=new PVector(0,0);
           Velocity.set(i,pp);
           Mag.set(i,0.0);
           continue;
         }
         else 
         {
            ma=(pppoints.get(i+2).y-pppoints.get(i).y)/(pppoints.get(i+2).x-pppoints.get(i).x);
            mb=(pppoints.get(i+2).y-pppoints.get(i+1).y)/(pppoints.get(i+2).x-pppoints.get(i+1).x);
            
         }
      
       }
       else
       {
         if ((pppoints.get(i+2).x-pppoints.get(i+1).x)==0)
         {
            ma=(pppoints.get(i+1).y-pppoints.get(i).y)/(pppoints.get(i+1).x-pppoints.get(i).x);
            mb=(pppoints.get(i+2).y-pppoints.get(i).y)/(pppoints.get(i+2).x-pppoints.get(i).x);
         }
         else
         {
           ma=(pppoints.get(i+1).y-pppoints.get(i).y)/(pppoints.get(i+1).x-pppoints.get(i).x);
           mb=(pppoints.get(i+2).y-pppoints.get(i+1).y)/(pppoints.get(i+2).x-pppoints.get(i+1).x);
         }
        
       }
    
       if(ma==mb)
       {
       //println("ERROR333!!!");
          PVector pp=new PVector(0,0);
          Velocity.set(i,pp);
          Mag.set(i,0.0);
         continue;
       }
     
       Xcentre=(ma*mb*(pppoints.get(i).y-pppoints.get(i+2).y)+mb*(pppoints.get(i).x+pppoints.get(i+1).x)-ma*(pppoints.get(i+1).x+pppoints.get(i+2).x))/(2*(mb-ma));
       Ycentre=-(Xcentre-(pppoints.get(i).x+pppoints.get(i+1).x)/2)/ma+(pppoints.get(i).y+pppoints.get(i+1).y)/2;
       PVector Center=new PVector(Xcentre,Ycentre);
       PVector Direction=PVector.sub(Center,points.get(i));
       float mag=Direction.mag();
       Mag.set(i,mag);
       PVector velocity=Direction.setMag(1);
       velocity=new PVector(velocity.x/mag,velocity.y/mag);                                         //Speed update every loop
       Velocity.set(i,velocity); 
     
     }
     
        for(int i=0;i<points.size();i++)
     {
       PVector ch=points.get(i).add(Velocity.get(i));                                              //Update the position of each pixel every loop
       points.set(i,ch);
     }
   }
   
   for(int i=0;i<Velocity.size();i++)
   {
     println("the velocity "+i+ "is"+Velocity.get(i));
   }
    //println("!!!the biggest mag is "+Mag.get(0));
    //println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
   if(!curvaturelock)
   {
       Collections.sort(Mag);
       println("!!!the biggest mag is "+Mag.get(0));
       println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
       
     if(Math.abs(Mag.get(0)-Mag.get(Mag.size()-1))<2)                                               //Threshold to stop the transformation process
     {
        curvaturelock=true;
     }
   }
 
   
  /* if(!curvaturelock)
   {
       Collections.sort(Mag);
       println("!!!the biggest mag is "+Mag.get(0));
       println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
       
     if(Math.abs(Mag.get(0)-Mag.get(Mag.size()-1))<1)
     {
        curvaturelock=true;
     }
   }*/
   
   
    smooth();
     noFill();
     stroke(255);
     beginShape();
     curveVertex(points.get(0).x,points.get(0).y);                                                 //Connect all the pixels
     for (int i=0;i<points.size();i++)
     {
       curveVertex(points.get(i).x,points.get(i).y);
     }
     curveVertex(points.get(0).x,points.get(0).y);
     curveVertex(points.get(0).x,points.get(0).y);
     endShape();
     
   }
//////////////////////////////////////////////////////////////////////////////   
    if(option1)
   {
       pppoints1.set(0,points1.get(points1.size()-1));
    for (int i=0;i<points1.size();i++)
    {
       pppoints1.set(i+1,points1.get(i));
    }
    pppoints1.set(pppoints1.size()-1,points1.get(0));
   
   /*for(int i=0;i<pppoints.size();i++)
   {
     println("the position is: "+i+" the value is: "+pppoints.get(i) );
   }
   
  for(int i=0;i<points.size();i++)
  { 
   
    //ellipse(points.get(i).x,points.get(i).y,10,10);
    
  }*/
  //ellipse
   /*for(int i=0;i<pppoints.size();i++)
   {
      //noStroke();
      //fill(100);
     // ellipse(pppoints.get(i).x, pppoints.get(i).y, 6, 6);
   }*/
   
   float ma,mb,xx,yy;
   float Xcentre,Ycentre;
   if (!curvaturelock1)
   {
        for(int i=0;i<points1.size();i++)
     {
       if (pppoints1.get(i+1).x-pppoints1.get(i).x==0)
       {
         if ((pppoints1.get(i+2).x-pppoints1.get(i+1).x)==0)
         {
           PVector pp=new PVector(0,0);
           Velocity1.set(i,pp);
           Mag1.set(i,0.0);
           continue;
         }
         else 
         {
            ma=(pppoints1.get(i+2).y-pppoints1.get(i).y)/(pppoints1.get(i+2).x-pppoints1.get(i).x);
            mb=(pppoints1.get(i+2).y-pppoints1.get(i+1).y)/(pppoints1.get(i+2).x-pppoints1.get(i+1).x);
            
         }
      
       }
       else
       {
         if ((pppoints1.get(i+2).x-pppoints1.get(i+1).x)==0)
         {
            ma=(pppoints1.get(i+1).y-pppoints1.get(i).y)/(pppoints1.get(i+1).x-pppoints1.get(i).x);
            mb=(pppoints1.get(i+2).y-pppoints1.get(i).y)/(pppoints1.get(i+2).x-pppoints1.get(i).x);
         }
         else
         {
           ma=(pppoints1.get(i+1).y-pppoints1.get(i).y)/(pppoints1.get(i+1).x-pppoints1.get(i).x);
           mb=(pppoints1.get(i+2).y-pppoints1.get(i+1).y)/(pppoints1.get(i+2).x-pppoints1.get(i+1).x);
         }
        
       }
    
       if(ma==mb)
       {
       //println("ERROR333!!!");
          PVector pp=new PVector(0,0);
          Velocity1.set(i,pp);
          Mag1.set(i,0.0);
         continue;
       }
     
       Xcentre=(ma*mb*(pppoints1.get(i).y-pppoints1.get(i+2).y)+mb*(pppoints1.get(i).x+pppoints1.get(i+1).x)-ma*(pppoints1.get(i+1).x+pppoints1.get(i+2).x))/(2*(mb-ma));
       Ycentre=-(Xcentre-(pppoints1.get(i).x+pppoints1.get(i+1).x)/2)/ma+(pppoints1.get(i).y+pppoints1.get(i+1).y)/2;
       PVector Center=new PVector(Xcentre,Ycentre);
       PVector Direction=PVector.sub(Center,points1.get(i));
       float mag=Direction.mag();
       Mag1.set(i,mag);
       PVector velocity=Direction.setMag(1);
       velocity=new PVector(velocity.x/mag,velocity.y/mag);
       Velocity1.set(i,velocity); 
     
     }
     
        for(int i=0;i<points1.size();i++)
     {
       PVector ch=points1.get(i).add(Velocity1.get(i));
       points1.set(i,ch);
     }
   }
   
   for(int i=0;i<Velocity1.size();i++)
   {
     println("the velocity "+i+ "is"+Velocity1.get(i));
   }
    //println("!!!the biggest mag is "+Mag.get(0));
    //println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
    if(!curvaturelock1)
   {
       Collections.sort(Mag1);
       println("!!!the biggest mag is "+Mag1.get(0));
       println("!!!the smallest mag is"+ Mag1.get(Mag.size()-1));
       
     if(Math.abs(Mag1.get(0)-Mag1.get(Mag1.size()-1))<1)
     {
        curvaturelock1=true;
     }
   }
   
   
    smooth();
     noFill();
     stroke(255);
     beginShape();
     curveVertex(points1.get(0).x,points1.get(0).y);
     for (int i=0;i<points1.size();i++)
     {
       curveVertex(points1.get(i).x,points1.get(i).y);
     }
     curveVertex(points1.get(0).x,points1.get(0).y);
     curveVertex(points1.get(0).x,points1.get(0).y);
     endShape();
   }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
 if(option2)
   {
       pppoints2.set(0,points2.get(points2.size()-1));
    for (int i=0;i<points2.size();i++)
    {
       pppoints2.set(i+1,points2.get(i));
    }
    pppoints2.set(pppoints2.size()-1,points2.get(0));
   
   /*for(int i=0;i<pppoints.size();i++)
   {
     println("the position is: "+i+" the value is: "+pppoints.get(i) );
   }
   
  for(int i=0;i<points.size();i++)
  { 
   
    //ellipse(points.get(i).x,points.get(i).y,10,10);
    
  }*/
  //ellipse
   /*for(int i=0;i<pppoints.size();i++)
   {
      //noStroke();
      //fill(100);
     // ellipse(pppoints.get(i).x, pppoints.get(i).y, 6, 6);
   }*/
   
   float ma,mb,xx,yy;
   float Xcentre,Ycentre;
   if (!curvaturelock2)
   {
        for(int i=0;i<points2.size();i++)
     {
       if (pppoints2.get(i+2).x-pppoints2.get(i).x==0)
       {
         if ((pppoints2.get(i+2).x-pppoints2.get(i+1).x)==0)
         {
           PVector pp=new PVector(0,0);
           Velocity2.set(i,pp);
           Mag2.set(i,0.0);
           continue;
         }
         else 
         {
            ma=(pppoints2.get(i+2).y-pppoints2.get(i).y)/(pppoints2.get(i+2).x-pppoints2.get(i).x);
            mb=(pppoints2.get(i+2).y-pppoints2.get(i+1).y)/(pppoints2.get(i+2).x-pppoints2.get(i+1).x);
            
         }
      
       }
       else
       {
         if ((pppoints2.get(i+2).x-pppoints2.get(i+1).x)==0)
         {
            ma=(pppoints2.get(i+1).y-pppoints2.get(i).y)/(pppoints2.get(i+1).x-pppoints2.get(i).x);
            mb=(pppoints2.get(i+2).y-pppoints2.get(i).y)/(pppoints2.get(i+2).x-pppoints2.get(i).x);
         }
         else
         {
           ma=(pppoints2.get(i+1).y-pppoints2.get(i).y)/(pppoints2.get(i+1).x-pppoints2.get(i).x);
           mb=(pppoints2.get(i+2).y-pppoints2.get(i+1).y)/(pppoints2.get(i+2).x-pppoints2.get(i+1).x);
         }
        
       }
    
       if(ma==mb)
       {
       //println("ERROR333!!!");
          PVector pp=new PVector(0,0);
          Velocity2.set(i,pp);
          Mag2.set(i,0.0);
         continue;
       }
     
       Xcentre=(ma*mb*(pppoints2.get(i).y-pppoints2.get(i+2).y)+mb*(pppoints2.get(i).x+pppoints2.get(i+1).x)-ma*(pppoints2.get(i+1).x+pppoints2.get(i+2).x))/(2*(mb-ma));
       Ycentre=-(Xcentre-(pppoints2.get(i).x+pppoints2.get(i+1).x)/2)/ma+(pppoints2.get(i).y+pppoints2.get(i+1).y)/2;
       PVector Center=new PVector(Xcentre,Ycentre);
       PVector Direction=PVector.sub(Center,points2.get(i));
       float mag=Direction.mag();
       Mag2.set(i,mag);
       PVector velocity=Direction.setMag(1);
       velocity=new PVector(velocity.x/mag,velocity.y/mag);
       Velocity2.set(i,velocity); 
     
     }
     
        for(int i=0;i<points2.size();i++)
     {
       PVector ch=points2.get(i).add(Velocity2.get(i));
       points2.set(i,ch);
     }
   }
   
   for(int i=0;i<Velocity2.size();i++)
   {
     println("the velocity "+i+ "is"+Velocity2.get(i));
   }
    //println("!!!the biggest mag is "+Mag.get(0));
    //println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
    if(!curvaturelock2)
   {
       Collections.sort(Mag2);
       println("!!!the biggest mag is "+Mag2.get(0));
       println("!!!the smallest mag is"+ Mag2.get(Mag.size()-1));
       
     if(Math.abs(Mag2.get(0)-Mag2.get(Mag2.size()-1))<1)
     {
        curvaturelock2=true;
     }
   }
   
   
    smooth();
     noFill();
     stroke(255);
     beginShape();
     curveVertex(points2.get(0).x,points2.get(0).y);
     for (int i=0;i<points2.size();i++)
     {
       curveVertex(points2.get(i).x,points2.get(i).y);
     }
     curveVertex(points2.get(0).x,points2.get(0).y);
     curveVertex(points2.get(0).x,points2.get(0).y);
     endShape();
   }  
/////////////////////////////////////////////////////////////////////////////////////////////////////   
   if(option3)
   {
       pppoints3.set(0,points3.get(points3.size()-1));
    for (int i=0;i<points3.size();i++)
    {
       pppoints3.set(i+1,points3.get(i));
    }
    pppoints3.set(pppoints3.size()-1,points3.get(0));
   
   /*for(int i=0;i<pppoints.size();i++)
   {
     println("the position is: "+i+" the value is: "+pppoints.get(i) );
   }
   
  for(int i=0;i<points.size();i++)
  { 
   
    //ellipse(points.get(i).x,points.get(i).y,10,10);
    
  }*/
  //ellipse
   /*for(int i=0;i<pppoints.size();i++)
   {
      //noStroke();
      //fill(100);
     // ellipse(pppoints.get(i).x, pppoints.get(i).y, 6, 6);
   }*/
   
   float ma,mb,xx,yy;
   float Xcentre,Ycentre;
   if (!curvaturelock3)
   {
        for(int i=0;i<points3.size();i++)
     {
       if (pppoints3.get(i+2).x-pppoints3.get(i).x==0)
       {
         if ((pppoints3.get(i+2).x-pppoints3.get(i+1).x)==0)
         {
           PVector pp=new PVector(0,0);
           Velocity3.set(i,pp);
           Mag3.set(i,0.0);
           continue;
         }
         else 
         {
            ma=(pppoints3.get(i+2).y-pppoints3.get(i).y)/(pppoints3.get(i+2).x-pppoints3.get(i).x);
            mb=(pppoints3.get(i+2).y-pppoints3.get(i+1).y)/(pppoints3.get(i+2).x-pppoints3.get(i+1).x);
            
         }
      
       }
       else
       {
         if ((pppoints3.get(i+2).x-pppoints3.get(i+1).x)==0)
         {
            ma=(pppoints3.get(i+1).y-pppoints3.get(i).y)/(pppoints3.get(i+1).x-pppoints3.get(i).x);
            mb=(pppoints3.get(i+2).y-pppoints3.get(i).y)/(pppoints3.get(i+2).x-pppoints3.get(i).x);
         }
         else
         {
           ma=(pppoints3.get(i+1).y-pppoints3.get(i).y)/(pppoints3.get(i+1).x-pppoints3.get(i).x);
           mb=(pppoints3.get(i+2).y-pppoints3.get(i+1).y)/(pppoints3.get(i+2).x-pppoints3.get(i+1).x);
         }
        
       }
    
       if(ma==mb)
       {
       //println("ERROR333!!!");
          PVector pp=new PVector(0,0);
          Velocity3.set(i,pp);
          Mag3.set(i,0.0);
         continue;
       }
     
       Xcentre=(ma*mb*(pppoints3.get(i).y-pppoints3.get(i+2).y)+mb*(pppoints3.get(i).x+pppoints3.get(i+1).x)-ma*(pppoints3.get(i+1).x+pppoints3.get(i+2).x))/(2*(mb-ma));
       Ycentre=-(Xcentre-(pppoints3.get(i).x+pppoints3.get(i+1).x)/2)/ma+(pppoints3.get(i).y+pppoints3.get(i+1).y)/2;
       PVector Center=new PVector(Xcentre,Ycentre);
       PVector Direction=PVector.sub(Center,points3.get(i));
       float mag=Direction.mag();
        if(Float.isNaN((mag)))
     {
       PVector pp=new PVector(0,0);
         Velocity3.set(i,pp);
          Mag3.set(i,0.0);
         //velocity=new PVector(0,0);
         continue;
      //mag=0.0;
     }
     if(Float.isInfinite((mag)))
     {
       PVector pp=new PVector(0,0);
         Velocity3.set(i,pp);
          Mag3.set(i,0.0);
         //velocity=new PVector(0,0);
         continue;
      //mag=0.0;
     }

       
       Mag3.set(i,mag);
       PVector velocity=Direction.setMag(1);
       
       if(mag==0)
       {
         PVector pp=new PVector(0,0);
         Velocity3.set(i,pp);
          Mag3.set(i,0.0);
         //velocity=new PVector(0,0);
         continue;
       }
       
       velocity=new PVector(velocity.x/mag,velocity.y/mag);
       Velocity3.set(i,velocity); 
     
     }
     
        for(int i=0;i<points3.size();i++)
     {
       PVector ch=points3.get(i).add(Velocity3.get(i));
       points3.set(i,ch);
     }
   }
   
   for(int i=0;i<Velocity3.size();i++)
   {
     println("the velocity "+i+ "is"+Velocity3.get(i));
   }
    //println("!!!the biggest mag is "+Mag.get(0));
    //println("!!!the smallest mag is"+ Mag.get(Mag.size()-1));
    if(!curvaturelock3)
   {
       Collections.sort(Mag3);
       println("!!!the biggest mag is "+Mag3.get(0));
       println("!!!the smallest mag is"+ Mag3.get(Mag3.size()-1));
       println("the value is:!!" + (Mag3.get(0)-Mag3.get(Mag3.size()-1)));
     if(Math.abs(Mag3.get(0)-Mag3.get(Mag3.size()-1))<500)
     //if(Mag3.get(0)<0.001)
     {
        curvaturelock3=true;
        //println("fuck!!!!");
     }
   }
   
   
    smooth();
     noFill();
     stroke(255);
     beginShape();
     curveVertex(points3.get(0).x,points3.get(0).y);
     for (int i=0;i<points3.size();i++)
     {
       curveVertex(points3.get(i).x,points3.get(i).y);
     }
     curveVertex(points3.get(0).x,points3.get(0).y);
     curveVertex(points3.get(0).x,points3.get(0).y);
     endShape();
   }  
   
/////////////////////////////////////////////////////////////////////////////////////////////////////     
      //background(0); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  
      
}

float distSq(PVector p1, PVector p2)                                                                        // For sorting
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

float r(float theta, float a, float b, float m, float n1, float n2, float n3) { 
    return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
  }
  
  
  
  
  void mousePressed()                                                                                 //For the mouse and the button
{
  if(overBox) { 
    locked = true;
    option=true;
    option1=false;
    option2=false;
    option3=false;
    stroke(153);
    fill(250, 0, 0);
     rect(bx, by, boxSize, boxSize);
  } 
   if(overBox1) { 
    locked = true;
    option=false;
    option1=true;
    option2=false;
    option3=false;
    stroke(153);
    fill(250, 0, 0);
     rect(bx1, by1, boxSize, boxSize);
  } 
   if(overBox2) { 
    locked = true; 
     option=false;
    option1=false;
    option2=true;
    option3=false;
    stroke(153);
    fill(250, 0, 0);
     rect(bx2, by2, boxSize, boxSize);
  } 
   if(overBox3) { 
    locked = true;
    option=false;
    option1=false;
    option2=false;
    option3=true;
    stroke(153);
    fill(250, 0, 0);
     rect(bx3, by3, boxSize, boxSize);
  } 
}  

void mouseReleased() {
  locked = false;
}