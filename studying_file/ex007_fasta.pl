# 외부 모듈

use strict;
use Bio::SeqIO;

# Making a file in the Fasta Format.
my $sFastaFile = "Fasta_Example.fasta";

open(hOut, ">".$sFastaFile) or die; # 파일 쓰기 모드  / 사용할 포맷 
print hOut ">Seq1 Example Sequence 1\n";		# 파스타 포맷에 맞춰서 코드 작성 / > > 사이에 서열 입력
print hOut "ACTGCATGAGTCGTAGTGTCGTACTATCGATGCAGTAGACTGATCGATCGTTACATTCAT\n";
print hOut "TCAGACTGTAGACAAAAAGGAGTTGGCAATCAAACCAGCTCCTTTTTACTATCCTTTGTG\n";
print hOut "TAAATTTGGAACAAAAAGC\n\n";
print hOut ">Seq2 Example Sequence 2\n";
print hOut "AACAAAGCGATTACACTGTTTAGTTTACTAACAGTCCTAATCGCTTTTTTTATTTCCCCT\n";
print hOut "ATTACTACATTCGCTGCTACAGTAAATTATGAAAAAGTAGCGAACTATATTTCCACATGG\n";
print hOut "CATGTTAAGTCATTAGGCGGTTTACACTGGACTGATGAAGGCATCCATATGATTAAAGCG\n\n";
print hOut ">Seq3 Example Sequence 3\n";
print hOut "ATGGAACACTTCTTACTGGTGGTTCTGGATTCACCCCATCTGAACTAACTATTGCAGA\n";
close(hOut);


my $oFasta  = Bio::SeqIO->new(-file => $sFastaFile, -format => 'fasta');
# file 선택, fasta의 포맷
my $iSeqCnt = 0;	# ->new() 파일 가져오기 함수 

print "--------------------------------------------\n";
print "Target File: ".$sFastaFile."\n";
print "--------------------------------------------\n";
	# 오브젝트에 저장하기
# 파일을 한줄씩 출력해, 전부 나올때까지 출력 (while: 참일때 실행)
while( my $oSeq = $oFasta->next_seq() ) { 		
	$iSeqCnt++;			# ->next_seq() 한sequence씩 출력하기

	my $sSeqId 	= $oSeq->display_id();		# ID 지정	ex) Seq1
	my $sDesc	= $oSeq->desc();			# Description 지정
	my $sSeq	= $oSeq->seq();				# Sequence 지정

	print "Sequenc Cnt     : ".$iSeqCnt."\n";
	print "Seq ID          : ".$sSeqId. "\n";
	print "Seq Description : ".$sDesc.  "\n";
	print "Seq             : ".$sSeq.   "\n";
	print "-----------------------------------\n";
}