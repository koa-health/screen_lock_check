# screen_lock_check

This plugin allows you to check whether the user has some form of screen lock set on their device: a passcode, a pattern, touch ID or face ID.

## How it works

There is an example app that demonstrates how the plugin can be used. 

You just need to instatiate LockScreenCheck and call the method isScreenLockEnabled. Providing the plugin can access the platform, this will return true or false.

