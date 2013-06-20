// Requirement:
//		Find the first non-repeating character in a string:("DEFD" -> E )
//
// Assumptions:
//		THere may be no unique character, in which case null is returned.

public class FindUniqueChar {

	public static String Find(String inputString) {
		if (inputString == null) return null;

		for (Integer i=0; i<inputString.length(); i++)
			if (inputString.countMatches(inputString.mid(i,1)) == 1) return inputString.mid(i,1);
		
		return null;
	}
}