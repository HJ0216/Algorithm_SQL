import java.util.Arrays;
import java.util.Stack;

class Solution {
    public int[] solution(int[] numbers) {
        int[] answer = new int[numbers.length];

        Stack<Integer> indexNumber = new Stack<>();

        Arrays.fill(answer, -1);

        for (int i=0; i < numbers.length; i++) {
            while (!indexNumber.isEmpty() && (numbers[indexNumber.peek()] < numbers[i])) {
                answer[indexNumber.pop()] = numbers[i];                    
            }
            indexNumber.push(i);
        }
        return answer;
    }
}
