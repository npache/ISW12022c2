!classDefinition: #TDDBabyStepsAnagramsTest category: 'TDDBabyStepsGameAnagrams'!
TestCase subclass: #TDDBabyStepsAnagramsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGameAnagrams'!

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 20:24:44'!
test01EmptyStringAnagramIsJustACollectionWithTheEmptyString

	self assert: (Set with: '') equals: '' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 20:26:35'!
test02OneCharStringAnagramReturnsACollectionWithTheSameOneCharString

	self assert: (Set with:'a') equals: 'a' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 21:28:31'!
test03TwoCharStringAnagramReturnsTheOriginalStringAndAnotherOneFlipped

	self assert: (Set with:'ab' with: 'ba') equals: 'ab' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 21:39:33'!
test04ThreeCharStringAnagramReturnsAllThe6PossibleOrderCombinations

	| anagrams |
	
	anagrams := Set new.
	anagrams add: 'abc'.
	anagrams add: 'acb'.
	anagrams add: 'bac'.
	anagrams add: 'bca'.
	anagrams add: 'cab'.
	anagrams add: 'cba'.

	self assert: anagrams equals: 'abc' anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 21:48:42'!
test05MoreThanThreeCharStringAnagramReturnsAllTheCorrectPossibleOrderCombinations

	| anagrams palabra |
	
	anagrams := Set new.
	anagrams add: 'abcd'; add: 'abdc'; add: 'acbd'; add: 'acdb'; add: 'adbc'; add: 'adcb'; add: 'bacd'; add: 'badc'; add: 'bcad'; add: 'bcda'; add: 'bdac'; add: 'bdca'; add: 'cabd'; add: 'cadb'; add: 'cbad'; add: 'cbda'; add: 'cdab'; add: 'cdba'; add: 'dabc'; add: 'dacb'; add: 'dbac'; add: 'dbca'; add: 'dcab'; add: 'dcba'.

	palabra := 'abcd'.

	self assert: anagrams equals: palabra anagrams
	! !

!TDDBabyStepsAnagramsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 21:53:11'!
testExtraToCheckGeneralizationOnKata

	self assert: 40320 equals:`'abcdefgh' anagrams` size.
	
	self assert: (`'abcdefgh' anagrams`) includes: 'cghdbeaf'.
	
	self assert: 10080 equals: `'abcdefab' anagrams` size
	! !
