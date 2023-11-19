class Solution {    
    public String solution(String s) {
        String answer = "";
        
        StringBuilder sb = new StringBuilder();
        
        boolean flag = true;
        for(int i=0; i<s.length(); i++){
            if(s.charAt(i) == ' '){
                sb.append(' ');
                flag = true;
                continue;
            }
            if(flag){
                sb.append(Character.toString(s.charAt(i)).toUpperCase());
                flag = !flag;
            }
            else if(!flag){
                sb.append(Character.toString(s.charAt(i)).toLowerCase());
                flag = !flag;
            }
            
        }
        
        answer = sb.toString();
        return answer;
    }
}
