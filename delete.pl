#!/usr/bin/perl

#author: zhengsenlin
#date: 2013-06-08
#desc: delete artict

use 5.018;
use strict;
use warnings;
use autodie;
use CGI ':standard';

print header(-charset=>'utf8');
print start_html("Delete ?");
my $article_name = param('delete_name');
rename "article_data/$article_name", "Trash/$article_name";
print "<a href=\"/cgi-bin/index.pl\">Back to Home</a>";
print "<pre></pre>";
print "<a href=\"/cgi-bin/write.pl\">New Article</a>";
print end_html;
