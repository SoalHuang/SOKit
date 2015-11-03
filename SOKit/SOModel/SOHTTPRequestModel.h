//
//  SOHTTPRequestModel.h
//  SOKit
//
//  Created by soso on 15/6/16.
//  Copyright (c) 2015年 com.. All rights reserved.
//

#import "SOBaseModel.h"
#import "AFNetworking.h"

/**
 *  @brief  SOHTTPREquestModel及其子类需要遵循的协议
 */
@protocol SOHTTPModelProtocol <SOBaseModelProtocol>
@required

/**
 *  @brief  发起请求
 *
 *  @return 返回请求实例AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)startLoad;

/**
 *  @brief  接收请求成功的方法
 *
 *  @return 无返回值
 */
- (void)request:(AFHTTPRequestOperation *)request didReceived:(id)responseObject;

/**
 *  @brief  接收请求失败的方法
 *
 *  @return 无返回值
 */
- (void)request:(AFHTTPRequestOperation *)request didFailed:(NSError *)error;
@end


/**
 *  @brief  网络请求基类，定义了一些网络请求的基本属性、参数和协议
 */
@interface SOHTTPRequestModel : SOBaseModel<SOHTTPModelProtocol>

/**
 *  @brief  发起请求的网络地址
 */
@property (copy, nonatomic) NSString *baseURLString;

/**
 *  @brief  发起请求的参数键值对
 */
@property (copy, nonatomic) NSMutableDictionary *parameters;

/**
 *  @brief  发起请求的并发管理对象
 */
@property (strong, nonatomic, readonly) AFHTTPRequestOperationManager *requestOperationManager;

/**
 *  @brief  发起请求之前增加额外附加字段
 *
 *  @return 无返回值
 */
- (void)appendOtherParameters;

@end

