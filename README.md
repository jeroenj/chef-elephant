# Mr. Elephant workstation cookbook

This cookbook includes a list of apps used at [Mr. Elephant](http://mrelephant.be).

## Requirements

This cookbook has been built to work on Mac OSX and is only tested on Mountain Lion (10.8.x). Xcode (Development Tools) need to be installed upfront.

### gems
* plist

### cookbooks
- `homebrew`
- `mac_os_x`

Attributes
----------
#### elephant::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:elephant][:user]</tt></td>
    <td>String</td>
    <td>The user that owns installed packages</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>[:elephant][:hostname]</tt></td>
    <td>String</td>
    <td>The hostname for the machine you're setting up</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>[:elephant][:homebrew][:packages]</tt></td>
    <td>Array</td>
    <td></td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Author
Jeroen Jacobs

## License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
