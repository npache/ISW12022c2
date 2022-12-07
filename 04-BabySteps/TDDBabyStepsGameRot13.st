!classDefinition: #TDDBabyStepsRot13Test category: 'TDDBabyStepsGameRot13'!
TestCase subclass: #TDDBabyStepsRot13Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGameRot13'!

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:37:06'!
test01CorrectlyEncodesALowercaseCharFromTheFirstPartOfTheAlphabet
	
	self assert: $n equals: $a asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:37:57'!
test02CorrectlyEncodesALowercaseCharFromTheFirstPartOfTheAlphabet
	
	self assert: $z equals: $m asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:38:38'!
test03CorrectlyEncodesALowercaseCharFromTheSecondPartOfTheAlphabet
	
	self assert: $a equals: $n asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:39:40'!
test04CorrectlyEncodesALowercaseCharFromTheSecondPartOfTheAlphabet
	
	self assert: $m equals: $z asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:40:06'!
test05CharOnTheBelowRangeDoesntChange
	
	self assert: $` equals: $` asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:42:07'!
test06CharOnTheUpperRangeDoesntChange
	
	self assert: ${ equals: ${ asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:42:55'!
test07CorrectlyEncodesAnUppercaseCharFromTheFirstPartOfTheAlphabet
	
	self assert: $N equals: $A asRot13.
	self assert: $Z equals: $M asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:43:57'!
test08CorrectlyEncodesAnUppercaseCharFromTheSecondPartOfTheAlphabet
	
	self assert: $A equals: $N asRot13.
	self assert: $M equals: $Z asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:48:55'!
test09TheEmptyStringDoesntChange
	
	self assert: '' equals: '' asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:52:17'!
test10CorrectlyEncodesAOneCharString
	
	self assert: 'n' equals: 'a' asRot13.
	self assert: 'Z' equals: 'M' asRot13.
	self assert: 'a' equals: 'n' asRot13.
	self assert: '{' equals: '{' asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 18:57:57'!
test11CorrectlyEncodesATwoCharString
	
	self assert: 'nm' equals: 'az' asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 19:00:02'!
test12CorrectlyEncodesMoreThanTwoCharString
	
	self assert: 'uByN!!' equals: 'hOlA!!' asRot13
	! !

!TDDBabyStepsRot13Test methodsFor: 'tests' stamp: 'CG 9/29/2022 19:08:05'!
testExtraToCheckGeneralizationOnKata
		
	self assert: 'Ju3er j3 4e3 t01at j3 q0ag a3rq e04q$...' equals: 'Wh3re w3 4r3 g01ng w3 d0nt n3ed r04d$...' asRot13
	! !
