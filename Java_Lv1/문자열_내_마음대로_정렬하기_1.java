import java.util.Arrays;
import java.util.Comparator;

class Solution {
    public String[] solution(String[] strings, int n) {
        
        // 1. 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬
        // 2. 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순 정렬
        
        String[] answer = {};
        
        Arrays.sort(strings, new Comparator<String>() {
        	
        	public int compare(String s1, String s2) {
        		int result = Integer.compare(s1.charAt(n), s2.charAt(n));
        		if (result == 0) {
        			result = s1.compareTo(s2);
        		}
        		return result;
        	};
        	
		});
        
        return strings;
    }
}
