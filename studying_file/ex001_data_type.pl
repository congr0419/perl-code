# 데이터 변수 종류 (Scalar, Array, Hash array)

use strict;

    # 1. Scalar: 하나의 value를 가지는 데이터 변수
    # 2. Array: 순서가 있는 두개 이상의 value를 가지는 데이터 변수
    # 3. Hash: key와 value를 쌍으로 하는 데이터 변수

# Scalar Variable (a number, a string, a reference, a logical value, etc)
my $iStudentCnt    = 0;        # my 함수: 변수 지정하기
my $sName          = "";       # 단일 변수 스칼라 : $ 표시로 구분  

# 변수 내용 바꾸기 1
$sName          = "EBKim";

# 출력하기 print 함수
print "--------------------------------------------\n";
print "Output: ".$iStudentCnt."\t".$sName."\n"; # 온점(.)으로 출력 내용 연결
                                                # \t: 탭, \n: 줄넘김


$sName          = "HCNoh";
$iStudentCnt = $iStudentCnt + 1; # 값은 1로 변경

# 포맷 활용하기 printf 함수 
print "--------------------------------------------\n";
printf("Output: %s\n", $sName);             # printf(포맷, 내용): 포맷 속 % 부분에 내용 삽입
print "no.1"."\n";    
printf("Output: %08d\n", $iStudentCnt);     # %08d: 빈자리는 0으로, 8자리로 표시, d(10진수로 표시)
printf("Output: %8.3f\n", $iStudentCnt);    # %8.3f: 소수 8자리를, 소수 .3번째까지 표시, f(부동 소수점 수)
print "no.2"."\n";    
printf("Output: %8.3f\n", $iStudentCnt++);  # = 2 (이후 값부터 +1)
printf("Output: %8.3f\n", $iStudentCnt);    # = 3
print "no.3"."\n";    
printf("Output: %8.3f\n", ++$iStudentCnt);  # = 3 (현재 값부터 +1)
printf("Output: %8.3f\n", $iStudentCnt);    # = 3




# Array Variables 배열 변수 생성
my @aMembers            = ();       # @ 표시를 통해 구분

# 배열 변수에 포함되는 값들을 조성
$aMembers[0]  = "EBKim";            # 데이터 순번은 0번부터 시작
$aMembers[2]  = "JBPark";           # 대괄호[]로 순번 표시 
$aMembers[1]  = "HCNoh";
$aMembers[3]  = "GDJin";

# array 출력하기
print "--------------------------------------------\n";
print @aMembers."\n";      # 1. 변수의 개수 출력
print @aMembers;           # 2. 변수 붙여서 출력 
print "\n";                
print join("\t", @aMembers)."\n";  # 3. join(): array의 변수 사이마다 tap 삽입하여 출력

# array 속 변수 바꾸기 (덮어씌우기) & 변수 추출하기 (shift)
$aMembers[3]  = "IHYoo";           # 4번째 변수 변경
my $sTemp = shift(@aMembers);      # shift(): 변수 추출 / array에는 더이상 존재 안함.
print join("\t", @aMembers)."\n";  # 5. 추출한후 나머지 array 출력
print $sTemp."\n";                 # 6. 추출한 변수 출력


# Hash Variables (해쉬 변수)
my %hScore_by_Student   = ();       # % 표시로 구분 

# hash 변수 속 key 지정 (array와 달리 변수의 순번은 없고, key 존재)
$hScore_by_Student{"EBKim"}  = 50;  # 중괄호{}를 통해 key 이름과 내용 지정
$hScore_by_Student{"HCNoh"}  = 70;
$hScore_by_Student{"JBPark"} = 40;
$hScore_by_Student{"GDJin"}  = 60;

# Printing hashes 해쉬 출력
print "--------------------------------------------\n";
print $hScore_by_Student{"EBKim"}."\t";      # 특정 키 지정하여 그에 맞는 변수값 출력
print $hScore_by_Student{"HCNoh"}."\t";      
print $hScore_by_Student{"JBPark"}."\t";      
print $hScore_by_Student{"GDJin"}."\n";       

# 특정 키 내용 변경
$hScore_by_Student{"JBPark"} = 70;
print $hScore_by_Student{"EBKim"}."\t";      
print $hScore_by_Student{"HCNoh"}."\t";      
print $hScore_by_Student{"JBPark"}."\t";     
print $hScore_by_Student{"GDJin"}."\n";      


# foreach 함수: 지정된 배열변수의 변수를 하나씩 추출
print "--------------------------------------------\n";
foreach my $sCurElement (@aMembers) {
	print $sCurElement."\t";
}
print "\n";

# hash ver. 지정된 hash 의 keys를 하나씩 추출 
print "--------------------------------------------\n";
foreach my $sCurKeys (keys %hScore_by_Student) {
	print $sCurKeys."\t".$hScore_by_Student{$sCurKeys}."\n";
}
    # (중요!): hash는 순서가 없기 때문에, 출력마다 출력되는 key의 순서가 다르다.