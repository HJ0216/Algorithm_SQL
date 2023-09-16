import java.util.ArrayList;
import java.util.List;

public class Solution {
    public int[] solution(int []arr) {
        
        // 1. 연속된 값에 대해서만 중복 제거: Set, Map X
        // 2. 순서 유지
        
        int[] answer = {};
        
	    List<Integer> list = new ArrayList<>();
	    list.add(arr[0]);
	    
	    for(int i = 1; i<arr.length; i++) {
	    	if(arr[i-1]!=arr[i])
	    		list.add(arr[i]);
	    }
        
        answer = new int[list.size()];
        
        int j = 0;
        for(int i : list){
            answer[j++] = i;
        }
        
        return answer;
    }
}
