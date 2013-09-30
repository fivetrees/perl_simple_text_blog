#!/usr/bin/perl

#author: zhengsenlin
#date: 2013-06-06
#desc: search artict

use 5.018;
use strict;
use warnings;
use autodie;
use CGI ':standard';
use File::Grep qw( fgrep fmap fdo );

print header(-charset=>'utf8');
print start_html("Magic Search");
print "<a href=\"/cgi-bin/index.pl\">Home</a>";
print "<pre></pre>";
print "<a href=\"/cgi-bin/write.pl\">New Article</a>";
print "<pre></pre>";
&input_keyword();
&search();
print end_html;

sub input_keyword {
  print start_form;
  print textfield(-name => 'keyword',
    -size=>30);
  print submit('Action','Search');
  print end_form;
}

sub search {
  my $article_dir = "article_data";
  my $artword = param("keyword");
  chdir 'article_data' or die "cannot chdir to article_data: $!";
  my @article_file = <*>;
  my @seart;
  my %count;
  for (@article_file) {
    push @seart, $_ if /$artword/;
    push @seart, $_ if (fgrep { /$artword/ } "$_");
  }
  #去掉@seart数组中重复的元素，也就是碰到相同的就去掉
  my @retart = grep { ++$count{$_} < 2} @seart;
  for my $artitle (@retart) {
    print "<pre>";
    print "<a href=\"view.pl?title=$artitle\">$artitle</a>";
    print " ";
    print "<a href=\"modify.pl?modify_name=$artitle\">(MM</a>";
    print " ";
    print "<a href=\"delete.pl?delete_name=$artitle\">DD)</a>";
    print "</pre>";
  }
}

