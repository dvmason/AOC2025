"
I maintain a set of ranges expressed as Point object
"
Class {
	#name : 'RangeMap',
	#superclass : 'Object',
	#instVars : [
		'ranges'
	],
	#category : 'AOC2025-Support',
	#package : 'AOC2025',
	#tag : 'Support'
}

{ #category : 'adding' }
RangeMap >> add: aCollection [

	ranges add: aCollection first asInteger @ aCollection last asInteger
]

{ #category : 'testing' }
RangeMap >> includes: anInteger [

	^ ranges anySatisfy: [ :range |
		anInteger between: range x and: range y ]
]

{ #category : 'initialization' }
RangeMap >> initialize [

	super initialize.
	ranges := OrderedCollection new
]

{ #category : 'accessing' }
RangeMap >> uniqueValues [

	| count previous sorted |
	count := 0.
	previous := 0.
	sorted := ranges sorted: [ :a :b | a x < b x or: [ a x = b x and: [ a y <= b y ] ] ].
	sorted do: [ :this |
		this y > previous ifTrue: [
			count := count + this y - (previous max: this x - 1).
			previous := previous max: this y ] ].
	^ count
]
