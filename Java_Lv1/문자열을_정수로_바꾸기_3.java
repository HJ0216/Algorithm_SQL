class Solution {
    public int solution(String s) {
        int answer = 0;
        for(int i=0; i<s.length(); i++){
            if(s.charAt(i) >= 48 && s.charAt(i) <= 57){
                answer += s.charAt(i)-48;
                if(i==s.length()-1) break;
                answer *= 10;                
            }
        }
        if(s.charAt(0)=='-') answer *=-1;
        return answer;
    }
}
