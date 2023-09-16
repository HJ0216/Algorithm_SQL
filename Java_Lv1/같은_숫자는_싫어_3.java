import java.util.LinkedList;
public class Solution {
    public int[] solution(int []arr) {
        LinkedList<Integer> list = new LinkedList<Integer>();
        list.add(arr[0]);
        
        for(int i=1; i<arr.length; i++){
            if(arr[i]!=list.getLast()){
                list.add(arr[i]);
            }
        }
        
        Integer[] listing = list.toArray(new Integer[list.size()]);
        
        Integer[] listing = list.toArray(new Integer[list.size()]);
        
        int[] answer = Arrays.stream(listing)
                             .mapToInt(Integer::intValue)
                             .toArray();
        
        return answer;

    }
}
