//
//  SimpleBookManager.h
//  Task1
//
//  Created by Rostislav Raykov on 11/6/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookManagerProtocol.h"

@interface SimpleBookManager : NSObject <BookManager>

+ (SimpleBookManager *)sharedBookManager;

@end
