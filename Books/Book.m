//
//  Book.m
//  Task1
//
//  Created by Rostislav Raykov on 11/5/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize author = _author, title = _title, isbn = _isbn, course = _course, price = _price;

- (id) initWithAuthor:(NSString *)author :(NSString *)title :(NSString *)isbn :(NSString *)course :(NSUInteger)price
{
    self = [super init];
    if ( ! self)
    {
        return nil;
    }
    
    [self setAuthor:author];
    [self setTitle:title];
    [self setIsbn:isbn];
    [self setCourse:course];
    [self setPrice:price];
    
    return self;
}

- (NSString *)description
{
    return [[NSString alloc] initWithFormat:@"%@, %@", _title, _author];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder  encodeObject:self.title  forKey:@"title"];
    [aCoder  encodeObject:self.author forKey:@"author"];
    [aCoder encodeInteger:self.price  forKey:@"price"];
    [aCoder  encodeObject:self.course forKey:@"course"];
    [aCoder  encodeObject:self.isbn   forKey:@"isbn"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if ( self)
    {
        _title  = [aDecoder decodeObjectForKey:@"title"];
        _author = [aDecoder decodeObjectForKey:@"author"];
        _price  = [aDecoder decodeIntegerForKey:@"price"];
        _course = [aDecoder decodeObjectForKey:@"course"];
        _isbn   = [aDecoder decodeObjectForKey:@"isbn"];
    }
    
    return self;
}

@end
