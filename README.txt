Widon't for Movable Type
http://www.lowest-common-denominator.com/2006/08/widont_for_movable_type.php

Brook Elgie, 2006-2008 <hi@lowest-common-denominator.com>
Version 1.4

Widon't for Movable Type is based on Shaun Inman's Widon't for Wordpress
http://www.shauninman.com/plete/2006/08/widont-wordpress-plugin


====================================

License:

The MIT License 
http://www.opensource.org/licenses/mit-license.php

Copyright (c) 2008 Brook Elgie

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


====================================

Description:
Prevents widows in titles and headers, for entries and pages by inserting a non-breaking space between the two last words.

====================================

Installation:
Place Widont.pl in the plugins directory of your Movable Type installation.

* (mthome)/plugins/Widont.pl

====================================

Usage:
To use Widon't on your entry or page titles, add the global filter, widont="1". For example:

<mt:EntryTitle widont="1" />
<mt:PageTitle widont="1" />

This will process the title through Widon't to prevent widows.

Widon't can also be used in the Body, Excerpt and More tags for entries and pages to prevent widows in header tags:

<mt:EntryBody widont="1" />
<mt:EntryMore widont="1" />
<mt:EntryExcerpt widont="1" />

<mt:PageBody widont="1" />
<mt:PageMore widont="1" />
<mt:PageExcerpt widont="1" />

====================================

Updates:
1.0 	- Initial release
1.1 	- Fixed error when only one word is used for an entry title and corrected package name (Thanks Ruben! <http://www.wackomenace.co.uk/>)
1.2		- Added support for <h#> (and optionally <p>) within EntryBody, EntryMore and EntryExcerpt
1.3   - Fixed "Unquoted string" warnings
1.4		- Tidying up deprecated syntax (note: this version is no longer compatible with versions < MT4) (Thanks Tim! <http://appnel.com/>)
			- Adding support for Pages (Thanks Tim! <http://appnel.com/>)
			- Now released under the MIT license