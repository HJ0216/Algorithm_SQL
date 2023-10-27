class Solution {
    public String solution(int n) {
        String answer = "";
        StringBuilder sb = new StringBuilder();
        while(n-->0){
            if(n%2==0){
                sb.append("수");
            } else {
                sb.append("박");
            }
        }
        answer = sb.reverse().toString();
        return answer;
    }
}
