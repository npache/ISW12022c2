!classDefinition: #I category: 'NaturalNumbers'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'NaturalNumbers'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'CG 8/29/2022 19:56:59'!
next

	^ II! !


!I class methodsFor: 'operations' stamp: 'cg 8/29/2022 10:38:17'!
* aMultiplyer

	^ aMultiplyer! !

!I class methodsFor: 'operations' stamp: 'CG 8/29/2022 19:56:22'!
+ anAdder

	^ anAdder next! !

!I class methodsFor: 'operations' stamp: 'cg 8/31/2022 12:54:55'!
- aSubtrahend

	self error: self negativeNumbersNotSupportedErrorDescription! !

!I class methodsFor: 'operations' stamp: 'cg 8/31/2022 12:55:40'!
/ aDivider

	aDivider = I ifTrue: [^ self].
	self error: self canNotDivideByBiggerNumberErrorDescription! !

!I class methodsFor: 'operations' stamp: 'CG 8/29/2022 20:27:49'!
substractFrom: aMinuend

	^ aMinuend previous! !


!I class methodsFor: 'error descriptions' stamp: 'cg 8/31/2022 12:55:48'!
canNotDivideByBiggerNumberErrorDescription

	^ 'divider can not be greater than dividend'! !

!I class methodsFor: 'error descriptions' stamp: 'cg 8/31/2022 12:55:07'!
negativeNumbersNotSupportedErrorDescription

	^ 'subtrahend can not be greater than or equal to minuend'! !


!I class methodsFor: 'comparisions' stamp: 'cg 8/29/2022 11:21:40'!
< aNumber

	aNumber = I ifTrue: [^ false].
	^ true! !


!classDefinition: #II category: 'NaturalNumbers'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'NaturalNumbers'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'next & previous' stamp: 'CG 8/29/2022 21:48:37'!
nameOfNext

	(self name endsWith: 'CMXCIX') ifTrue: [^ (self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue: [^ (self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CCCXCIX') ifTrue: [^ (self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue: [^ (self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue: [^ (self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue: [^ (self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue: [^ (self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue: [^ (self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue: [^ (self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue: [^ (self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue: [^ (self name withoutSuffix: 'III'), 'IV'].
	^ self name , 'I'! !

!II class methodsFor: 'next & previous' stamp: 'CG 8/29/2022 21:17:05'!
next
	
	next ifNil: [
		next := II createChildNamed: self nameOfNext.
		next previous: self.
		].
	^ next! !

!II class methodsFor: 'next & previous' stamp: 'cg 8/29/2022 12:58:16'!
previous

	^ previous! !

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:25:57'!
previous: aNumber 

	previous := aNumber! !


!II class methodsFor: 'remove all next' stamp: 'cg 8/29/2022 12:59:08'!
removeAllNext

	next ifNotNil: [
		next removeAllNext.
		next removeFromSystem.
		next := nil
		]! !


!II class methodsFor: 'operations' stamp: 'cg 8/29/2022 11:51:25'!
* aMultiplyer

	^ self previous * aMultiplyer + aMultiplyer! !

!II class methodsFor: 'operations' stamp: 'cg 8/29/2022 12:59:22'!
+ anAdder 

	^ self previous + anAdder next! !

!II class methodsFor: 'operations' stamp: 'CG 8/29/2022 20:29:36'!
- aSubtrahend 

	^ aSubtrahend substractFrom: self! !

!II class methodsFor: 'operations' stamp: 'cg 8/31/2022 12:56:26'!
/ aDivider

	self < aDivider ifTrue: [self error: self canNotDivideByBiggerNumberErrorDescription].
	self < (aDivider * II) ifTrue: [^ I].
	^ self - aDivider / aDivider + I! !

!II class methodsFor: 'operations' stamp: 'CG 8/29/2022 20:28:57'!
substractFrom: aMinuend

	^ aMinuend previous - self previous! !


!II class methodsFor: 'comparisions' stamp: 'cg 8/29/2022 11:21:50'!
< aNumber

	aNumber = I ifTrue: [^ false].
	^ self previous < (aNumber previous)! !


!II class methodsFor: 'error descriptions' stamp: 'cg 8/31/2022 12:56:05'!
canNotDivideByBiggerNumberErrorDescription

	^ 'divider can not be greater than dividend'! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'cg 8/31/2022 12:57:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'NaturalNumbers'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'NaturalNumbers'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'cg 8/31/2022 12:57:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: 'NaturalNumbers'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'NaturalNumbers'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'cg 8/31/2022 12:57:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!