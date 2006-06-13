echo nkf.1.pm
perl -ne'$m=/^=end|(=begin)( COMMAND)?/?($2?2:$1?1:0):(($m!=1&&print),$m);' ../NKF.mod/NKF.pm > nkf.1.pm
echo nkf.1
pod2man --section=1 --release="nkf 2.0.7" --center=" " --name=nkf nkf.1.pm ../nkf.1

#pod2man --section=1 --release="nkf 2.x.x" --center=" " --name=nkf nkf.1.pm|nroff -man|more

echo nkf.1j
pod2man --section=1 --release="nkf 2.0.7" --center=" " --name=nkf nkf.1j.pm | nkf -jE > ../nkf.1j
echo nkf.doc
pod2text nkf.1j.pm > ../nkf.doc

#pod2man --section=1 --release="nkf 2.x.x" --center=" " --name=nkf nkf.1j.pm|jgroff -mandoc -T nippon|more -r
