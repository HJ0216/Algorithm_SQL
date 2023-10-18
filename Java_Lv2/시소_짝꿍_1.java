import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;

class Solution {
    
    public long solution(int[] weights) {
        long answer = 0;

        Map<Double, Integer> map = new HashMap<>();

        Arrays.sort(weights);
        
        for(int weight : weights) {
    		double sameWeight = weight*1.0;
    		double twoThirdWeight = (weight*2.0)/3.0;
    		double halfWeight = (weight*1.0)/2.0;
    		double threeQuaters = (weight*3.0)/4.0;
    		if(map.containsKey(sameWeight)) answer += map.get(sameWeight);
    		if(map.containsKey(twoThirdWeight)) answer += map.get(twoThirdWeight);
    		if(map.containsKey(halfWeight)) answer += map.get(halfWeight);
    		if(map.containsKey(threeQuaters)) answer += map.get(threeQuaters);
    		map.put((weight*1.0), map.getOrDefault((weight*1.0), 0)+1);
        }

        return answer;

    }
}
