#!/usr/bin/perl

#author: zhengsenlin
#date: 2013-06-04
#desc: modify artict

use 5.010;
use strict;
use warnings;
use autodie;
use CGI ':standard';

print header(-charset=>'utf8');
print start_html("writing article");
my $modify_name = param('modify_name');
&article_input($modify_name);
&article_add();
print end_html;

sub article_input {
  my $modify_title = shift;
  my $article_dir = "article_data";
  
  open MODIFY_FILE, "< $article_dir/$modify_title";
  my @modify_content = <MODIFY_FILE>;
  close MODIFY_FILE;

  print start_form;
  print textfield(-name => 'article_title',
    -value=>"$modify_title",
    -size=>250);

  print "<br>";
  print textarea(-name=>'article_content',
    -default=>"@modify_content",
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

