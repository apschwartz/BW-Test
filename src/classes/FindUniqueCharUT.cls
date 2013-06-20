@isTest
private class FindUniqueCharUT {
	
	// Length of string for limits testing.
	private static final Integer MAX_STRING_LENGTH = 10000;		
	
	// Basic valid scenario tests
	@isTest static void basicPositiveTests() {
		system.assertEquals('a', FindUniqueChar.find('abb'));
		system.assertEquals('b', FindUniqueChar.find('aab'));
		system.assertEquals('c', FindUniqueChar.find('abcab'));
		system.assertEquals('a', FindUniqueChar.find('a'));
		system.assertEquals(null, FindUniqueChar.find('aabb'));
		system.assertEquals(null, FindUniqueChar.find(''));
	}
	
	// Error input states, don't match input requirements.  Ensure no exception thrown.
	@isTest static void errorTests() {
		system.assertEquals(null, FindUniqueChar.find(null));
	}

	// Limit tests.
	// Validate unusual case where string contains non-basic-ascii characters and is also relatively long
	@isTest static void limitTests() {
		Integer[] charArray = new Integer[]{};

		integer i;
		for (i=0; i<MAX_STRING_LENGTH/2; i++) {
			charArray.add(i);
			charArray.add(i);
		}
		charArray.add(i+1);
		String s = String.fromCharArray(charArray);

		Test.startTest();
		system.assertEquals(s.right(1), FindUniqueChar.find(s));
		Test.stopTest();
	}	
	
}