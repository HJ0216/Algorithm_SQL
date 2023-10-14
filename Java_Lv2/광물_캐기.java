import java.util.*;

class Solution {
    public int solution(int[] picks, String[] minerals) {
        int answer = 0;
        int countPicks = picks[0] + picks[1] + picks[2];
        int[][] mineralFatigueTable = new int[minerals.length / 5 + 1][3];
        
        for(int i = 0; i < minerals.length && countPicks > 0; i++) {
            switch(minerals[i])
            {
                case "diamond":
                    mineralFatigueTable[i / 5][0] += 1;
                    mineralFatigueTable[i / 5][1] += 5;
                    mineralFatigueTable[i / 5][2] += 25;
                    break;
                case "iron":
                    mineralFatigueTable[i / 5][0] += 1;
                    mineralFatigueTable[i / 5][1] += 1;
                    mineralFatigueTable[i / 5][2] += 5;
                    break;
                case "stone":
                    mineralFatigueTable[i / 5][0] += 1;
                    mineralFatigueTable[i / 5][1] += 1;
                    mineralFatigueTable[i / 5][2] += 1;
            }
            
            if(i % 5 == 4) countPicks--;            
            
        }
        
        Arrays.sort(mineralFatigueTable, new Comparator<int[]>() {
            @Override
            public int compare(int[] o1, int[] o2) {
                if(o1[2] < o2[2]) 
                    return 1;
                else 
                    return -1;
            }
        });
        
        for(int i = 0, pickIndx = 0; i < mineralFatigueTable.length; i++) {
            while(pickIndx < 3 && picks[pickIndx] == 0) pickIndx++;
            if(pickIndx == 3) break;
            picks[pickIndx]--;
            answer += mineralFatigueTable[i][pickIndx];
        }
        
        return answer;
    }
}
