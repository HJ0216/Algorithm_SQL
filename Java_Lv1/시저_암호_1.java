class Solution {
    public String solution(String s, int n) {
        String answer = "";
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<s.length(); i++){
            if(s.charAt(i)>='A' && s.charAt(i)<='Z'){
                sb.append(upperCase(s.charAt(i), n));
            }
            if(s.charAt(i)>='a' && s.charAt(i)<='z'){
                sb.append(lowerCase(s.charAt(i), n));
            }
            if(s.charAt(i)==' '){
                sb.append(" ");
            }
        }
        answer = sb.toString();
        
        return answer;
    }
    
    public char upperCase(char c, int n){
        char result = (char) (c + n);
        if(result > 'Z') result -= 26;
        return result;
    }
    
    public char lowerCase(char c, int n){
        char result = (char) (c + n);
        if(result > 'z') result -= 26;
        return result;
    }
    
}
