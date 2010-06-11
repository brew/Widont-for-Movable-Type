# ---------------------------------------------------------------------------
# Widon't for Movable Type
# Eliminates widows in your post titles by inserting a non-breaking space between the last two words of a title. 
# What is a widow? In typesetting, a widow is a single word on a line by itself at the end of a paragraph and is considered bad style.
#
# Release 1.4
# May 2008
#
# Author: Brook Elgie <hi@lowest-common-denominator.com>
# http://www.lowest-common-denominator.com/2006/08/widont_for_movable_type.php
# 
# Widon't for Movable Type is based on Shaun Inman's Widon't for Wordpress
# http://www.shauninman.com/plete/2006/08/widont-wordpress-plugin
#
# ---------------------------------------------------------------------------
# The MIT License 
# http://www.opensource.org/licenses/mit-license.php
# 
# Copyright (c) 2008 Brook Elgie
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ---------------------------------------------------------------------------

package MT::Plugin::Widont;

use strict;
use base qw( MT::Plugin );
use MT::Util qw( rtrim );
use vars qw($VERSION);
our $VERSION = '1.4';

# ---------------------------------------------------------------------------
my $tags_to_widont = "h[1-9]";
#my $tags_to_widont = "p|h[1-9]";
# ---------------------------------------------------------------------------

my $plugin = MT::Plugin::Widont->new({
  name => 'Widon\'t',
   description => "<MT_TRANS phrase=\"Eliminates widows in your post titles and entries and by inserting a non-breaking space between the last two words.\">",
   doc_link => 'http://www.lowest-common-denominator.com/2006/08/widont_for_movable_type.php',
   author_name => 'Brook Elgie',
   author_link => 'http://www.lowest-common-denominator.com/',
   version => $VERSION,
});
MT->add_plugin($plugin);
sub init_registry {
    my $plugin = shift;
    $plugin->registry({
        tags => {
            modifier => {
                'widont' => \&widont,
            },
        },
    });
}

sub widont{
	my ($str, $param, $ctx) = @_;
	if ($param eq '1') {
		$str = rtrim($str);
		my $value = $ctx->stash('tag');
		if (   $value =~ m{(Entry|Page)(Body|Excerpt|More)}i) {
			$str =~ s%[ *\t](?=(\S+\s*)(<(/\b[^>]*|\b[^>]*/)>*\s*)?</($tags_to_widont)>)(?![^<>]*>)%&nbsp;%mg;
		} elsif ($value =~ m{(Entry|Page)Title}i) {
			my $space = rindex($str, ' ');
			if($space != -1){
				$str = substr($str, 0, $space).'&nbsp;'.substr($str, $space + 1);
			}	
		}
	}
	$str;
}