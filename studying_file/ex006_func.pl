# 함수 만들기

use strict;
use List::Util qw/ min max /;

my @aNumbers = (90, 80, 70, 60, 80, 90, 90);

#1. 합계, 평균, 표준편차 함수 만들기	(array 입력함수)
my $fSum = funcArraySum(@aNumbers);

print "--------------------------------------------\n";
print "No. of elements          : ".($#aNumbers + 1)."\n";			# 변수의 개수
print "--------------------------------------------\n";
print "Sum of elements          : ".$fSum."\n";            			# 결론값
print "Sum of elements          : ".funcArraySum(@aNumbers)."\n";  	# 실행값
print "--------------------------------------------\n";
print "Mean of elements         : ".funcMean(@aNumbers)."\n"; 		# 평균 구하는 함수
print "Pop.StDev of elements    : ".funcStDev(0, @aNumbers)."\n";   # 모집단 표준편차
print "Sample.StDev of elements : ".funcStDev(1, @aNumbers)."\n";   # 표본 표준편차
									# 첫배열을 통해 구하고자하는 표준편차 선택 0 or 1 


#2. 원하는 변수 출력하는 함수 만들기			(scalar 입력함수 -> array로 반환)
my $sSeq1 = "ATCGCGATAGTCGTACGATGATCGta";
my @aResult = funcGcContent($sSeq1);		

print "--------------------------------------------\n";
print "Seq1  : ".$sSeq1."\n";		# 원본
print "Seq2  : ".$aResult[0]."\n";	# 0번
print "G Cnt : ".$aResult[1]."\n";
print "C Cnt : ".$aResult[2]."\n";
print "Length: ".$aResult[3]."\n";
print "GC(%) : ".$aResult[4]."\n";



#3. 수학적 계산을 하는 함수		(hash 입력함수)
my %hScore_by_Name = ();
$hScore_by_Name{'EBKim'} = 90;							# 키와 변수 생성
$hScore_by_Name{'GDJin'} = 80;
$hScore_by_Name{'SJKim'} = 85;
my %hScore2_by_Name = funcIncrement(%hScore_by_Name);	# 계산후의 값

print "--------------------------------------------\n";
print "EBKim  : ".$hScore_by_Name{'EBKim'}." - ".$hScore2_by_Name{'EBKim'}."\n";
print "GDJin  : ".$hScore_by_Name{'GDJin'}." - ".$hScore2_by_Name{'GDJin'}."\n";
print "SJKim  : ".$hScore_by_Name{'SJKim'}." - ".$hScore2_by_Name{'SJKim'}."\n";



# 합계함수 정의
sub funcArraySum {
	my @aData = @_;     # 입력값 // @_는 입력한 배열을 뜻함.
	my $fSum = 0;

	foreach my $fCurVal (@aData) {
		$fSum += $fCurVal;		# 변수값을 하나씩 더하기 반복
	}

	return $fSum;       # 결과값 반환
}

# 평균함수 정의 
sub funcMean {
	my @aData = @_;    	# 입력값         
	my $fSum = 0;

	foreach my $fCurVal (@aData) {
		$fSum += $fCurVal;		# 입력값 합계
	}

	my $iCnt = $#aData + 1;		# 입력값의 변수 개수

	return $fSum/$iCnt;      	# 평균 = 합계 % 개수
}

# 표준편차함수 정의
sub funcStDev {
	my $iOption = shift;        # 표준 편차 종류를 구분하기 위해, 0번 변수 추출 (0 or 1)
	my @aData = @_;             # 나머지 변수 지정

	my $iCnt = $#aData + 1;		# 변수 개수
	my $fAvg = funcMean(@aData);# 평균

	my $fSumSqrDiff = 0;
	foreach my $fCurVal (@aData) {
		my $fSqrDiff = ($fCurVal - $fAvg) ** 2; 	# (값-평균값)^2
	    $fSumSqrDiff = $fSumSqrDiff + $fSqrDiff;	# 이 값 누적합계 
	}

	my $fStd = sqrt($fSumSqrDiff/($iCnt - $iOption)); # 모집단 or 표본 표준편차

	return $fStd;              # 결과값 반환
}

# 원하는 값 추출함수 정의
sub funcGcContent {
	my $sDnaSeq = uc($_[0]);           	# 입력 변수 대문자화 

	my $iGCnt = $sDnaSeq =~ tr/G/G/;    # G->G 바꾸기 (=개수 반환)
	my $iCCnt = $sDnaSeq =~ tr/C/C/;    # C->C 바꾸기 (=개수 반환)

	my $iGcContent = ($iGCnt+$iCCnt)*100 / length($sDnaSeq);	# G,C의 비율 계산
	$iGcContent = sprintf("%.2f", $iGcContent); 				# 소수 2자리까지 표현

	return ($sDnaSeq, $iGCnt, $iCCnt, length($sDnaSeq), $iGcContent); # array로 반환하기 때문에 여러값 반환
}
		#  1. 대문자화 2. G개수 3. C개수 4. 서열 길이 5. GC 함량

# 수학적 계산하는 함수 정의	/ 해쉬값을 대입한 경우
sub funcIncrement {
	my %hVal_by_Key = @_;               

	foreach my $sCurKey (keys %hVal_by_Key) {
		$hVal_by_Key{$sCurKey} = $hVal_by_Key{$sCurKey} * 1.05; # 변수값에 1.05 곱하기
	}
	return %hVal_by_Key;     # 결과값 반환
}