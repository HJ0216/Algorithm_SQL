import java.util.Arrays;

class Solution {
    public String solution(String s) {
        String answer = "";
        char[] sToCharArr = new char[s.length()];
        for(int i=0; i<s.length(); i++){
            sToCharArr[i] = s.charAt(i);
        }
        Arrays.sort(sToCharArr);
        
        StringBuilder sb = new StringBuilder();
        for(int i=s.length()-1; i>-1; i--){
            sb.append(sToCharArr[i]);
        }
        answer = sb.toString();
        return answer;
    }
}
