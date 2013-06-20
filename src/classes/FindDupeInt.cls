// Requirement:
//		Given an array of integers between 1 and 1,000,000. One integer is in the array twice. Find the duplicate.
//
// Assumptions:
//		Method does not have to support the theoretical limit1 of 1,000,001 elements.
//		It is acceptable that method can handle an array whose size is nearly equal to the current Apex Script Statements limit.
//		Array is not sparse; that is, has no null elements.
//		If array has more than one duplicate integer, then only one duplicate will be found.
//		It is acceptable to report only the duplicates' value, not their positions in the array.
//		If no duplicates actually exist, then null will be returned.
//		No check is made that integers are actually between 1 and 1,000,000.
public class FindDupeInt {
	
	// Finds the duplicate integer.
	public static Integer Find(Integer[] intArray) {
		if (intArray == null) return null;

		// Sort array.  Then walk through elements serially looking for two identical elements in a row.
		intArray.sort();
		for (Integer i=0; i<intArray.size()-1; i++)
			if (intArray[i] == intArray[i+1]) return intArray[i];
		
		return null;

	}
}