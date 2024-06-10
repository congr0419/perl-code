use strict;
use Bio::SeqIO;
use LWP::Simple;

# url 내용 파일로 저장
my $sUrl = "https://current.geneontology.org/ontology/go-basic.obo";

my $sLocalFile = funcFileNameFromPath($sUrl);		# 파일명 지정 (자체 함수)

my $oRespond = getstore($sUrl, $sLocalFile);		# 링크의 내용(sUrl)을 지정한 파일명(sLocalFile)에 넣어줍니다.

# 파일이름 지정 함수 생성
sub funcFileNameFromPath {
	my $sFilePath = shift;
	my $sRevPath = reverse($sFilePath);
	my $sFileName = "";

	if ($sRevPath=~/\//){
		$sFileName = $`;
		$sFileName = reverse($sFileName);
	} else {
		$sFileName = $sFilePath;
	}
	return $sFileName;
}

# 테이블 작성 및 저장
funcProcessing($sUrl);

sub funcProcessing {
    my $sOBOFile = shift;	# url의 내용 저장
    my $sSaveFile    = funcFileNameFromPath($sOBOFile)."_Table.txt";	# 새로운 파일명(table 생성)으로 저장

    open (hOut, ">$sSaveFile") or die;
    my $oOBO = Bio::SeqIO->new(-file => $sOBOFile, -format => 'OBO');	# obo format 변경 

    "GOIDs"        ."\t";    # 1
	"name"         ."\t";    # 2
	"namespace"    ."\t";    # 3
	"def"          ."\t";    # 4 
    "synonym"      ."\t";    # 5
    "is_a"         ."\t";    # 6
    "alt_id"       ."\t";    # 7 
    "xref"         ."\t";    # 8
    "relationship" ."\t";    # 9
    "is_obsolete"  ."\t";    # 10
	"consider"     ."\n";    # 11

	close(hOut);