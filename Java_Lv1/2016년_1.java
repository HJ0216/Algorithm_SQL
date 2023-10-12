class Solution {
    public String solution(int a, int b) {
        String answer = "";
        String[] strArr = {"THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"};
        
        int monthDay = calcMonthToDay(a) + b;
        answer = strArr[monthDay%7];

        return answer;
    }
    
    public static int calcMonthToDay(int month){
        int day = 0;
        while(--month>0){
            switch (month) {
                case 2:
                    day += 29;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    day += 30;
                    break;
                default:
                    day += 31;
            }
        }
        return day;
    }
}
