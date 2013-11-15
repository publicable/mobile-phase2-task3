//
//  Book.h
//  Task1
//
//  Created by Rostislav Raykov on 11/5/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject <NSCoding>

@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* isbn;
@property (nonatomic, strong) NSString* course;
@property NSUInteger price;

- (id)initWithAuthor:(NSString *)author :(NSString *)title :(NSString *)isbn :(NSString *)course :(NSUInteger)price;

@end
