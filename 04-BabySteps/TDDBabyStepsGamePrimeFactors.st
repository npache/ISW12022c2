!classDefinition: #TDDBabyStepsPrimeFactorsTest category: 'TDDBabyStepsGamePrimeFactors'!
TestCase subclass: #TDDBabyStepsPrimeFactorsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGamePrimeFactors'!

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:10:43'!
test01OneHasNoPrimeFactors
	
	self assert: Bag new equals: 1 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:13:08'!
test02FactorsOfAPrimeNumberAreThePrimeNumber

	self assert: (Bag with: 2) equals: 2 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:14:23'!
test03FactorsOfAPrimeNumberAreThePrimeNumber

	self assert: (Bag with: 3) equals: 3 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:15:05'!
test04CorrectlyFactorizesACompositeNumberWithTwoFactors2
	
	self assert: (Bag with: 2 with: 2) equals: 4 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:16:09'!
test08CorrectlyFactorizesACompositeNumberWithMoreThanTwoFactors2
	
	self assert: (Bag with: 2 with: 2 with: 2) equals: 8 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:20:50'!
test09CorrectlyFactorizesACompositeNumberWithMoreThanOneFactorsDifferentThan2
	
	self assert: (Bag with: 3 with: 3) equals: 9 factorize
	! !

!TDDBabyStepsPrimeFactorsTest methodsFor: 'tests' stamp: 'CG 9/29/2022 19:54:13'!
testExtraToCheckGeneralizationOnKata
	
	self assert: (Bag with: 2 with: 2 with: 3 with: 3 with: 5 with: 13) equals: (2*2*3*3*5*13) factorize
	! !
