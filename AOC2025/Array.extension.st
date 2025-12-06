Extension { #name : 'Array' }

{ #category : '*AOC2025' }
Array >> column: anInteger [ 

	
	^ self collect: [ : row |
		row size < anInteger ifTrue: [ ^ nil ].
		(row allButFirst: anInteger - 1) first ]
]
