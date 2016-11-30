#!"C:\xampp\perl\bin\perl.exe"
use CGI qw(:standard);
print header;
$dna=param("dna");
$dna=~s/\n||\s//g;

print "<br><b>DNA sequence:</b><br>$dna\n\n";

($length=length$dna);
    print"<br>The length of DNA is $length<br>";
    $a=($dna=~tr/Aa//);
    $c=($dna=~tr/Cc//);
    $g=($dna=~tr/Gg//);
    $t=($dna=~tr/Tt//);
    $Total=$a+$t+$c+$g;
    print"<br>Total bases in DNA $Total:<br>";
print "<br>Individual bases:<br>A:$a<br>C:$c<br>G:$g<br>T:$t<br>";
$gc=(($g+$c)/$Total)*100;
print"<br>GC percentage: $gc<br>";
 $di=($dna=~tr/GCgc//);
    print"<br>The total number of dinucleotide GC in DNA : $di<br>";
$h=($dna=~tr/Aa//);
$b=($dna=~tr/Gg//);
  $hb=($h*2)+($b*3);
   
print "<br>Total Hydrogen bonds: $hb<br>";

$revcomp = reverse($dna);
print"<br>Reverse Strand: 3'->5' is $revcomp<br>";
$revcomp =~ tr/ACGTacgt/TGCAtgca/;
print"<br>Reverse compliment: $revcomp<br>";

print"<br><br><a href=\"C:/xampp/htdocs/index.html\">Open Home(in New tab)</a>";