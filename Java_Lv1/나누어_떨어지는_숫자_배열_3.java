import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class Solution {
    public int[] solution(int[] arr, int divisor) {
        
        // 1. divisor로 나누어 떨어지는 값
        // 2. 오름차순
        // 3. 나누어 떨어지는 값이 없을 경우, 배열에 -1 담아 return
        
        int[] answer = {};
        
        List<Integer> list = new ArrayList<>();
        
        int num = 0;
        for(int i : arr){
            if(i%divisor==0){
                list.add(i);
            }
        }
        
        if(list.size()==0){
            answer = new int[]{-1};
        } else {
            answer = list.stream().mapToInt(i -> i).toArray();
            Arrays.sort(answer);        
        }
        
        return answer;
    }
}
