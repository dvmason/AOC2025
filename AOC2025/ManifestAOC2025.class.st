"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAOC2025',
	#superclass : 'PackageManifest',
	#category : 'AOC2025-Manifest',
	#package : 'AOC2025',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAOC2025 class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Symbol #value:value: #false)) #'2025-12-06T10:00:13.448025-05:00') )
]

{ #category : 'code-critics' }
ManifestAOC2025 class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOC2025 class' #day05a: #true)) #'2025-12-06T10:57:37.208047-05:00') #(#(#RGMethodDefinition #(#'AOC2025 class' #day05b: #true)) #'2025-12-06T11:10:20.564089-05:00') )
]

{ #category : 'code-critics' }
ManifestAOC2025 class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOC2025 class' #day06b: #true)) #'2025-12-06T09:53:36.466627-05:00') )
]

{ #category : 'code-critics' }
ManifestAOC2025 class >> ruleReCollectionAtCollectionSizeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOC2025 class' #day06a: #true)) #'2025-12-06T10:01:16.85279-05:00') )
]

{ #category : 'code-critics' }
ManifestAOC2025 class >> ruleWhileTrueRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AOC2025 class' #day06b: #true)) #'2025-12-06T09:53:28.541495-05:00') )
]
