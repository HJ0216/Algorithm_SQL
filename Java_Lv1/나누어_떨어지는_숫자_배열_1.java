import java.util.Arrays;

class Solution {
    public int[] solution(int[] arr, int divisor) {
        
        // 1. divisor로 나누어 떨어지는 값
        // 2. 오름차순
        // 3. 나누어 떨어지는 값이 없을 경우, 배열에 -1 담아 return
        
        int[] answer = {};
        
        int num = 0;
        for(int i : arr){
            if(i%divisor==0){
                num++;
            }
        }
        
        if(num==0){
            answer = new int[]{-1};
        } else {
            answer = new int[num];
            for(int i : arr){
                if(i%divisor==0){
                    answer[--num] = i;
                }
            }
            Arrays.sort(answer);
        }
        
        return answer;
    }
}
