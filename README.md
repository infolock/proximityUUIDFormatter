proximityUUIDFormatter
======================

Simple, light-weight formatter for dealing with Proximity UUID in a text field...

Video:
[![Video 1](http://img.youtube.com/vi/aFu2nWhVZwc/0.jpg)](https://www.youtube.com/watch?v=aFu2nWhVZwc)


### Usage
Usage is really easy.  The main things you need to do is just add a UITextField, set the delegate, and then use the proximityUUIDFormatter.  Check out the example included with this source to see an example.

One small gotcha: The `UITextField` attribute `Editing Changed` has been wired up to the `formatProximityUUIDInTextField` method.  You could obviously just do this manually as well - but I'm lazy and don't like writing code I don't have to.


This solution is inspired by [this excellent stackoverflow solution](http://stackoverflow.com/questions/12083605/formatting-a-uitextfield-for-credit-card-input-like-xxxx-xxxx-xxxx-xxxx/19161529#19161529).


