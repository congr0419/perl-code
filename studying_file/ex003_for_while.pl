# Loop 반복문

use strict;

# for 함수: 조건문이 참이 아닐때까지 반복하는 함수
    # ex1_ 0~9까지 출력
print "--------------------------------------------\n";
for (my $i=0; $i<10;$i++) {     # ++$i: 지금부터 +1 적용 / $i++: 이후부터 +1 적용
	print $i."\t";              # for(변수 지정; 조건문; 코드 실행후 처리)
}
print "\n";


    # ex2_ 1~9까지 출력
for (my $i=1; $i<=9;$i++) {     # 세미콜론(;) 사용에 주의!!
	print $i."\t";
}
print "\n";

    # ex3_ 1~10까지 누적합계 출력
print "--------------------------------------------\n";
my $iSum = 0;
for (my $i=1; $i<=10;$i++) {
	$iSum = $iSum + $i;
	print $i."\t".$iSum."\n";
}



    # ex4_ 2~9까지 구구단 출력
print "--------------------------------------------\n";
for (my $i=2; $i<=9;$i++) {				# 스칼라, 조건, 실행문
	for (my $j=1; $j<=9;$j++) {
		print $i." X ".$j." = ".($i*$j)."\n";
	}
	print "------------\n";
}




# foreach 함수: hash 함수의 key 하나씩 출력			(1강 내용복습)
my @aMembers = ("EBKim", "JBPark", "HCNoh", "GDJin");       # array 생성

my %hScore_by_Student   = ();                               # hash 생성
$hScore_by_Student{"EBKim"}  = 50;
$hScore_by_Student{"HCNoh"}  = 70;
$hScore_by_Student{"JBPark"} = 40;
$hScore_by_Student{"GDJin"}  = 60;

# array의 value 하나씩 꺼내기
print "--------------------------------------------\n";
foreach my $sCurElement (@aMembers) {                       
	print $sCurElement."\t";
}
print "\n";

# hash의 key의 value 하나씩 꺼내기
print "--------------------------------------------\n";
foreach my $sCurKeys (keys %hScore_by_Student) {
	print $sCurKeys."\t".$hScore_by_Student{$sCurKeys}."\n";
}





# while 함수: 조건문이 참이 될때까지 반복하는 함수
my $iCond1 = 1;
my $iCond2 = 1;
print "--------------------------------------------\n";
while ($iCond1 == 1) { # 조건문이 참이 될때까지 반복
	print $iCond1."\t"."iCond1 is 1\n";
	$iCond1++;
}
print $iCond1."\t"."Stopped here!"."\n";

print "--------------------------------------------\n";


# until 함수: 조건문이 참이 아닐때까지 반복
until ($iCond2 == 4) {  
	print $iCond2."\t"."iCond2 is not 4\n";
	$iCond2++;
}
print $iCond2."\t"."Stopped here!"."\n";





# 반복문 제어
my $iNum  = 0;
print "--------------------------------------------\n";
while (1) {                 # 항상 1은 참, 0은 거짓의 값을 가진다. (무한반복 반복문) 1제외 나머지는 모두 거짓.
	$iNum++;

	if ($iNum >= 5001) {
		last;               # last: 끝내기 함수 (5001이 되면 끝난다.)
	}

	if ($iNum % 1000 == 0) { # %: 나머지 연산자; (1000단위로 출력)
		print "Current iNum = ".$iNum."\n";
	}
}                           # 결론: 1000, 2000, ..., 5000