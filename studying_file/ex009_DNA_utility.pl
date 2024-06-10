# perl_09: DNA Utility 유전자 분석

use strict;

my $sSeq = "ATGCGTACGTGCGTAGATCGCGCTGATTGA";

# GC Content 												(8강 복습 내용)
my @aResult = funcGcContent($sSeq);		# 서열에 대한 정보를 얻는 함수를 만듭니다.
print "---------------------1-----------------------\n";
print "Seq    : ".$sSeq."\n";
print "G Cnt  : ".$aResult[0]."\n";     # G 개수
print "C Cnt  : ".$aResult[1]."\n";     # C 개수
print "Length : ".$aResult[2]."\n";     # 서열 길이
print "GC(%)  : ".$aResult[3]."\n";     # GC의 비율

sub funcGcContent {
	my $sDnaSeq = uc(shift);            # shift = 함수에 입력된 값 ($sSeq), uc = 대문자화

	my $iGCnt = $sDnaSeq =~ tr/G/G/;    # G를 G로 바꾸고, 개수 세기
	my $iCCnt = $sDnaSeq =~ tr/C/C/;    # C를 C로 바꾸고, 개수 세기

	my $iGcContent = ($iGCnt+$iCCnt)*100 / length($sDnaSeq);    # GC의 차지비율
	$iGcContent = sprintf("%.2f", $iGcContent);					# 소수 2자리 포맷 

	return ($iGCnt, $iCCnt, length($sDnaSeq), $iGcContent);     # 정의한 함수 리턴.
}





# Reverse Complement (상보적 결합하는 DNA seqeunce 찾기)		(8강 복습 내용)
print "-----------------------2---------------------\n";
print "Original: ".$sSeq."\n";
print "Reverse : ".reverse($sSeq)."\n";
print "Rev.Comp: ".funcRevComp($sSeq)."\n";

sub funcRevComp {
	my $sSeq = reverse uc($_[0]);				  # 순서를 뒤집고, 대문자화 
	$sSeq =~ tr/ATGCN/TACGN/;                     # A -> T, T ->A, G -> C, C -> G, N -> N
	return $sSeq;								  # 짝에 맞는 값으로 변경하기 
}

# --------------------------------------------
# Central dogma: Transcription 전사 (DNA->RNA) - Translation 번역 (RNA->Protein)
# --------------------------------------------


# Translation (DNA to Amino Acids - Protein Sequence): 번역 단계 //RNA -> 아미노산//
print "---------------------3-----------------------\n";
print "DNA Sequence: ".$sSeq."\n";
print "A.A Sequence: ".funcTranslate($sSeq)."\n";

# 번역 함수 정의하기
sub funcTranslate {
	my $sSeq = shift; 	# 0번 변수 추출
	my $sAa  = "";		# 빈 스칼라 생성

	for (my $i=0; $i<length($sSeq); $i = $i + 3) {      # $i = 0, 3, 6, 9, ... / for (변수, 조건, 변수 변형) = 조건이 틀릴때까지 반복
		my $sCurCodon = substr($sSeq, $i, 3);			# substr = 특정부분 추출 / $sSeq에서 $i(시작위치)부터 3개 추출
		$sAa = $sAa." ".funcCodonToAa($sCurCodon)." ";	# 코돈 (공백) 코돈 (공백) -> 반복
	}
	
	return $sAa;
}

# 코돈별 아미노산 이니셜로 변환
sub funcCodonToAa {
	my $sCodon = uc(shift);

	my %AminoAcid_by_Codon = (
		'TCA'=>'S',	'TCC'=>'S',	'TCG'=>'S',	'TCT'=>'S',
		'TTC'=>'F',	'TTT'=>'F',	'TTA'=>'L',	'TTG'=>'L',
		'TAC'=>'Y',	'TAT'=>'Y',	'TAA'=>'-',	'TAG'=>'-',
		'TGC'=>'C',	'TGT'=>'C',	'TGA'=>'-',	'TGG'=>'W',
		'CTA'=>'L',	'CTC'=>'L',	'CTG'=>'L',	'CTT'=>'L',
		'CCA'=>'P',	'CCC'=>'P',	'CCG'=>'P',	'CCT'=>'P',
		'CAC'=>'H',	'CAT'=>'H',	'CAA'=>'Q',	'CAG'=>'Q',
		'CGA'=>'R',	'CGC'=>'R',	'CGG'=>'R',	'CGT'=>'R',
		'ATA'=>'I',	'ATC'=>'I',	'ATT'=>'I',	'ATG'=>'M',
		'ACA'=>'T',	'ACC'=>'T',	'ACG'=>'T',	'ACT'=>'T',
		'AAC'=>'N',	'AAT'=>'N',	'AAA'=>'K',	'AAG'=>'K',
		'AGC'=>'S',	'AGT'=>'S',	'AGA'=>'R',	'AGG'=>'R',
		'GTA'=>'V',	'GTC'=>'V',	'GTG'=>'V',	'GTT'=>'V',
		'GCA'=>'A',	'GCC'=>'A',	'GCG'=>'A',	'GCT'=>'A',
		'GAC'=>'D',	'GAT'=>'D',	'GAA'=>'E',	'GAG'=>'E',
		'GGA'=>'G',	'GGC'=>'G',	'GGG'=>'G',	'GGT'=>'G'
		);

	if(exists $AminoAcid_by_Codon{$sCodon}) { 		# 코돈이 존재하면 값을 반환
		return $AminoAcid_by_Codon{$sCodon};
	} else	{
		return "X";									# 아니면 "X"를 반환
	}
}