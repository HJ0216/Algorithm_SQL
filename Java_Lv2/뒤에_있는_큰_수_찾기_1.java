import java.util.Stack;

class Solution {
    public int[] solution(int[] numbers) {
        int[] answer = new int[numbers.length];
        
        Stack<Integer> reverseNumbers = new Stack<>();
        
        for(int i = numbers.length-1; i>=0; i--){
            while(!reverseNumbers.isEmpty()){
                if(reverseNumbers.peek()>numbers[i]){
                    answer[i] = reverseNumbers.peek();
                    break;
                }
                if(reverseNumbers.peek()<=numbers[i]){
                    reverseNumbers.pop();
                }
            }

            if(reverseNumbers.isEmpty()){
                answer[i] = -1;
            }
            
            reverseNumbers.push(numbers[i]);

        }
        
        return answer;
    }
}
