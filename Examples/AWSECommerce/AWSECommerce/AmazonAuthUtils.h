/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>

/** Utilities for signing requests */
@interface AmazonAuthUtils:NSObject {
}

+(NSString *)sha256HMac:(NSData *)data withKey:(NSString *)key;

@end

@interface NSData (WithBase64)

/**
 * Return a base64 encoded representation of the data.
 *
 * @return base64 encoded representation of the data.
 */
-(NSString *) base64EncodedString;

@end
