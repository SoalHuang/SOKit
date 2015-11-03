//
//  SOHTTPPageRequestModel.m
//  SOKit
//
//  Created by soso on 15/6/16.
//  Copyright (c) 2015年 com.. All rights reserved.
//

#import "SOHTTPPageRequestModel.h"
#import "AFHTTPRequestOperation+SOHTTPRequestOperation.h"

@implementation SOHTTPPageRequestModel

- (void)dealloc {
    SOSUPERDEALLOC();
}

- (instancetype)init {
    return ([self initWithPageOffset:SO_DEFAULT_PAGEOFFSET]);
}

- (instancetype)initWithPageOffset:(NSUInteger)pageOffset {
    self = [super init];
    if(self) {
        _pageOffset = pageOffset;
        _pageIndex = 1;
    }
    return (self);
}

#pragma mark - <SOBaseModelCacheProtocol>
- (NSString *)cacheKey {
    return ([NSString stringWithFormat:@"%@-%@-%@-%@", self.baseURLString, self.parameters, @(self.pageIndex), @(self.pageOffset)]);
}
#pragma mark -

#pragma mark - <SOHTTPPageModelProtocol>
- (void)cancelAllRequest {
    [super cancelAllRequest];
}

- (AFHTTPRequestOperation *)startLoad {
    [self appendOtherParameters];
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:self.parameters];
    [mutableParameters setObject:[@(self.pageIndex) stringValue] forKey:_KEY_SOHTTP_PAGEINDEX];
    [mutableParameters setObject:[@(self.pageOffset) stringValue] forKey:_KEY_SOHTTP_PAGEOFFSET];
    __SOWEAK typeof(self) weak_self = self;
    AFHTTPRequestOperation *operation = [self.requestOperationManager POST:self.baseURLString parameters:mutableParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [weak_self request:operation didReceived:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weak_self request:operation didFailed:error];
    }];
    [operation setPageOffset:self.pageOffset];
    [operation setPageIndex:self.pageIndex];
    return (operation);
}

- (void)reloadData {
    self.pageIndex = 1;
    [self startLoad];
}

- (void)loadDataAtPageIndex:(NSUInteger)pageIndex {
    self.pageIndex = pageIndex;
    [self startLoad];
}

- (void)request:(AFHTTPRequestOperation *)request didReceived:(id)responseObject {
    NSUInteger pgIndex = (NSUInteger)[request pageIndex];
    if(pgIndex > 0) {
        self.pageIndex = (pgIndex + 1);
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(model:didReceivedData:userInfo:)]) {
        [self.delegate model:self didReceivedData:responseObject userInfo:nil];
    }
}
#pragma mark -

@end
