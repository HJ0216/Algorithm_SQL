class Solution {
    public int solution(String s) {
        int answer = 0;
        for(int i=0; i<s.length(); i++){
            if(s.charAt(i) >= 48 && s.charAt(i) <= 57){
                answer = answer*10 + s.charAt(i)-48;
            }
        }
        if(s.charAt(0)=='-') answer *=-1;
        return answer;
    }
}
