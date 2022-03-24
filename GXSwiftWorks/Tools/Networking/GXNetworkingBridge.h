//
//  GXNetworkingBridge.h
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/24.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXNetworkingBridge : NSObject

- (AFHTTPSessionManager *)manager;

@end

NS_ASSUME_NONNULL_END
