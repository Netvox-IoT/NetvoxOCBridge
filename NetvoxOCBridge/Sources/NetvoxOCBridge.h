#import <Foundation/Foundation.h>
#import "NetvoxTar.h"

@interface NetvoxOCBridge : NSObject

/**
 十六进制字符串转换成 Data 数据。
 */
+(NSData*)convertHexStrToData:(NSString*)str;

/**
 tar 文件解压。
 */
+(BOOL)tarDecompress:(NSData*)data Path:(NSString*)path;

/**
 tar 文件压缩。
 */
+(BOOL)tarCompress:(NSString*)tarFromPath Topath:(NSString*)path;

/**
 gzip 文件解压。
 */
+(NSData*)gzipDecompress:(NSData*)data;

/**
 gzip 文件压缩。
 */
+(NSData*)gzipCompress:(NSData*)data;

/**
 十六进制异或解密。
 */
+(void)xorDecode:(NSData*)file andIntoPath:(NSString*)path;

@end
