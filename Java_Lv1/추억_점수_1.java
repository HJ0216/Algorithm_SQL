import java.util.Map;
import java.util.HashMap;

class Solution {
    static int[] answer;
    static Map<String, Integer> yearningScore;
    public int[] solution(String[] name, int[] yearning, String[][] photo) {

        answer = new int[photo.length];
        
        yearningScore = new HashMap<>();
        
        for(int i=0; i<name.length; i++){
            yearningScore.put(name[i], yearning[i]);
        }
        
        int index=0;
        for(String[] peopleInPhoto : photo){
            answer[index++] = calcYearningScore(peopleInPhoto);
        }
        
        return answer;
    }
    
    public int calcYearningScore(String[] peopleInPhoto){
        int sumYearning = 0;
        for(String personInPhoto : peopleInPhoto){
            if(yearningScore.get(personInPhoto)!=null)
                sumYearning += yearningScore.get(personInPhoto);
        }
        return sumYearning;
    }
}
