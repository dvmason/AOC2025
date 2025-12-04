Extension { #name : 'ByteString' }

{ #category : '*AOC2025' }
ByteString >> findAlternateLargestSum [

	| str |
	str := self first: 13.
	13 to: self size do: [ : index |
		str at: 13 put: (self at: index).
		str shiftToMaximize ].
	^ (str first: 12) asInteger
	
]

{ #category : '*AOC2025' }
ByteString >> findLargestSum [

	| largest next index |
	largest := self max.
	index := self indexOf: largest.
	index < self size ifTrue: [
		next := (self allButFirst: index) max.
		^ (String with: largest with: next) asInteger]. 
	next := (self allButLast) max.
	^ (String with: next with: largest) asInteger
]

{ #category : '*AOC2025' }
ByteString >> shiftToMaximize [

	1 to: self size - 1 do: [ : index |
		(self at: index) < (self at: index + 1) ifTrue: [
			^ self replaceFrom: index to: self size  - 1  with: self startingAt: index + 1] ]
]
