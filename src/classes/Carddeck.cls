// Requirement:
//		A standard deck of 52 cards is represented in an array. Each card is represented as an integer. Write a method to shuffle the cards.
//
// Assumptions:
//		Added a "number of shuffles" parameter to the shuffle method to provide something equivalent to 
//		the amount of shuffling the deck shold receive.  This must be between 1 and 10.
public class Carddeck {
	Integer[] cardDeck = new Integer[]{};

	// Initialization results in a full, but unsorted, deck.
	public Carddeck() {
		for (Integer i=1; i<=52; i++)
			cardDeck.add(i);
	}

	// Helper method to randomly choose one card out of a deck of 52 cards.
	// Returns a number between 0..51, representing the card's position in the deck.
	private Integer randomCardNumber() {
		return Math.mod(Integer.valueOf(Math.random()*100), 52);
	}

	// Helper method to swap the contents of two array locations with each other.
	// Operates on the common cardDeck instance variable.
	private void swapCards(Integer cardPlace1,
						   Integer cardPlace2) {
		Integer temp = cardDeck[cardPlace1];
		cardDeck[cardPlace1] = cardDeck[cardPlace2];
		cardDeck[cardPlace2] = temp;
	}

	// Shuffle cards.  One shuffle is considered 52 random card swaps.
	// Accept number of shuffles to perform, between 1 and 10.
	public void shuffle(Integer nmbrShuffles) {
		Integer cardPlace1, cardPlace2;

		// Do nothing if illegal number of shuffles requested.  Could throw error, but chose not to.
		if (nmbrShuffles<1 || nmbrShuffles>10) return;

		for (Integer j=1; j<=nmbrShuffles; j++)	
			for (Integer i=1; i<=52; i++) {
				cardPlace1 = randomCardNumber();
				cardPlace2 = randomCardNumber();
				swapcards(cardPlace1, cardPlace2);
			}
	}

	// Return a deck of cards.  Note, this is a copy of the internal deck of cards so that the caller cannot 
	// modify the deck thereby possibly introducing errors upon further shuffles (such as creating dupliate cards).
	public Integer[] returnDeck() {
		return cardDeck.clone();
	}
}