Class {
	#name : #MoonWalk,
	#superclass : #Object,
	#instVars : [
		'maxNumberOfLockersBackwards',
		'numberProvider'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalk class >> assertMaxBackwardsGreaterThanZero: aNumber [

	aNumber > 0
		ifFalse: [ InstanceCreationFailed signal: 'MoonWalk must at least be greater than 0' ]
]

{ #category : #'instance creation' }
MoonWalk class >> maxBackwards: aNumberOfLockers [ 
	^ self maxBackwards: aNumberOfLockers source: Random new.

]

{ #category : #'instance creation' }
MoonWalk class >> maxBackwards: aNumberOfLockers aNumberOfLockersSequence: aSequence [ 
	^ self 
		maxBackwards: aNumberOfLockers 
		source: (SequentialNaturalNumberProvider providing: aSequence).

]

{ #category : #'instance creation' }
MoonWalk class >> maxBackwards: aNumberOfLockers source: aNumberProvider [  

	self assertMaxBackwardsGreaterThanZero: aNumberOfLockers .

	^ self new
		initializeMaxBackwards: aNumberOfLockers 
		source: aNumberProvider.

]

{ #category : #playing }
MoonWalk >> applyEffectTo: aPosition  knowing: players and: aCurrentPlayer inThe: game [
	
	| lockers |
	lockers := self moveBackwards.
	players do: [:player | player ~= aCurrentPlayer ifTrue: [ game moveBackwards: player amountOf: lockers  ] ] .

	^ aPosition.
]

{ #category : #'as yet unclassified' }
MoonWalk >> initializeMaxBackwards: aNumberOfLockers source: aNumberProvider [

	maxNumberOfLockersBackwards := aNumberOfLockers.
	numberProvider := aNumberProvider.
]

{ #category : #playing }
MoonWalk >> moveBackwards [

	^ numberProvider nextInt: maxNumberOfLockersBackwards. 
]