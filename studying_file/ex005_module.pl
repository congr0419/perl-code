# 모듈 사용

use strict;
use List::Util qw/ min max /;   # List::Util 모듈에서 min, max 사용하기
                # qw /a b/; = ("a", "b"); // 간결한 표현을 위해 사용 = qw (a b);
# Sorting
my @aWords = qw(mno abc def jkl pqr ghi aBc);       # 배열 생성
print "--------------------------------------------\n";
print "Sorted: Lexical Order......\n";
print join("-", sort(@aWords))."\n";                # (기본값) 사전순 정렬 
print join("-", sort {$a cmp $b} @aWords)."\n";     # 사용자 지정 정렬 (보통의 사전순 정렬 방식)
print "Sorted: Reversed Order......\n";
print join("-", sort {$b cmp $a} @aWords)."\n";     # 사전 역순으로 지정 정렬

my @aNumbers = qw(2 1 2 3 10);
print "--------------------------------------------\n";
print "Sorted: Lexical Order......\n";
print join("-", sort(@aNumbers))."\n";              # (기본값) 오름차순 정렬
print "Sorted: Ascending Order......\n";
print join("-", sort {$a <=> $b} @aNumbers)."\n";   # 숫자의 오름차순 정렬 
print "Sorted: Descending Order......\n";
print join("-", sort {$b <=> $a} @aNumbers)."\n";   # 숫자의 내림차순 정렬

# min, max 함수
print "--------------------------------------------\n";
print "Min: ".min(@aNumbers)."\n";                  # Minimum 최소값
print "Max: ".max(@aNumbers)."\n";                  # Maximum 최대값

# lc, uc 함수
print "--------------------------------------------\n";
print "Lower Case: "."DNA --> ".lc("DNA")."\n";     # 소문자화
print "Lower Case: ".lc(join("-", @aWords))."\n";   
print "Upper Case: "."dna --> ".uc("dna")."\n";     # 대문자화
print "Upper Case: ".uc(join("-", @aWords))."\n";   

# 문자열 길이 구하기
print "--------------------------------------------\n";
print "Length: ".length("abcde")."\n";              # 문자의 길이
print "No of elements: ".($#aWords + 1)."\n";       # 배열의 value 개수(0번부터 존재해서 +1)

# shift, pop, unshift, push 함수
print "--------------------------------------------\n";
print "Before:   ".join("-", @aWords)."\n";

my $sTemp1 = shift(@aWords);                        # 배열의 0번 value 추출
print "shift:    ".join("-", @aWords)."\n";         # 0번이 제외된 배열 
print "sTemp1:   ".$sTemp1."\n";                    # 추출한 value

my $sTemp2 = pop(@aWords);                          # 배열의 마지막 value 추출
print "pop:      ".join("-", @aWords)."\n";         # 마지막을 제외한 배열
print "sTemp2:   ".$sTemp2."\n";                    # 추출한 value

unshift(@aWords, "unshift");                        # 맨앞에 value 추가
print "unshift:  ".join("-", @aWords)."\n";         
push(@aWords, "push");                              # 맨뒤에 value 
print "push:     ".join("-", @aWords)."\n";          