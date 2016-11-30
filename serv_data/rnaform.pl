#!"C:\xampp\perl\bin\perl.exe"
use CGI qw(:standard);
print header;
$rna=param("rna");
print "<br><b>RNA sequence:</b><br>$rna\n\n";

($length=length$rna);
    print"<br>The length of RNA is $length<br>";
    $a=($rna=~tr/Aa//);
    $c=($rna=~tr/Cc//);
    $g=($rna=~tr/Gg//);
    $u=($rna=~tr/Uu//);
    $Total=$a+$u+$c+$g;
    print"<br>Total bases in RNA $Total:<br>";
print "<br>Individual bases:<br>A:$a<br>C:$c<br>G:$g<br>U:$u<br>";
$gc=(($g+$c)/$Total)*100;
print"<br>GC percentage in RNA: $gc<br>";
 $di=($rna=~tr/GCgc//);
    print"<br>The total number of dinucleotide -GC- in RNA : $di<br>";
$h=($rna=~tr/Aa//);
$b=($rna=~tr/Gg//);
  $hb=($h*2)+($b*3);
   
print "<br>Total Hydrogen bonds in RNA: $hb<br>";




for(my $i=0;$i<(length($rna)-2);$i+=3)
{
$codon=substr($rna,$i,3);
$protein.=&codon2aa($codon);
}
print"<br><b>Protein sequence: <br>$protein<b>";

print"<br><br><a href=\"C:/xampp/htdocs/index.html\">Open Home(in New tab)</a>";

sub codon2aa{
my($codon)=@_;
$codon=uc $codon;
my(%g)=('UCA'=>'S','UCC'=>'S','UCG'=>'S','UCU'=>'S','UUC'=>'F','UUU'=>'F','UUA'=>'L','UUG'=>'L','UAC'=>'Y','UAU'=>'Y','UAA'=>'_','UAG'=>'_','UGC'=>'C','UGU'=>'C','UGA'=>'_','UGG'=>'W','CUA'=>'L','CUC'=>'L','CUG'=>'L','CUU'=>'L','CCA'=>'P','CCC'=>'P','CCG'=>'P','CCU'=>'P','CAC'=>'H','CAU'=>'H','CAA'=>'Q','CAG'=>'Q','CGA'=>'R','CGC'=>'R','CGG'=>'R','CGU'=>'R','AUA'=>'I','AUC'=>'I','AUU'=>'I','AUG'=>'M','ACA'=>'T','ACC'=>'T','ACG'=>'T','ACU'=>'T','AAC'=>'N','AAU'=>'N','AAA'=>'K','AAG'=>'K','AGC'=>'S','AGU'=>'S','AGA'=>'R','AGG'=>'R','GUA'=>'V','GUC'=>'V','GUG'=>'V','GUU'=>'V','GCA'=>'A','GCC'=>'A','GCG'=>'A','GCU'=>'A','GAC'=>'D','GAU'=>'D','GAA'=>'E','GAG'=>'E','GGA'=>'G','GGC'=>'G','GGG'=>'G','GGU'=>'G');
if(exists $g{$codon})
{
return $g{$codon};
}
else
{
print STDERR "Bad codon \"$codon\"!!\n";
exit;
}
}
     