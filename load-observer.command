#!/bin/sh

CURRENT_PATH=`dirname $0`

launchctl setenv __XPC_DYLD_FORCE_FLAT_NAMESPACE 1 
launchctl setenv __XPC_DYLD_INSERT_LIBRARIES "${CURRENT_PATH}/build/Release/libDefaultsObserver.dylib"

launchctl setenv DYLD_FORCE_FLAT_NAMESPACE 1  
launchctl setenv DYLD_INSERT_LIBRARIES "${CURRENT_PATH}/build/Release/libDefaultsObserver.dylib"

echo "Loaded observer"
echo "Restart a process to observe it"

log stream --predicate="subsystem contains 'com.example.DefaultsObserver'" --level info
