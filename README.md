# DefaultsObserver
This is a very simple dynamic library which uses DYLD_INSERT_LIBRARIES to inject itself into all proccesses to view which keys they access through NSUserDefaults. 

CFPreferences\* functions are not observed because I didn't care about those.

DYLD_INSERT_LIBRARIES requires System Integrity Protection to be disabled.

Output is logged using the os_log() function which means this library only works on macOS Sierra.

I don't plan on providing any support for this library. Uploading it to GitHub so I don't lose it.
