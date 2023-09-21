class Solution {
    public long solution(int a, int b) {
        
        // a와 b 사이에 속한 모든 정수의 합을 리턴하는 함수
        // a와 b가 같은 경우는 둘 중 아무 수나 리턴
        
        long answer = sumAtoB(Math.min(a, b), Math.max(b, a));;
        
        return answer;
    }
    
    private long sumAtoB(long a, long b) {
        return (b - a + 1) * (a + b) / 2;
    }
}
