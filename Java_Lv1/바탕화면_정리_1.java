class Solution {
    public int[] solution(String[] wallpaper) {
        int[] answer = new int[4];
        
        int east = wallpaper[0].length();
        int west = 0;
        int north = wallpaper.length;
        int south = 0;
        
        
        for(String row : wallpaper) {
        	east = east > calcRowMin(row) ? calcRowMin(row) : east;
        	west = west < calcRowMax(row) ? calcRowMax(row) : west;
        }
        
        for(int i=0; i<wallpaper.length; i++) {
        	if(calcMinSharp(wallpaper[i])) {
        		north = i;
        		break;        		
        	}
        }
        
        for(int i=0; i<wallpaper.length; i++) {
        	south = calcMaxSharp(wallpaper[i]) ? i : south;
        }
        
        answer[0] = north;
        answer[1] = east;
        answer[2] = south+1;
        answer[3] = west+1;
        
        
        return answer;
    }

    public static int calcRowMin(String row) {
    	int min=row.length();

    	for(int i=0; i<row.length(); i++) {
    		if(row.charAt(i)=='#') {
    			min = min > i ? i : min;
    			break;
    		}
    	}
    	
    	return min;
    	
    }
    
    public static int calcRowMax(String row) {
    	int max=-1;

    	for(int i=row.length()-1; i>=0; i--) {
    		if(row.charAt(i)=='#') {
    			max = max < i ? i : max;
    			break;
    		}
    	}
    	
    	return max;
    	
    }
    
    public static boolean calcMinSharp(String row) {
    	boolean result = false;

    	for(int i=0; i<row.length(); i++) {
    		if(row.charAt(i)=='#') {
    			result = true;
    			break;
    		}
    	}

    	return result;
    	
    }

    public static boolean calcMaxSharp(String row) {
    	boolean result = false;

    	for(int i=row.length()-1; i>=0; i--) {
    		if(row.charAt(i)=='#') {
    			result = true;
    			break;
    		}
    	}

    	return result;
    	
    }

}
