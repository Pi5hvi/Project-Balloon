ArrayList <PVector> vert = new ArrayList<PVector>();
ArrayList <PVector> cent = new ArrayList<PVector>();
ArrayList <PVector> qwerty = new ArrayList<PVector>();
FloatList dia = new FloatList();
int i=0;
int j=0;
int k=0;
int count=0;
void setup(){
  background(0);
  size(500,500);
}
void draw(){
}
void mousePressed() {
    vert.add(new PVector(mouseX,mouseY));
    point(mouseX,mouseY);
    if (k==0){
    if(i%2==0&&i!=0){
      cent.add(new PVector(0,0));
      int g=i-2;
      int h=i-1;   // For the index of previous two points
      float m1 = (vert.get(g).x - vert.get(h).x)/(vert.get(h).y - vert.get(g).y);  // slope of perpendicular bisectors to lines AB
      float m2 = (vert.get(h).x - vert.get(i).x)/(vert.get(i).y - vert.get(h).y);  // slope of perpendicular bisectors to lines BC
      float aby = (vert.get(g).y+vert.get(h).y)/2;   //midpoint Y of AB
      float abx = (vert.get(g).x+vert.get(h).x)/2;   //midpoint X of AB
      float cby = (vert.get(i).y+vert.get(h).y)/2;   //midpoint Y of CB
      float cbx = (vert.get(i).x+vert.get(h).x)/2;   //midpoint X of CB
      if (abs((vert.get(h).y - vert.get(g).y))>0.3&&abs((vert.get(i).y - abs(vert.get(h).y)))>0.3){
        if(m1!=m2){
          cent.set(j,new PVector((cby-aby+m1*abx-m2*cbx)/(m1-m2),m1*((cby-aby+m1*abx-m2*cbx)/(m1-m2)-abx)+aby));
        }
        else{
          cent.set(j,new PVector((cby-aby+m1*abx-m2*cbx)/(m1-m2),m1*((cby-aby+m1*abx-m2*cbx)/(m1-m2)-abx)+aby));
        }
      }
      if (abs((vert.get(h).y - vert.get(g).y))<0.3){
        cent.set(j,new PVector(((((vert.get(g).y+vert.get(h).y)/2-cbx)/m2)+cbx),(vert.get(g).y+vert.get(h).y)/2));
      }
      if (abs((vert.get(i).y - vert.get(h).y))<0.3){
        cent.set(j,new PVector((((vert.get(i).y+vert.get(h).y)/2-abx)/m1)+cbx,(vert.get(i).y+vert.get(h).y)/2));
      }
      dia.append(2*abs(sqrt(sq(vert.get(i).y-cent.get(j).y)+sq(vert.get(i).x-cent.get(j).x))));
      //float start=atan2(y[g]-cy[j],x[g]-cx[j]);
      //float startd=start*180/PI;
      //float mid=atan2(y[h]-cy[j],x[h]-cx[j]);
      //float midd=mid*180/PI;
      //float finish=atan2(y[i]-cy[j],x[i]-cx[j]);
      //float finishd=finish*180/PI;
      ////float start= atan((y[g]-cy[j])/(x[g]-cx[j]));
      //float finish= atan((y[i]-cy[j])/(x[i]-cx[j]));
      float start=atan2((vert.get(g).y-cent.get(j).y),vert.get(g).x-cent.get(j).x);
      float strt1=start*180/PI;
      float mid=atan2(vert.get(h).y-cent.get(j).y,vert.get(h).x-cent.get(j).x);
      float mid1=mid*180/PI;
      float finish=atan2(vert.get(i).y-cent.get(j).y,vert.get(i).x-cent.get(j).x);
      float fin1=finish*180/PI;
      stroke(255,255,255);
      noFill();
      if (start==finish||mid==finish||start==mid){
        cent.set(j,new PVector((vert.get(g).x+vert.get(0).x)/2,(vert.get(g).y+vert.get(0).y)/2));
        dia.set(j,sqrt(sq(vert.get(g).x-vert.get(0).x)+sq(vert.get(g).y-vert.get(0).y)));
        start=atan2((vert.get(g).y-cent.get(j).y),vert.get(g).x-cent.get(j).x);
        finish=atan2(vert.get(0).y-cent.get(j).y,vert.get(0).x-cent.get(j).x);
        arc(cent.get(j).x,cent.get(j).y,dia.get(j),dia.get(j),start,finish);
                for (int l=0;l<10;l++){
          qwerty.add(new PVector(cos(start+(finish-start)*l/10)*dia.get(j)/2+cent.get(j).x,sin(start+(finish-start)*l/10)*dia.get(j)/2+cent.get(j).y));          
        }
        for(int l=0;l<qwerty.size();l++){
          stroke(255,0,0);
          point(qwerty.get(l).x,qwerty.get(l).y);
        }
        println("DONE","P1:"+vert.get(g),"P2:"+vert.get(0),"cent:"+cent.get(j),"rad:"+dia.get(j));
        k=10;
      }
      if (k==0){
      if (start<mid&&mid>finish){
        if (start+2*PI<2*PI){
          start=start+2*PI;
        }
        else{
          finish=finish+2*PI;
        }
        
      }
      if (start>mid&&mid<finish){
        if (start+2*PI<2*PI){
          start=start+2*PI;
          if (mid+2*PI<2*PI)
          mid=mid+2*PI;
        }
        else{
          finish=finish+2*PI;
          mid=mid+2*PI;
        }
      }
      float startd=start*180/PI;
      float midd=mid*180/PI;
      float finishd=finish*180/PI;
      if (startd<midd&&midd<finishd){
        arc(cent.get(j).x,cent.get(j).y,dia.get(j),dia.get(j),start,finish);
        for (int l=0;l<10;l++){
          qwerty.add(new PVector(cos(start+(finish-start)*l/10)*dia.get(j)/2+cent.get(j).x,sin(start+(finish-start)*l/10)*dia.get(j)/2+cent.get(j).y));          
        }
      }
      if (finishd<midd&&midd<startd){
        arc(cent.get(j).x,cent.get(j).y,dia.get(j),dia.get(j),finish,start);
                for (int l=0;l<10;l++){
          qwerty.add(new PVector(cos(finish+(start-finish)*l/10)*dia.get(j)/2+cent.get(j).x,sin(finish+(start-finish)*l/10)*dia.get(j)/2+cent.get(j).y));          
        }

      }
      //if (startd<midd&&finish<start){
      //arc(cx[j],cy[j],d[j],d[j],start,finish);
      //}
      //if (finishd<midd&&start<finishd){
      //arc(cx[j],cy[j],d[j],d[j],finish,start);
      //}
      //if (startd>midd&&finish<start){
      //arc(cx[j],cy[j],d[j],d[j],start,finish);
      //}
      println("centre:"+cent.get(j).x,""+cent.get(j).y,"Dia:"+dia.get(j),"Start"+startd,"Mid:"+midd,"Finish:"+finishd,"S1:"+strt1,"M1:"+mid1,"F1:"+fin1);
      j=j+1;
    }
    }
  i=i+1;
  }
}
//Constructors
  
//Methods