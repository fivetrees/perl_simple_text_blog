#!/usr/bin/perl

#author: zhengsenlin
#date: 2013-05-30
#desc: write artict

use 5.010;
use strict;
use warnings;
use autodie;
use CGI ':standard';

print header(-charset=>'utf8');
print start_html("writing article");
&article_input();
&article_add();
print end_html;

sub article_input {
  print start_form;
  print textfield(-name => 'article_title',
    -value=>"Title",
    -size=>250);

  print "<br>";
  print textarea(-name=>'article_content',
    -rows=>45,
    -columns=>180);
  print submit('Action','submit');
  print " ";
  print "<a href=\"/cgi-bin/index.pl\">Home</a>";
  print end_form;
}


sub article_add {
  my $article_dir = "article_data";
  my $artitle = param("article_title");
  my $artcent = param("article_content");
  open ARTICLE_NAME, "> $article_dir/$artitle";
  say ARTICLE_NAME ($artcent);
  close ARTICLE_NAME;
}

