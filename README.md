# Pre-work - gratuitary

gratuitary is a tip calculator application for iOS.

Submitted by: Steve Mitchell

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [x] Ability to always round tip up to the nearest dollar.  Servers hate pennies too!
* [x] Ability to set the tip so the total is an even dollar amount.  I hate pennies even more!
* [x] Set your own tip levels for great/average/poor service.
* [x] Launch screen styling

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/theSteveMitchell/ios-tip-calculator/master/demo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The code to keep track of the tip levels and rounding settings is a little messy, especially the handling of defaults.  I'm hoping to clean that code up.  


