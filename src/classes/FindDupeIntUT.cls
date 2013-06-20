@isTest
private class FindDupeIntUT {

	// Size of integer array for limits testing.
	// Set to a substantial number related to the system limit of Script stateemnts.
	private static final Integer MAX_ARRAY_SIZE = Limits.getLimitScriptStatements()/5;		
	
	// Basic valid scenario tests
	@isTest static void basicPositiveTests() {
		system.assertEquals(1,FindDupeInt.find(new Integer[]{1,2,3,1}));	// lowest numbers match
		system.assertEquals(2,FindDupeInt.find(new Integer[]{1,2,3,2}));	// 2 middle numbers match
		system.assertEquals(3,FindDupeInt.find(new Integer[]{3,1,2,3}));	// highest numbers match
		system.assertEquals(10,FindDupeInt.find(new Integer[]{10,10}));		// 2-element array
	}
	
	// Error input states, don't match input requirements.  Ensure no exception thrown.
	@isTest static void errorTests() {
		system.assertEquals(null,FindDupeInt.find(new Integer[]{1,2,3,4}));	// no dupes
		system.assertEquals(null,FindDupeInt.find(new Integer[]{}));		// empty array (no dupes)
		system.assertEquals(null,FindDupeInt.find(null));					// null passed (no integers)
	}

	// Limit tests
	@isTest static void limitTests() {
		Integer[] bigList = new Integer[]{};

		for (Integer i=0; i<MAX_ARRAY_SIZE; i++)
			bigList.add(i+1);
		bigList.add(MAX_ARRAY_SIZE/2);	// Insert one dupe number that is in the middle of the array's values

		Test.startTest();
		system.assertEquals(MAX_ARRAY_SIZE/2, FindDupeInt.find(bigList));
		// Verify script statement limits grows linearly with the array size, with a small overhead of addl. statements
		// Ensures that method will be able to test an array whose size is close to the Script Statements limits.
		system.assert(Limits.getScriptStatements() < MAX_ARRAY_SIZE + 100);
		Test.stopTest();
	}
}