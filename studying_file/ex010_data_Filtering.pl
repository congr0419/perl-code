# Data filtering (Array, hash) 데이터 필터링

use strict;

# Filtering an array (배열에서 필터링하기: 짝수, 홀수 구분하기 예시)
my @aNumbers = (2,3,4,2,6,4,6,7,6,8,8,0,8,7,6,7,8,9,8,7,6,6,7,8,9);

my $iCntEvenNumber   = 0;       # 짝수 개수
my $iDataCnt         = 0;       # 숫자순서 (0부터 1씩 추가)

print "-------------------------------------------1-\n";
foreach my $iCurVal (@aNumbers) {
	$iDataCnt++;
	my $sDataCnt = sprintf("%02d", $iDataCnt);  # 2자리 숫자 포맷 / 빈공간은 0으로 메움
	if ($iCurVal % 2 == 0) {                    # 나머지가 0이야? / 짝수이면 코드 실행
		$iCntEvenNumber++;                      # 짝수 개수
		print $sDataCnt.": ".$iCurVal." - Even Number (".$iCntEvenNumber.")\n"; # 짝수로 출력
	} else {
		print $sDataCnt.": ".$iCurVal." - Odd Number\n";                        # 홀수로 출력
	}
}

$iCntEvenNumber = 0;			# 짝수 개수
$iDataCnt = 0;					# 숫자순서 1.2.3.4...
print "-------------------------------------------2-\n";
for (my $i=0; $i<10;$i++) {                     # $i가 0~9까지 반복 (=10번 반복 / 배열속 10번째 숫자까지 판독)
	$iDataCnt++;			
	my $iCurVal = $aNumbers[$i];                # array에서 $i번째 변수를 출력 (0~9번 변수) / 변수 새로 덮어쓰기
	my $sDataCnt = sprintf("%02d", $iDataCnt);  # 2자리 숫자로 표시 (숫자순서 표시)
	if ($iCurVal % 2 == 0) {
		$iCntEvenNumber++;
		print $sDataCnt.": ".$iCurVal." - Even Number (".$iCntEvenNumber.")\n"; # 짝수로 출력
	} else {
		print $sDataCnt.": ".$iCurVal." - Odd Number\n";                        # 홀수로 출력
	}
}



# Unique Array Elements	(hash를 통해 특정 변수 추출)
my %hNum_by_Num = ();	#해쉬 생성
foreach my $iCurVal (@aNumbers) { 		# 숫자를 하나씩 꺼내기
	$hNum_by_Num{$iCurVal}=$iCurVal;	# key와 변수가 동일한 hash 생성 / 키 {키이름} = 변수
}
my @aNum = keys %hNum_by_Num;           # key값으로 완성!
@aNum = sort {$a <=> $b} @aNum;         # 오름차순으로 정렬하기
print "-------------------------------------------3-\n";
print "Direct Processing..........\n";
foreach my $iCurVal (@aNum) {
	print $iCurVal."\n";
}
my $iUniqueNumCnt = ($#aNum + 1);					# 배열의 개수
print "No of Unique Numbers: ".$iUniqueNumCnt."\n";
print "--------------------------------4-\n";

# 함수 생성을 통해 hash로 정렬하기
print "Processing by a Function.........\n";
foreach my $iCurVal (funcUniqueArray(@aNumbers)) {	
	print $iCurVal."\n";
}

sub funcUniqueArray {								
	my @aNumbers = @_;									# 전달인자 할당
	my %hNum_by_Num = ();								# hash 생성
	foreach my $iCurVal (@aNumbers) {					# 배열 속 변수 하나씩 출력
		$hNum_by_Num{$iCurVal}=$iCurVal;				# 출력된 변수 -> hash에 입력
	}
	my @aNum = keys %hNum_by_Num;                       # key값으로 완성!
	@aNum = sort {$a <=> $b} @aNum;                     # 오름차순으로 정렬하기 / 정렬을 안하면 중구난방!!

	return @aNum;
}


# Filtering a hash # hash 데이터에 필터링하기
my %hSeq_by_Name = ();		# 빈 해쉬 만들기
$hSeq_by_Name{'EBKim'}  = "GCAAATGCTGACTGATGCTAGCTTATACTAGTAGTATCGAT"; 	# 해쉬에 들어갈 key값에 맞는 변수값 넣기
$hSeq_by_Name{'JBPark'} = "GCAGATGCTGACTGATGCTAGCTTATCCTAGTAGTATCGAT";
$hSeq_by_Name{'SJKim'}  = "GCACATGCTGACTGATGCTAGCTTATACTAGTAGTATCGAT";
$hSeq_by_Name{'IHYoo'}  = "GCAGATGCTGACTGATGCTAGCTTATCCTAGTAGTATCGAT";
$hSeq_by_Name{'SJChoi'} = "GCAAATGCTGACTGATGCTAGCTTATCCTAGTAGTATCGAT";
$hSeq_by_Name{'ISKim'}  = "GCAGATGCTGACTGATGCTAGCTTATACTAGTAGTATCGAT";
$hSeq_by_Name{'HSKim'}  = "GCACATGCTGACTGATGCTAGCTTATCCTAGTAGTATCGAT";
$hSeq_by_Name{'YHChoi'} = "GCAGATGCTGACTGATGCTAGCTTATCCTAGTAGTATCGAT";
$hSeq_by_Name{'STLee'}  = "GCAAATGCTGACTGATGCTAGCTTATACTAGTAGTATCGAT";	

my @aNames = keys(%hSeq_by_Name);					 # key 넣어서 해쉬 완성! 
print "-------------------------------------------5-\n";
foreach my $sCurKey (@aNames) {                      # key값 추출하기
	my $sCurVal = $hSeq_by_Name{$sCurKey};			 # key에 대한 변수값 하나씩 추출

	if ($sCurVal=~/CTAGCTTATCCTAGTAGTA/) {           # 요구값과 변수가 일치하면 코드 실행
		print $sCurKey."\t".$sCurVal."\n";
	}
}
print "--------------------------------6-\n";
foreach my $sCurKey (sort(@aNames)) {                # key값 사전순 배열 
	if ($sCurKey=~/Kim/) {                           # key값에 kim이 포함된다면 코드 실행
		my $sCurVal = $hSeq_by_Name{$sCurKey};		 # 그 key의 value를 추출
		print $sCurKey."\t".$sCurVal."\n";			 # 출력
	}
}