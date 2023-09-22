import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

class Solution {
        public String[] solution(String[] strings, int n) {
        
        // 1. 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬
        // 2. 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순 정렬
        
        String[] answer = {};

        List<String> list = new ArrayList<>();
        for (int i = 0; i < strings.length; i++) {
            list.add(strings[i].charAt(n) + strings[i]);
        }
        
        Collections.sort(list);
        answer = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            answer[i] = list.get(i).substring(1, list.get(i).length());
        }
        
        return answer;
    }
}
