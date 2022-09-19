!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'finder stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'cg 9/19/2022 11:45:06'!
setUp

	finder := SentenceFinderByPrefix new.
	stack := OOStack new.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 12:16:28'!
test01EmptyStackReturnsEmptyList

	| sentences |
	
	sentences := finder findSentencesWithPrefix: 'pref' in: stack.
	
	self assert: sentences isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 11:49:36'!
test02CanNotSearchEmptyPrefixInEmptyStack

	self
		should: [ finder findSentencesWithPrefix: '' in: stack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 11:50:58'!
test03CanNotSearchEmptyPrefixInNotEmptyStack

	stack push: 'Hola Mundo'.

	self
		should: [ finder findSentencesWithPrefix: '' in: stack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 11:59:05'!
test04CanNotSearchPrefixWithSpacesInEmptyStack

	self
		should: [ finder findSentencesWithPrefix: 'ho la' in: stack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpaceErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 11:59:58'!
test05CanNotSearchPrefixWithSpacesInNotEmptyStack

	stack push: 'Hola Mundo!!'.

	self
		should: [ finder findSentencesWithPrefix: 'ho la' in: stack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpaceErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 12:14:16'!
test06ReturnsExpectedSentences

	| actualSentences expectedSentences |

	stack push: 'Hola Mundo!!'.
	stack push: 'Hola Profes'.
	stack push: 'Chau'.

	actualSentences := finder findSentencesWithPrefix: 'Hola' in: stack.
	
	expectedSentences := OrderedCollection new.
	expectedSentences add: 'Hola Profes'; add: 'Hola Mundo!!'.
	
	self assert: (actualSentences isEqualTo: expectedSentences)! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 12:13:20'!
test07ReturnsEmptyListWhenPrefixIsNotFound

	| actualSentences expectedSentences |

	stack push: 'Hola Mundo!!'.
	stack push: 'Hola Profes'.

	actualSentences := finder findSentencesWithPrefix: 'Chau' in: stack.
	
	expectedSentences := OrderedCollection new.
		
	self assert: (actualSentences isEqualTo: expectedSentences)! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 12:12:03'!
test08FinderIsCaseSensitive

	| actualSentences expectedSentences |

	stack push: 'Hola Mundo!!'.
	stack push: 'hola profes'.

	actualSentences := finder findSentencesWithPrefix: 'hola' in: stack.
	
	expectedSentences := OrderedCollection new.
	expectedSentences add: 'hola profes'.
		
	self assert: (actualSentences isEqualTo: expectedSentences)! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cg 9/19/2022 12:12:17'!
test09StackDoesNotChange

	| oldStack |

	stack push: 'Hola Mundo!!'.
	stack push: 'hola profes'.
	stack push: 'Todo bien?'.
	stack push: 'promocionar'.

	oldStack := stack.

	finder findSentencesWithPrefix: 'prom' in: stack.
	
	self assert: (oldStack isEqualTo: stack)! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stackActionsPrivate' stamp: 'cg 9/18/2022 12:18:40'!
getState

	^ OOStackState getStateFor: self size! !

!OOStack methodsFor: 'stackActionsPrivate' stamp: 'CG 9/15/2022 21:35:27'!
safePop

	^ elements removeLast ! !

!OOStack methodsFor: 'stackActionsPrivate' stamp: 'CG 9/15/2022 21:33:02'!
safeTop

	^ elements last! !


!OOStack methodsFor: 'stackActions' stamp: 'CG 9/15/2022 21:14:24'!
isEmpty
	
	^ elements isEmpty ! !

!OOStack methodsFor: 'stackActions' stamp: 'cg 9/18/2022 12:20:47'!
pop
	
	^ self getState popFor: self! !

!OOStack methodsFor: 'stackActions' stamp: 'cg 9/18/2022 12:22:40'!
push: aString

	elements add: aString! !

!OOStack methodsFor: 'stackActions' stamp: 'CG 9/15/2022 20:40:23'!
size

	^ elements size ! !

!OOStack methodsFor: 'stackActions' stamp: 'cg 9/18/2022 12:22:06'!
top

	^ self getState topFor: self! !


!OOStack methodsFor: 'initialization' stamp: 'cg 9/18/2022 12:11:32'!
initialize

	elements := OrderedCollection new! !


!OOStack methodsFor: 'stackErrors' stamp: 'CG 9/15/2022 21:34:33'!
stackEmptyError

	^ self error: self class stackEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'errorDescriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'stackStateActions' stamp: 'CG 9/15/2022 21:30:58'!
popFor: aStack

	self subclassResponsibility ! !

!OOStackState methodsFor: 'stackStateActions' stamp: 'CG 9/15/2022 21:24:22'!
topFor: aStack

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'errorDescriptions' stamp: 'cg 9/18/2022 12:04:53'!
invalidStackSizeErrorDescription

	^ 'invalid stack size'! !


!OOStackState class methodsFor: 'instanceCreation' stamp: 'cg 9/18/2022 12:20:15'!
getStateFor: aStackSize

	| subclass |
	
	subclass := self subclasses detect: [ :aSubclass | aSubclass isForStackSize: aStackSize ] ifNone: [ self error: self invalidStackSizeErrorDescription ].
	
	^ subclass new! !

!OOStackState class methodsFor: 'instanceCreation' stamp: 'cg 9/18/2022 12:15:16'!
isForStackSize: aStackSize

	self subclassResponsibility! !


!classDefinition: #OOStackEmptyState category: 'Stack-Exercise'!
OOStackState subclass: #OOStackEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmptyState methodsFor: 'stackStateActions' stamp: 'CG 9/15/2022 21:34:54'!
popFor: aStack

	^ aStack stackEmptyError ! !

!OOStackEmptyState methodsFor: 'stackStateActions' stamp: 'CG 9/15/2022 21:34:48'!
topFor: aStack

	^ aStack stackEmptyError ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmptyState class' category: 'Stack-Exercise'!
OOStackEmptyState class
	instanceVariableNames: ''!

!OOStackEmptyState class methodsFor: 'instanceCreation' stamp: 'cg 9/18/2022 12:14:50'!
isForStackSize: aStackSize

	^ aStackSize = 0! !


!classDefinition: #OOStackNotEmptyState category: 'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmptyState methodsFor: 'stackStateActions' stamp: 'cg 9/18/2022 12:21:07'!
popFor: aStack

	^ aStack safePop! !

!OOStackNotEmptyState methodsFor: 'stackStateActions' stamp: 'cg 9/18/2022 12:22:14'!
topFor: aStack

	^ aStack safeTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmptyState class' category: 'Stack-Exercise'!
OOStackNotEmptyState class
	instanceVariableNames: ''!

!OOStackNotEmptyState class methodsFor: 'instanceCreation' stamp: 'cg 9/18/2022 12:14:56'!
isForStackSize: aStackSize

	^ aStackSize ~= 0! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'cg 9/19/2022 12:19:34'!
findSentencesWithPrefix: aPrefix in: aStack

	| sentencesWithPrefix allSentences |
	
	self checkIfValid: aPrefix.
		
	sentencesWithPrefix := OrderedCollection new.
	allSentences := OrderedCollection new.
	
	[ aStack isEmpty ] whileFalse: [
		
		| sentence |
		
		sentence := aStack pop.
		
		(sentence beginsWith: aPrefix)
			ifTrue: [ sentencesWithPrefix add: sentence ].
			
		allSentences add: sentence
		
		].
	
	self restoreStack: aStack withElements: allSentences.
	
	^ sentencesWithPrefix! !


!SentenceFinderByPrefix methodsFor: 'errors' stamp: 'cg 9/19/2022 11:41:00'!
emptyPrefixError

	^ self class emptyPrefixErrorDescription ! !

!SentenceFinderByPrefix methodsFor: 'errors' stamp: 'cg 9/19/2022 11:52:21'!
prefixWithSpaceError

	^ self class prefixWithSpaceErrorDescription ! !


!SentenceFinderByPrefix methodsFor: 'finderPrivate' stamp: 'cg 9/19/2022 12:19:02'!
checkIfValid: aPrefix

	(aPrefix isEmpty) ifTrue: [ self error: self emptyPrefixError ].
	((aPrefix indexOf: $ ) ~= 0) ifTrue: [ self error: self prefixWithSpaceError ]! !

!SentenceFinderByPrefix methodsFor: 'finderPrivate' stamp: 'cg 9/19/2022 11:33:08'!
restoreStack: aStack withElements: sentences

	sentences do: [ :aSentence | aStack push: aSentence ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errorDescriptions' stamp: 'cg 9/19/2022 11:40:04'!
emptyPrefixErrorDescription

	^ 'prefix can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'errorDescriptions' stamp: 'cg 9/19/2022 11:52:40'!
prefixWithSpaceErrorDescription

	^ 'prefix can not have spaces'! !
