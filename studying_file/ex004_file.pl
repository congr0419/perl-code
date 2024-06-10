# file handling 파일 불러오기
use strict;


# @ARGV
# Run this file as follows;
# perl ex004.pl example004.txt
# Contents of example004.txt
# EBKim	50	30	70
# GDJin	55	40	60
# IHYoo	45	55	70


# 파일 열기
    # 터미널에 입력이 중요 -> perl ex004.pl example004.txt // 파일명에는 공백이 있으면 안됨!!
my $sFileToOpen = $ARGV[0];    
print "--------------------------------------------\n";
print "File to open: ".$sFileToOpen."\n";


# 파일 읽기모드 "<": 파일 읽기 모드라는 뜻. 아무것도 없으면 읽기모드로 간주.
open(hIn, $sFileToOpen) or die;     #hin: file handle (파일을 다루기 위한 도구) 
print "--------------------------------------------\n"; # open(도구, 열고자 하는 파일) or die; -> 오류시 중지
while (my $sLine = <hIn>) {         # 반복문 사용: 한줄씩 출력하기
	print $sLine;                   # 파일 속 계행 문자도 읽음 ex) \n, \t
}
print "\n";
close(hIn);                         # open, close는 항상 함께!! 열었으면 닫기!!

# 계행문자 제거
open(hIn, $sFileToOpen) or die;
print "--------------------------------------------\n";
while (my $sLine = <hIn>) {
	$sLine=~s/\n//g;
	$sLine=~s/\r//g;

	print $sLine."===";
	print $sLine."\n";
}
close(hIn);




# split vs join	/ 배열로 만들기 vs 하나의 스칼라로 만들기 / 쪼개기 vs 합치기

	#array -> 하나의 scalar 로 만들기
open(hIn, $sFileToOpen) or die;
my @aTemp = ();
my $iCnt  = 0;
print "--------------------------------------------\n";
print "Opening: ".$sFileToOpen."\n";
print "-----------------------------------\n";
while (my $sLine = <hIn>) {
	$iCnt++;			# 순서 제공
	print "Line: ".$iCnt."\n";

	$sLine=~s/\n//g;     
	$sLine=~s/\r//g;     

	print "Original: ".$sLine."\n";


    # split 함수: 여러개의 value를 묶어서 array로 만들어줌.
	my @aLine = split("\t", $sLine);
	@aTemp = @aLine;     # Save information in a temporary array
	print "Split:    ";
	foreach my $sCurElement (@aLine) {
		print $sCurElement."=";
	}
	print "\n";

    # join 함수: array를 풀어서 하나의 value로 만들어줌.
	my $sNewLine = join("-", @aLine);
	print "Join:     ".$sNewLine."\n";
	print "-----------------------------------\n";
}
close(hIn);

print join("\n", @aTemp)."\n";



# 파일 쓰기 모드    ">": 파일 쓰기 모드라는 뜻
my $sFileToSave = "example004_save.txt";        # 파일명 생성
print "--------------------------------------------\n";
print "Writing: ".$sFileToSave."\n";            
print "-----------------------------------\n";
open(hOut, ">".$sFileToSave) or die;            # open(파일 핸들, ">".넣을 파일) //
foreach my $sCurElement (@aTemp) {              # 없으면 생성, 있으면 덮어쓰기
	print "Screen: ".$sCurElement."\n";
	print hOut $sCurElement."\n";
}
close(hOut);

	# Q. 왜 마지막 줄만 저장되느냐?
	# A. foreach 함수로 인해 한줄씩 출력되어 마지막 줄만 남게 된 @aTemp 이기 때문이다.