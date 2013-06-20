@isTest
private class CarddeckUT {

	// Helper function to validate that all elements in an array are unique.
	private static Boolean arrayElementsUnique(Integer[] intArray) {
		Set<Integer> intSet = new Set<Integer>(intArray);
		return intSet.size() == intArray.size();
	}
	// Ensure helper function is functioning.
	@isTest static void testArrayElementsUnique() {
		system.assertEquals(true, arrayElementsUnique(new Integer[]{1,2,3,4}));
		system.assertEquals(false, arrayElementsUnique(new Integer[]{1,2,3,1}));
		system.assertEquals(true, arrayElementsUnique(new Integer[]{10,11}));
		system.assertEquals(false, arrayElementsUnique(new Integer[]{10,10}));
	}
	
	// Shuffle a deck of cards.
	// Ensure shuffled deck varies from original and contains 52 unique cards.
	@isTest static void generalTestOnce() {
		cardDeck deck = new cardDeck();
		Integer[] cardsBefore, cardsAfter;

		cardsBefore = deck.returnDeck();
		deck.shuffle(1);
		cardsAfter = deck.returnDeck();
		system.assertNotEquals(cardsBefore, cardsAfter);
		system.assert(arrayElementsUnique(cardsAfter));
	}
	
	// Ensure max shuffles works.
	@isTest static void limitTests() {
		cardDeck deck = new cardDeck();
		Integer[] cardsBefore, cardsAfter;

		cardsBefore = deck.returnDeck();
		deck.shuffle(10);
		cardsAfter = deck.returnDeck();
		system.assertNotEquals(cardsBefore, cardsAfter);
		system.assert(arrayElementsUnique(cardsAfter));
	}

	// Test error cases
	@isTest static void errorTests() {
		cardDeck deck = new cardDeck();
		Integer[] cardsBefore, cardsAfter;

		cardsBefore = deck.returnDeck();
		deck.shuffle(-1);
		deck.shuffle(0);
		deck.shuffle(11);
		// None of hte above should have caused any shuffles to actually be done.
		// Deck should remain in initial order.
		cardsAfter = deck.returnDeck();
		system.assertEquals(cardsBefore, cardsAfter);
		system.assert(arrayElementsUnique(cardsAfter));
	}
	
}
