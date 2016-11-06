
class SortByY implements Comparator<PVector>
{
  public int compare(PVector o1, PVector o2) 
  {
  //Student s1 = (Student) o1;
  //Student s2 = (Student) o2;
  if (o1.y > o2.y)
  {
    return 1;
  }
   
  return -1;
 }
 
}