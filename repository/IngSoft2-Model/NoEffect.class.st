"
I'm No Effect, if i am chosen by the Effect Roulette, nothing happens.
"
Class {
	#name : #NoEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model-Effects'
}

{ #category : #playing }
NoEffect >> applyEffectTo: aPosition knowing: players the: currentPlayer and: finishline [  
	^ aPosition.
]
