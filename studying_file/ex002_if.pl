# IF 조건문
use strict;

# Creating an array and adding elements to the array
my @aStudent = ("EBKim", "HCNoh", "IHYoo", "GDJin");


# if 함수: (조건문) {조건이 참일 때 실행되는 코드}
print "-------------------------------------------1-\n";
if ($aStudent[3] eq "IHYoo") {          # 3번 변수가 아니므로 출력불가
	print "Index 3 ... IHYoo"."\t"."TRUE\n";
}


# else 함수: if 함수가 거짓일 때, 실행되는 코드
print "-------------------------------------------2-\n";
if ($aStudent[3] eq "IHYoo") {                  
	print "Index 3 ... IHYoo"."\t"."TRUE\n";    # x
} else {
	print "Index 3 ... IHYoo"."\t"."FALSE\n";   # o 
}


# elsif 함수: if 조건문이 거짓일 때, elsif 조건문 판별
print "-------------------------------------------3-\n";
if ($aStudent[3] eq "IHYoo") {
	print "Index 3 ... IHYoo"."\t"."TRUE\n";    
} elsif ($aStudent[3] eq "GDJin") {				
	print "Index 3 ... IHYoo"."\t"."FALSE\n";
	print "Index 3 ... GDJin"."\t"."TRUE\n";
} else {
	print "Index 3 ... ?????"."\t"."Who is Index 3?\n";
}





my $iCnt1 = 0;
my $iCnt2 = 1;

# and / or / 일치 / 불일치
print "-------------------------------------------4-\n";
if ($iCnt1 == 0 && $iCnt2 == 1) {       # 연산자: == 일치, != 불일치
	print "iCnt1 = 0 and iCnt2 = 1\n";  # and: 두 조건 모두 참일 시 TRUE / &&로 표기
} elsif ($iCnt1 == 0 || $iCnt2 == 2) {  
	print "iCnt1 = 0 or iCnt2 = 2\n";   # or: 둘 중 하나만 참이여도 좋아 / ||로 표기
}

# Combination of conditions: and(&&), or(||)
if ($iCnt1 == 0 || $iCnt2 == 2) {       # 1번은 0이 맞으므로 하나라도 맞기때문에 코드 출력.
	print "iCnt1 = 0 or iCnt2 = 2\n";
}

# unless 함수: 조건문이 거짓일 때 { } 코드 실행
print "-------------------------------------------5-\n";
unless ($iCnt1 == 0) {                  # 맞으니, 출력 불가
	print "iCnt is not 0\n";
}
unless ($iCnt1 == 1) {                  # 틀렸으니, 코드 출력
	print "iCnt is not 1\n";    
}