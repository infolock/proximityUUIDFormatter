proximityUUIDFormatter
======================

Simple, light-weight formatter for dealing with Proximity UUID in a text field..

The key feature is that it will automatically insert hyphens for you at the appropriate spot while typing in your ProximityUUID ( which can be a pain in the ass otherwise )


Video:

[![Video 1](http://img.youtube.com/vi/aFu2nWhVZwc/0.jpg)](https://www.youtube.com/watch?v=aFu2nWhVZwc)


### Usage
Usage is really easy.  The main things you need to do is just add a UITextField, set the delegate, and then use the proximityUUIDFormatter.  Check out the example included with this source to see an example.

One small gotcha: The `UITextField` attribute `Editing Changed` has been wired up to the `formatProximityUUIDInTextField` method.  You could obviously just do this manually as well - but I'm lazy and don't like writing code I don't have to.


This solution is inspired by [this excellent stackoverflow solution](http://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx/19161529#19161529).


### Available Public Methods

Here is a list of Available Public Methods available by the `proximityUUIDFormatter`...

*Helpers*
* `+(NSString *)generateUUID` - Quick way to generate a random UUID
* `+(NSUUID *)proximityUUIDFromUUID:(id)UUID` -  Convenience method to allow us to work with either a UUID String or Object
* `+(BOOL)isValidProximityUUID:(NSString *)proximityUUID` - Is this a valid ProximityUUID?

*Usage*
* `+(void)storeValuesInTextField:(UITextField *)textField` - Ensures we keep a properly structured, 32-character value.
* `+(void)formatTextField:(UITextField *)textField` - Handles the actual heavy lifting of formatting/keeping track of cursor position, and all that other jazz...
