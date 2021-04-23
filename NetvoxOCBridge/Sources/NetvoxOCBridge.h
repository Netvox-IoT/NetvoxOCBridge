#import <Foundation/Foundation.h>
#import "NetvoxTar.h"

@interface NetvoxOCBridge : NSObject

/**
 十六进制字符串转换成 NSData 数据。
 */
+(NSData*)convertHexStrToData:(NSString*)str;

/**
 NSData 变成不带 <> 和空格的字符串。
 */
+(NSString*)convertNSDataToNSString:(NSData*)data;

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

/**
 crc16 转换。
 */
+(int16_t)crc16With:(NSData*)data;

@end
