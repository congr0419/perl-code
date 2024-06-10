use strict;

my %hData = ();

$hData{"sjLee"}{"like"}    =  1;
$hData{"sjLee"}{"hate"}    =  2;

$hData{"scHeo"}{"like"}    =  3;
$hData{"scHeo"}{"hate"}    =  4;
$hData{"scHeo"}{"soso"}    =  5;

# header line   # 칼럼 calumm line
print "Name";
foreach my $sCurTaste ("like", "hate", "soso") {
    print "\t".$sCurTaste;
}
print "\n";

# Content line # row line 
foreach my $sCurUser ("scHeo", "sjLee") {
    print $sCurUser;
    foreach my $sCurTaste ("like", "hate", "soso") {
        print "\t".$hData{$sCurUser}{$sCurTaste};
    }
    print "\n";
}
# 논리 이해 완.