class Solution {
    public String[] solution(String[] strings, int n) {
      
    // 1. 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬
    // 2. 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순 정렬
      
    List<String> list = Arrays.asList(strings);
        
    list.sort((a, b) -> {
        int result = (a.split(""))[n].compareTo((b.split(""))[n]);
        
        if(result == 0)
            return a.compareTo(b);
        
        return result;
    });
        
    return list.toArray(new String[0]);

  }
}
