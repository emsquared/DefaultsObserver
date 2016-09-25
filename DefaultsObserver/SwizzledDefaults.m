//
//  SwizzledDefaults.m
//  DefaultsObserver
//
//  Created by Michael Morris on 9/25/16.
//  Copyright © 2016 Michael Morris. All rights reserved.
//

#import "SwizzledDefaults.h"

#import "DefaultsObserver.h"

@implementation NSUserDefaults (SwizzledDefaults)

+ (void)load
{
	XRExchangeInstanceMethod(@"NSUserDefaults", @"objectForKey:", @"__s_objectForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"stringForKey:", @"__s_stringForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"arrayForKey:", @"__s_arrayForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"dictionaryForKey:", @"__s_dictionaryForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"dataForKey:", @"__s_dataForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"stringArrayForKey:", @"__s_stringArrayForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"integerForKey:", @"__s_integerForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"floatForKey:", @"__s_floatForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"doubleForKey:", @"__s_doubleForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"boolForKey:", @"__s_boolForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"URLForKey:", @"__s_URLForKey:");
	XRExchangeInstanceMethod(@"NSUserDefaults", @"registerDefaults:", @"__s_registerDefaults:");
}

NS_INLINE void __s_logValueAccessed(NSString *key, id value, NSString *type)
{
	[DefaultsObserver logToConsole:
	 [NSString stringWithFormat:@"Value accessed [%@]: %@", type, key]];
}

NS_INLINE void __s_logDefaultsRegistered(NSDictionary<NSString *, id> *defaults)
{
	[defaults enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
		[DefaultsObserver logToConsole:
		 [NSString stringWithFormat:@"Registered default: %@", key]];
	}];
}

- (id)__s_objectForKey:(NSString *)defaultName
{
	id value = [self __s_objectForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"Any Object");

	return value;
}

- (NSString *)__s_stringForKey:(NSString *)defaultName
{
	NSString *value = [self __s_stringForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"String");

	return value;
}

- (NSArray *)__s_arrayForKey:(NSString *)defaultName
{
	NSArray *value = [self __s_arrayForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"Array");

	return value;
}

- (NSDictionary<NSString *, id> *)__s_dictionaryForKey:(NSString *)defaultName
{
	NSDictionary *value = [self __s_dictionaryForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"Dictionary");

	return value;
}

- (NSData *)__s_dataForKey:(NSString *)defaultName
{
	NSData *value = [self __s_dataForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"Data");

	return value;
}

- (NSArray<NSString *> *)__s_stringArrayForKey:(NSString *)defaultName
{
	NSArray *value = [self __s_stringArrayForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"Array of Strings");

	return value;
}

- (NSInteger)__s_integerForKey:(NSString *)defaultName
{
	NSInteger value = [self __s_integerForKey:defaultName];

	__s_logValueAccessed(defaultName, @(value), @"Integer");

	return value;
}

- (float)__s_floatForKey:(NSString *)defaultName
{
	float value = [self __s_floatForKey:defaultName];

	__s_logValueAccessed(defaultName, @(value), @"Float");

	return value;
}

- (double)__s_doubleForKey:(NSString *)defaultName
{
	double value = [self __s_doubleForKey:defaultName];

	__s_logValueAccessed(defaultName, @(value), @"Double");

	return value;
}

- (BOOL)__s_boolForKey:(NSString *)defaultName
{
	BOOL value = [self __s_boolForKey:defaultName];

	__s_logValueAccessed(defaultName, @(value), @"BOOL");

	return value;
}

- (NSURL *)__s_URLForKey:(NSString *)defaultName
{
	NSURL *value = [self __s_URLForKey:defaultName];

	__s_logValueAccessed(defaultName, value, @"URL");

	return value;
}

- (void)__s_registerDefaults:(NSDictionary<NSString *, id> *)registrationDictionary
{
	[self __s_registerDefaults:registrationDictionary];

	__s_logDefaultsRegistered(registrationDictionary);
}

@end
