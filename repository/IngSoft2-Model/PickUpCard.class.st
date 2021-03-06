Class {
	#name : #PickUpCard,
	#superclass : #Effect,
	#instVars : [
		'cardsProvider'
	],
	#category : #'IngSoft2-Model-Effects'
}

{ #category : #instanceCreation }
PickUpCard class >> withRandom: cards [
	^self new initializeWithRandom: cards.
]

{ #category : #'instance creation' }
PickUpCard class >> withSequence: aSequenceOfCards [
	^self new initializeWithSequence: aSequenceOfCards.
]

{ #category : #playing }
PickUpCard >> applyEffectTo: aPosition knowing: players the: currentPlayer and: finishline [  
	currentPlayer addCard: cardsProvider nextCard.
	^aPosition.
]

{ #category : #initialization }
PickUpCard >> initializeWithRandom: cards [
   cardsProvider:= RandomCardProvider providing: cards.
]

{ #category : #initialization }
PickUpCard >> initializeWithSequence: aSequenceOfCards [ 

	cardsProvider:= SequentialCardProvider providing: aSequenceOfCards.
		
]

{ #category : #playing }
PickUpCard >> nextCard [
	^cardsProvider nextCard.
]
