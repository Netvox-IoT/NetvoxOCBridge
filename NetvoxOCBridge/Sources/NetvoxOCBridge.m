#import "NetvoxOCBridge.h"

@implementation NetvoxOCBridge

/**
 十六进制字符串转换成 Data 数据。
 */
+ (NSData*)convertHexStrToData:(NSString*)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    
    return hexData;
}

/**
 tar 文件解压。
 */
+(BOOL)tarDecompress:(NSData*)data Path:(NSString*)path
{
    return [NetvoxTar untarData:data toPath:path error:nil];
}

/**
 tar 文件压缩。
 */
+(BOOL)tarCompress:(NSString*)tarFromPath Topath:(NSString*)path
{
    return [NetvoxTar tarFileAtPath:tarFromPath toPath:path error:nil];
}

/**
 gzip 文件解压。
 */
+(NSData*)gzipDecompress:(NSData*)data
{
    return [NetvoxTar gzipDecompress:data];
}

/**
 gzip 文件压缩。
 */
+(NSData*)gzipCompress:(NSData*)data
{
    return [NetvoxTar gzipCompress:data];
}

/**
 十六进制异或解密。
 */
+(void)xorDecode:(NSData*)file andIntoPath:(NSString*)path
{
    Byte *code = (Byte*)[[@"NeTvOx" dataUsingEncoding:NSUTF8StringEncoding] bytes];
    //遍历byte
    [file enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        //异或加密
        for (NSInteger i = 0; i < byteRange.length; i++) {
            dataBytes[i] = dataBytes[i]^code[i%6];
        }
        NSData *dat = [NSData dataWithBytes:dataBytes length:byteRange.length];
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager createFileAtPath:path contents:dat attributes:nil];
        
    }];
}

@end
