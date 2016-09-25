//
//  DefaultsObserver.m
//  DefaultsObserver
//
//  Created by Michael Morris on 9/25/16.
//  Copyright © 2016 Michael Morris. All rights reserved.
//

#import "DefaultsObserver.h"

#import <os/log.h>

#import <objc/message.h>
#import <objc/runtime.h>

@implementation DefaultsObserver

+ (void)load
{
	[DefaultsObserver logToConsole:@"Observer loaded"];
}

+ (void)logToConsole:(NSString *)message
{
	static os_log_t logSubystem = NULL;

	static dispatch_once_t onceToken;

	dispatch_once(&onceToken, ^{
		logSubystem = os_log_create("com.example.DefaultsObserver", "Defaults");
	});

	os_log_info(logSubystem, "%{public}@", message);
}

void XRExchangeInstanceMethod(NSString *className, NSString *originalMethod, NSString *replacementMethod)
{
	NSCParameterAssert(className != nil);
	NSCParameterAssert(originalMethod != nil);
	NSCParameterAssert(replacementMethod != nil);

	Class class = NSClassFromString(className);

	SEL originalSelector = NSSelectorFromString(originalMethod);
	SEL swizzledSelector = NSSelectorFromString(replacementMethod);

	Method originalMethodDcl = class_getInstanceMethod(class, originalSelector);
	Method swizzledMethodDcl = class_getInstanceMethod(class, swizzledSelector);

	BOOL methodAdded =
	class_addMethod(class,
					originalSelector,
					method_getImplementation(swizzledMethodDcl),
					method_getTypeEncoding(swizzledMethodDcl));

	if (methodAdded) {
		class_replaceMethod(class,
							swizzledSelector,
							method_getImplementation(originalMethodDcl),
							method_getTypeEncoding(originalMethodDcl));
	} else {
		method_exchangeImplementations(originalMethodDcl, swizzledMethodDcl);
	}
}

@end
