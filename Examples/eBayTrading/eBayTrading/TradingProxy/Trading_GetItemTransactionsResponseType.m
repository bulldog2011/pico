// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Trading_GetItemTransactionsResponseType.h"
#import "Trading_TransactionArrayType.h"
#import "Trading_ItemType.h"
#import "Trading_PaginationResultType.h"

@implementation Trading_GetItemTransactionsResponseType

@synthesize paginationResult = _paginationResult;
@synthesize hasMoreTransactions = _hasMoreTransactions;
@synthesize transactionsPerPage = _transactionsPerPage;
@synthesize pageNumber = _pageNumber;
@synthesize returnedTransactionCountActual = _returnedTransactionCountActual;
@synthesize item = _item;
@synthesize transactionArray = _transactionArray;
@synthesize payPalPreferred = _payPalPreferred;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetItemTransactionsResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PaginationResult" propertyName:@"paginationResult" type:PICO_TYPE_OBJECT clazz:[Trading_PaginationResultType class]];
    [map setObject:ps forKey:@"paginationResult"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"HasMoreTransactions" propertyName:@"hasMoreTransactions" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"hasMoreTransactions"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TransactionsPerPage" propertyName:@"transactionsPerPage" type:PICO_TYPE_INT clazz:nil];
    [map setObject:ps forKey:@"transactionsPerPage"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PageNumber" propertyName:@"pageNumber" type:PICO_TYPE_INT clazz:nil];
    [map setObject:ps forKey:@"pageNumber"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ReturnedTransactionCountActual" propertyName:@"returnedTransactionCountActual" type:PICO_TYPE_INT clazz:nil];
    [map setObject:ps forKey:@"returnedTransactionCountActual"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Item" propertyName:@"item" type:PICO_TYPE_OBJECT clazz:[Trading_ItemType class]];
    [map setObject:ps forKey:@"item"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TransactionArray" propertyName:@"transactionArray" type:PICO_TYPE_OBJECT clazz:[Trading_TransactionArrayType class]];
    [map setObject:ps forKey:@"transactionArray"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"PayPalPreferred" propertyName:@"payPalPreferred" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"payPalPreferred"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.paginationResult = nil;
    self.hasMoreTransactions = nil;
    self.transactionsPerPage = nil;
    self.pageNumber = nil;
    self.returnedTransactionCountActual = nil;
    self.item = nil;
    self.transactionArray = nil;
    self.payPalPreferred = nil;
    [super dealloc];
}

@end
