#!/usr/bin/perl

#author: zhengsenlin
#date: 2013-06-04
#desc: view artict

use 5.018;
use strict;
use warnings;
use autodie;
use CGI ':standard';

print "Content-type: text/plain\n\n";
my $article_name = param('title');
open ARTICLE_FILE, "< article_data/$article_name";
for my $line (<ARTICLE_FILE>) {
  print $line;
}
close(ARTICLE_FILE);
