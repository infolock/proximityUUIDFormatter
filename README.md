proximityUUIDFormatter
======================

Simple, light-weight convenience TextField formatter for dealing with Proximity UUID in a text field, to try and make it easier when having to type in that pain in the ass 32 char value....

### Key Features 

* Automatically inserts hyphens at the appropriate spot while typing in a ProximityUUID 
* Allows user to Cut/Copy/Paste at any position without it affecting the automatic insertion of said hyphens
* Restrics the ProximityUUID to be at the max 32 characters
* Dead simple to use and unobtrusive


Video:

[![Video 1](http://img.youtube.com/vi/aFu2nWhVZwc/0.jpg)](https://www.youtube.com/watch?v=aFu2nWhVZwc)


### Usage
Usage is really easy.  The main things you need to do is just add a UITextField, set the delegate, and then use the proximityUUIDFormatter.  Check out the example included with this source to see an example.

One small gotcha: The `UITextField` attribute `Editing Changed` has been wired up to the `formatProximityUUIDInTextField` method.  You could obviously just do this manually as well - but I'm lazy and don't like writing code I don't have to.

This solution is inspired by [this excellent stackoverflow solution by Mark Amery](http://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx/19161529#19161529).


### Available Public Methods

Here is a list of Available Public Methods available by the `proximityUUIDFormatter`...

##### Extras/Helpers Methods
* `+(NSString *)generateUUID` - Quick way to generate a random UUID
* `+(NSUUID *)proximityUUIDFromUUID:(id)UUID` -  Convenience method to allow us to work with either a UUID String or Object
* `+(BOOL)isValidProximityUUID:(NSString *)proximityUUID` - Is this a valid ProximityUUID?

##### Primary Usage Methods
* `+(void)storeValuesInTextField:(UITextField *)textField` - Ensures we keep a properly structured, 32-character value.
* `+(void)formatTextField:(UITextField *)textField` - Handles the actual heavy lifting of formatting/keeping track of cursor position, and all that other jazz...


### Todo - One day?

* Force allow only A-F alpha characters
* Perhaps even create a Keyboard Layout that is specifically designed to make entering these values easier by only showing A-F and 0-9 keys?  Hmm? Any takers?  meh...

### References/Resources

* [Mark Amery's Stackoverflow Solution for Credit Card Space Padding/Positioning](http://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx/19161529#19161529)
* [NSHipter's Matt Thompson's NSUUID/CFUUIDRef/UIDevice -uniqueIdentifier/-identifierForVendor Aricle](http://nshipster.com/uuid-udid-unique-identifier/)
  * sheesh - I bet he laughed at this title ;)
* [Youtube Video of this guy in action](https://www.youtube.com/watch?v=aFu2nWhVZwc)


### License Crap

> The MIT License (MIT)
> 
> Copyright (c) 2014 Jonathon Hibbard
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.

