current=`pwd`
self_dir=`echo $0 | sed -e's/\/[^\/]*$//'`
if [ -d $self_dir ]
then
  echo cd $self_dir
  cd $self_dir
fi
version=`perl -ne'if(/VERSION/o&&/(\d)\.(\d)(\d)/o){print"$1.$2.$3";exit}' < ../NKF.mod/NKF.pm`
echo $version
echo generate nkf.1.pm
perl -ne'$m=/^=end|(=begin)( COMMAND)?/?($2?2:$1?1:0):(($m!=1&&print),$m);' ../NKF.mod/NKF.pm > nkf.1.pm
echo generate nkf.1
pod2man --section=1 --release="nkf $version" --center=" " --name=nkf nkf.1.pm ../nkf.1

#pod2man --section=1 --release="nkf 2.x.x" --center=" " --name=nkf nkf.1.pm|nroff -man|more

echo generate nkf.1j
pod2man --section=1 --release="nkf $version" --center=" " --name=nkf -u nkf.1j.pm | nkf -jW > ../nkf.1j
echo generate nkf.doc
pod2text nkf.1j.pm > ../nkf.doc

#pod2man --section=1 --release="nkf 2.x.x" --center=" " --name=nkf -u nkf.1j.pm|jgroff -mandoc -T nippon|more -r
echo cd $current
cd $current
