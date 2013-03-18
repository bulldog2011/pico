// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>

/**
 @file
 
         The size of images generated.
       
 
 @ingroup EBayAPIInterface
*/

/**
 
             Default value for requests. The size for the standard, 3-picture set for item pictures.
           
*/
extern NSString *const Trading_PictureSetCodeType_STANDARD;

/**
 
             Supersize, 4-picture set.
             If you specify this value on input, and this value is returned
             in the response, then in AddItem or a related call,
             you must specify Item.PictureDetails.PhotoDisplay.Supersize
             or Item.PictureDetails.PhotoDisplay.PicturePack.
           
*/
extern NSString *const Trading_PictureSetCodeType_SUPERSIZE;

/**
 
             When returned as output in the call response, the characters after setid may contain this value
             if a Supersize image cannot be generated.
             If this value is returned in the response, then in AddItem or a related call,
             you must specify Item.PictureDetails.PhotoDisplay.Supersize
             or Item.PictureDetails.PhotoDisplay.PicturePack.
           
*/
extern NSString *const Trading_PictureSetCodeType_LARGE;

/**
 
             (out) Reserved for internal or future use.
           
*/
extern NSString *const Trading_PictureSetCodeType_CUSTOM_CODE;
