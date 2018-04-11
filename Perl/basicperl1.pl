#!/usr/bin/perl
print "Hello World\n";

#Comments use hash

print         	"Whitespaces and tabs don't matter\n";

$a = 10;
print "Variables don't have specifiable datatypes, only Scalars Arrays Hashes\n";
print "a = $a\n";
$a = "10";

print "a = $a\n";
print "Escape characters \" \' \$ \\ \n";

@array = (1,2,3,4);
print "Full array : @array\n";
print "Elements one by one : $array[0] $array[1] $array[2] $array[3]\n";

%hash = ('a',1,'b',2);
print "Hash elements one by one : $hash{'a'} $hash{'b'}\n";

#Scalar operations
$str = "abc"."def";
print "Concatenated strings of abc, def : $str";

$add = 1 + 2;
$sub = 1 - 2;
$mul = 1 * 2;
$div = 1 / 2;
print "\nVarious operations : $add $sub $mul $div\n";

$multiline = "Abc
def
ghi";
print "Perl has multiline strings : $multiline \n";

print "File name ". __FILE__ . "\n";
print "Line Number " . __LINE__ ."\n";
print "Package " . __PACKAGE__ ."\n";

