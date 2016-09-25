#!/bin/sh

launchctl setenv __XPC_DYLD_FORCE_FLAT_NAMESPACE 0  
launchctl setenv __XPC_DYLD_INSERT_LIBRARIES ""

launchctl setenv DYLD_FORCE_FLAT_NAMESPACE 0
launchctl setenv DYLD_INSERT_LIBRARIES ""

echo "Unloaded observer"
echo "Processes that are already being observed will continue to log until they are terminated."
