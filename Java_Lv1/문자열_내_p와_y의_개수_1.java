class Solution {
    boolean solution(String s) {
        
        // 1. s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 return
        // 2. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴'
        // 3. 개수를 비교할 때 대문자와 소문자는 구별하지 않음
        
        boolean answer = true;
        int cnt = 0;
        
        s = s.toLowerCase();
        for(int i=0; i<s.length(); i++){
            char c = s.charAt(i);
            if(c=='p'){
                cnt++;
            }
            if(c=='y'){
                cnt--;
            }
        }
        
        if(cnt!=0){
            answer = false;
        }

        return answer;
    }
}
