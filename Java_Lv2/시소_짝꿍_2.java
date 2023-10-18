class Solution {
    
    public long solution(int[] weights) {
        long answer = 0;
        
        int[] weightCount = new int[1001];

        for(int weight : weights){
            weightCount[weight]++;
        }
        
        for(int weight=100; weight<=1000; weight++){
            long count = weightCount[weight];
            
            if(count==0){
                continue;
            }
            
            answer += count * (count-1) / 2;
            // 동일한 값이 2개 이상일 경우
            
            if (weight * 3 % 2 == 0 && weight * 3 / 2 <= 1000) {
                answer += count * weightCount[weight * 3 / 2];
                // weight: 임의의 수 = 2 : 3
            }
            
           if (weight * 4 % 2 == 0 && weight * 4 / 2 <= 1000) {
                answer += count * weightCount[weight * 4 / 2];
               // weight: 임의의 수 = 2 : 4
            }

            if (weight * 4 % 3 == 0 && weight * 4 / 3 <= 1000) {
                answer += count * weightCount[weight * 4 / 3];
                // weight: 임의의 수 = 3 : 4
            }
        }
        
        return answer;

    }
}
