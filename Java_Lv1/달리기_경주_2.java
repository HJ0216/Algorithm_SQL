import java.util.*;

class Solution {
    public String[] solution(String[] players, String[] callings) {
        String[] answer = new String[players.length];
        
        Map<String, Integer> runningMapStrInt = new HashMap<>();
        for(int i=0; i<players.length; i++){
            runningMapStrInt.put(players[i], i);
        };

        for(String runner : callings){
            int catchUpRank = runningMapStrInt.get(runner)-1;
            String catchUpRunner = players[catchUpRank];
            runningMapStrInt.put(catchUpRunner, catchUpRank+1);
            runningMapStrInt.put(runner, catchUpRank);
            
            players[catchUpRank] = runner;
            players[catchUpRank+1] = catchUpRunner;
        };
        
        int index = 0;
        for(String player : players) {
			answer[index++] = player;
		}

        return answer;
    }
}
