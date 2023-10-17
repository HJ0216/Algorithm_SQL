import java.util.Arrays;

class Solution {
    public String solution(String s) {
        String answer = "";
        char[] sToCharArr = s.toCharArray();
        Arrays.sort(sToCharArr);
        
        answer = new StringBuilder(new String(sToCharArr))
            .reverse()
            .toString();
        
        return answer;
    }
}
