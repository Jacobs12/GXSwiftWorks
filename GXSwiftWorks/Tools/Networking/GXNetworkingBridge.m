//
//  GXNetworkingBridge.m
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/24.
//

#import "GXNetworkingBridge.h"

@implementation GXNetworkingBridge

- (AFHTTPSessionManager *)manager{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    return manager;
}

@end
