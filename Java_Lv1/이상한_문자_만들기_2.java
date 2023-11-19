class Solution {    
    public String solution(String s) {
        String answer = "";
        
        int wordIndex = 0;
        String[] wordArray = s.split("");

        for(String charToString : wordArray) {
            wordIndex = charToString.contains(" ") ? 0 : wordIndex + 1;
            answer += (wordIndex%2 == 0) ? charToString.toLowerCase() : charToString.toUpperCase(); 
        }
        
        return answer;
    }
}
