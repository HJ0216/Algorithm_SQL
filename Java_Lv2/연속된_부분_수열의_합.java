class Solution {
    int[] answer = {0, 1_000_000};
    
    public int[] solution(int[] sequence, int k) {
        
        int left = 0;
        int right = 0;
        
        int sum=0;
        while(right < sequence.length) {
            sum += sequence[right++];
            while(sum>k){
                sum -= sequence[left++];
            }
            
            if(sum==k){
                changeArr(left, right-1);
            }
        }
        return answer;
    }
    
    private void changeArr(int left, int right){
        if(right-left<answer[1]-answer[0]){
            answer[0] = left;
            answer[1] = right;
        }
    }
}
