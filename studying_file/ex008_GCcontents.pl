# 원하는거 찾기
use strict;

my $sSeq = "ATGCGTACGTGCGTAGATCGCGCTGATTGG";

# 특정 서열 찾기 
print "--------------------------------------------\n";
if ($sSeq=~/ACG/) {								  # 특정서열이 존재하는가?
	print "Original Sequence :".$sSeq."\n";       # 원본 서열
	print "Before a match    :".$`."\n";          # `: 특정 서열 이전
	print "The match         :".$&."\n";          # &: 특정 서열 
	print "After a match     :".$'."\n";          # ': 특정 서열 이후
}


print "--------------------------------------------\n";
if ($sSeq=~/^ATG/) {                              # 시작이 이 서열로 되어 있는가?
	print "Original Sequence :".$sSeq."\n";       # 원본
	print "Before a match    :".$`."\n";          # 이거 전 = 시작이니 없다.
	print "The match         :".$&."\n";          # 일치하는거 
	print "After a match     :".$'."\n";          # 이거 후 = 3개 이후 싹다
}
print "---------------------------------\n";
if ($sSeq=~/TGG$/) {                              # 끝이 이 서열로 되어 있는가?
	print "Original Sequence :".$sSeq."\n";       # 원본
	print "Before a match    :".$`."\n";          # 이거 전 = 3개 이전 싹다
	print "The match         :".$&."\n";          # 일치하는거
	print "After a match     :".$'."\n";          # 이거 후 = 끝이니 없다.
}



# 문자열 속 특정부분 찾기 // 처음 나오는 부분을 출력
my $sTemp1 = "1ab2cd3ef4gh5ij6gh789gh1ab2cd444gh";
my $sTemp2 = "A rat showed me an apple.";
my $sX     = "cry";

# ex1.
print "--------------------------------------------\n";
if ($sTemp1=~/[1-9]gh/) {                         # 1~9 하나와 붙은 gh가 있나?
	print "String : ".$sTemp1."\n";			# 원본
	print "Concept: [1-9]gh\n";				# 조건문 출력
	print "Match  : ".$&."\n";				# 일치하는거 출력
}
print "---------------------------------\n";
if ($sTemp1=~/[1-9]{2,5}gh/) {                    # 1~9가 2~5개 붙은 gh가 있나?
	print "String : ".$sTemp1."\n";			# 원본
	print "Concept: [1-9]{2,5}gh\n";		# 조건문 출력
	print "Match  : ".$&."\n";				# 일치하는거 출력
}
print "---------------------------------\n";
if ($sTemp1=~/[1-9]+gh/) {                  	  # 1~9가 1개 이상이 붙은 gh가 있나?
	print "String : ".$sTemp1."\n";			# ?: 0 or 1:	0 또는 1
	print "Concept: [1-9]+gh\n";			# *: 0 or more:	0이상
	print "Match  : ".$&."\n";				# +: 1 or more:	1이상
}
print "---------------------------------\n";
if ($sTemp1=~/4[1-9]+gh/) {                       # 4로 시작하고, 1~9가 1개이상 붙은 gh?
	print "String : ".$sTemp1."\n";			
	print "Concept: 4[1-9]+gh\n";
	print "Match  : ".$&."\n";
}
print "---------------------------------\n";


# ex2.
if ($sTemp2=~/[$sX]at/) {                         # c,r,y 중 하나가 나오고, at로 끝난?
	print "String : ".$sTemp2."\n";
	print "Concept: \\s[n-t]at\n";				
	print "Match  : ".$&."\n";
}
print "---------------------------------\n";
if ($sTemp2=~/[\s1-9][n-t]at/) {                  # 공백 또는 1~9중 하나와, n~t사이 문자와,at로 끝난?
	print "String : ".$sTemp2."\n";			
	print "Concept: [\\s1-9][n-t]at\n";
	print "Match  : ".$&."\n";
}
print "---------------------------------\n";
if ($sTemp2=~/[brand][panda][python][play]/) {    # 각각에서 겹치는 한가지 글자가 이어진 4글자 있니?
	print "String: ".$sTemp2."\n";
	print "Concept: [brand][panda][python][play]\n";
	print "Match: ".$&."\n";
}



# 서열 뒤집기 (리버스)
print "--------------------------------------------\n";
print "Original: ".$sSeq."\n";
print "Reverse : ".reverse($sSeq)."\n";			# reverse 함수: 문자열 순서 뒤집기 
print "Rev.Comp: ".funcRevComp($sSeq)."\n";		# 함수 정의 (상보적 결합하는 서열 찾기)

sub funcRevComp {
	my $sSeq = reverse uc($_[0]);				# 뒤집고, 대문자화
	$sSeq =~ tr/ATGCN/TACGN/;                   # 상보적인 염기로 바꾸기 ~tr / 변경전 / 변경후 /; 
	return $sSeq;								# 순서에 맞게 변경됨.
}




my $sStr = "My name is EBKim. EBKim is my thesis advisor.";
print "--------------------------------------------\n";
print "Original             : ".$sStr."\n";
$sStr=~s/EBKim/JBPark/;                           # 처음나오는거만 대체
print "After 1 Substitution : ".$sStr."\n";
print "---------------------------------\n";
$sStr = "My name is EBKim. EBKim is my thesis advisor.";
print "Original             : ".$sStr."\n";
$sStr=~s/EBKim/JBPark/g;                          # 싹 다 대체
print "After 1 Substitution : ".$sStr."\n";

sub funcRevComp {
	my $sSeq = reverse uc($_[0]);				# (상보적 결합 서열 찾기) 함수 정의
	$sSeq =~ tr/ATGCN/TACGN/;                     
	return $sSeq;	
}



# GC 비율 함수
my @aResult = funcGcContent($sSeq);		
print "--------------------------------------------\n";
print "Seq    : ".$sSeq."\n";
print "G Cnt  : ".$aResult[0]."\n";
print "C Cnt  : ".$aResult[1]."\n";
print "Length : ".$aResult[2]."\n";
print "GC(%)  : ".$aResult[3]."\n";

sub funcGcContent {
	my $sDnaSeq = uc(shift);            

	my $iGCnt = $sDnaSeq =~ tr/G/G/;    # G -> G 바꾸기 / 바뀐 개수 카운트
	my $iCCnt = $sDnaSeq =~ tr/C/C/;    # C -> C 바꾸기 / 바뀐 개수 카운트

	my $iGcContent = ($iGCnt+$iCCnt)*100 / length($sDnaSeq); # GC 함유비율
	$iGcContent = sprintf("%.2f", $iGcContent);	# 소수 2째자리까지 표현

	return ($iGCnt, $iCCnt, length($sDnaSeq), $iGcContent);     # 결과값 반환
}