BEGIN {
FS = "$"
printifnofile = "One for you, one for me."
}
printifnofile = ""
$0 { print "One for " $1 ", one for me." }
!$0 { print "One for you, one for me." }
END { print printifnofile }
