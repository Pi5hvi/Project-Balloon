class SortByPolarAngle implements Comparator<PVector>
{
  public int compare(PVector o1, PVector o2) 
  {
     int o = orientation(P0, o1, o2);
   if (o == 0)
     return (distSq(P0, o2) >= distSq(P0, o1))? -1 : 1;
 
   return (o == 2)? -1: 1;
  }
  
}