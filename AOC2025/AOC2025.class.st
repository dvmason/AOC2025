Class {
	#name : 'AOC2025',
	#superclass : 'Object',
	#category : 'AOC2025',
	#package : 'AOC2025'
}

{ #category : 'AdventOfCode' }
AOC2025 class >> day01a: aString [

	| safe |
	safe := Safe new.
	aString lines do: [ :line | safe dial: line ].
	^ safe count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day01b: aString [

	| safe |
	safe := Safe new.
	aString lines do: [ :line | safe click: line ].
	^ safe count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day02a: aString [ 

	| total |
	total := 0.
	(aString splitOn: $,) do: [ : range | | parts |
		parts := range splitOn: $-.
		parts first asInteger to: parts last asInteger do: [ : n |
			n dupped ifTrue: [ total := total + n ] ] ].
	^ total
	
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day02b: aString [ 

	| total |
	total := 0.
	(aString splitOn: $,) do: [ : range | | parts |
		parts := range splitOn: $-.
		parts first asInteger to: parts last asInteger do: [ : n |
			n repped ifTrue: [ total := total + n ] ] ].
	^ total
	
]
