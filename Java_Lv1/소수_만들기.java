class Solution {
    static int answer = 0;
    public int solution(int[] nums) {
        // 1. 3개의 수를 더했을 때 소수가 되는 경우의 개수
        for(int i=0; i<nums.length-2; i++) {
            for(int j=i+1; j<nums.length-1; j++) {
                for(int k=j+1; k<nums.length; k++) {
                    int sum = nums[i] + nums[j] + nums[k];
                    isPrime(sum);
                }
            }
        }
        return answer;
    }
    public static void isPrime(int i) {
        for(int j = 2; j<=(int) Math.sqrt(i); j++) {
            if(i%j==0) return;
        }
        answer++;
    }
}
