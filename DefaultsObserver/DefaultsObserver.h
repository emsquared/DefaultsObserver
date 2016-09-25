//
//  DefaultsObserver.h
//  DefaultsObserver
//
//  Created by Michael Morris on 9/25/16.
//  Copyright © 2016 Michael Morris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultsObserver : NSObject
+ (void)logToConsole:(NSString *)message;
@end

void XRExchangeInstanceMethod(NSString *className, NSString *originalMethod, NSString *replacementMethod);
