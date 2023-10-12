class Solution {
  public String solution(int a, int b) {
      String answer = "";

      int[] lastDayOfTheMonth = {31,29,31,30,31,30,31,31,30,31,30,31};
      String[] DayOfTheWeek ={"FRI","SAT","SUN","MON","TUE","WED","THU"};
      int totalDay = 0;
      for(int i = 0 ; i< a-1; i++){
          totalDay += lastDayOfTheMonth[i];
      }
      totalDay += b-1;
      answer = DayOfTheWeek[totalDay %7];

      return answer;
  }
}
