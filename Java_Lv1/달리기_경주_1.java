import java.util.*;

class Solution {
    public String[] solution(String[] players, String[] callings) {
        String[] answer = new String[players.length];
        
        Map<Integer, String> runningMapIntStr = new HashMap<>();
        for(int i=0; i<players.length; i++){
            runningMapIntStr.put(i, runningMapIntStr.getOrDefault(i, players[i]));
        };
        
        Map<String, Integer> runningMapStrInt = new HashMap<>();
        for(int i=0; i<players.length; i++){
            runningMapStrInt.put(players[i], runningMapStrInt.getOrDefault(players[i], i));
        };

        for(String runner : callings){
            int catchUpRank = runningMapStrInt.get(runner)-1;
            String catchUpRunner = runningMapIntStr.get(catchUpRank);
            runningMapIntStr.replace(catchUpRank, runner);
            runningMapIntStr.replace(catchUpRank+1, catchUpRunner);
            runningMapStrInt.replace(runner, catchUpRank);
            runningMapStrInt.replace(catchUpRunner, catchUpRank+1);
        };
        
        for(int i = 0; i < players.length; i++){
            answer[i] = runningMapIntStr.get(i);
        }
        
        return answer;
    }
}
