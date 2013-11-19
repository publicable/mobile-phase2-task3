//
//  SimpleBookManager.m
//  Task1
//
//  Created by Rostislav Raykov on 11/6/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "SimpleBookManager.h"
#import "Book.h"

@interface SimpleBookManager ()
@property NSMutableArray* bookArray;
@property NSString *archivePath;
@end

@implementation SimpleBookManager

@synthesize bookArray;

static SimpleBookManager *singletonInstance;

+ (void)initialize
{
    static BOOL initialized = NO;
    if( ! initialized)
    {
        initialized = YES;
        singletonInstance = [[SimpleBookManager alloc] init];
    }
}

+ (SimpleBookManager *)sharedBookManager
{
    return singletonInstance;
}

- (id)init
{
    self = [super init];
    
    if ( ! self)
    {
        return nil;
    }
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _archivePath = [documentPath stringByAppendingPathComponent:@"books"];
    
    bookArray = [NSMutableArray array];
    [self loadBooks];

    return self;
}

- (Book *)createBookWithTitle:(NSString *)title author:(NSString *)author price:(NSUInteger)price course:(NSString *)course isbn:(NSString *)isbn
{
    Book *book = [[Book alloc]
            initWithAuthor:author
            :title
            :isbn
            :course
            :price
        ];
    
    NSLog(@"Book created: %@, %d", title, price);
    [bookArray addObject: book];
    [self saveChanges];
    
    return book;
}

- (void)editBook:(Book *)book title:(NSString *)title author:(NSString *)author price:(NSUInteger)price course:(NSString *)course isbn:(NSString *)isbn
{
    book.title = title;
    book.author = author;
    book.price = price;
    book.course = course;
    book.isbn = isbn;
    
    [self saveChanges];
}

- (void)removeBook:(Book *)b
{
    [bookArray removeObject:b];
    [self saveChanges];
    NSLog(@"%@ removed.", b);
}

- (Book *)bookAtIndex:(NSUInteger)index
{
    return [bookArray objectAtIndex:index];
}

- (NSUInteger)minPrice
{
    if ([self count] == 0)
    {
        return 0;
    }
    
    int i;
    NSUInteger minPrice = MAX_INPUT;
    for (i = 0; i < [self count]; i++)
    {
        NSUInteger price = [[bookArray objectAtIndex:i] price];
        if (price < minPrice)
        {
            minPrice = price;
        }
    }
    
    return minPrice;
}

- (NSUInteger)maxPrice
{
    int i;
    NSUInteger maxPrice = 0;
    for (i = 0; i < [self count]; i++)
    {
        NSUInteger price = [[bookArray objectAtIndex:i] price];
        if (price > maxPrice)
        {
            maxPrice = price;
        }
    }
    
    return maxPrice;
}

- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    [bookArray exchangeObjectAtIndex:from withObjectAtIndex:to];
    [self saveChanges];
}

- (NSArray *)allBooks
{
    return bookArray;
}

- (NSUInteger)totalCost
{
    int i;
    NSUInteger totalPrice = 0;
    for (i = 0; i < [bookArray count]; i++)
    {
        totalPrice += [[bookArray objectAtIndex:i] price];
    }
    
    return totalPrice;
}

- (CGFloat)meanPrice
{
    if ([self count])
    {
        CGFloat totalPrice = [[NSNumber numberWithInt:[self totalCost]] floatValue];
        CGFloat count = [[NSNumber numberWithInt:[self count]] floatValue];
        return totalPrice / count;
    } else {
        return 0.0;
    }
}

- (NSUInteger)count
{
    return [bookArray count];
}

- (void)saveChanges
{
    [NSKeyedArchiver archiveRootObject:bookArray toFile:_archivePath];
}

- (void)loadBooks
{
    bookArray = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:_archivePath]];
}

@end
