// binding constants used by PICO framework

// PICO supported types

// integer
extern NSString *const PICO_TYPE_INT;

// boolean
extern NSString *const PICO_TYPE_BOOL;

// byte
extern NSString *const PICO_TYPE_BYTE;

// char
extern NSString *const PICO_TYPE_CHAR;

// short
extern NSString *const PICO_TYPE_SHORT;

// long
extern NSString *const PICO_TYPE_LONG;

// float
extern NSString *const PICO_TYPE_FLOAT;

// double
extern NSString *const PICO_TYPE_DOUBLE;

// enum
extern NSString *const PICO_TYPE_ENUM;

// date
extern NSString *const PICO_TYPE_DATE;

// duration
extern NSString *const PICO_TYPE_DURATION;

// object
extern NSString *const PICO_TYPE_OBJECT;

// string
extern NSString *const PICO_TYPE_STRING;

// qname
extern NSString *const PICO_TYPE_QNAME;

// data
extern NSString *const PICO_TYPE_DATA;

// any element
extern NSString *const PICO_TYPE_ANYELEMENT;

// PICO supported property kind

// map to xml attribute
extern NSString *const PICO_KIND_ATTRIBUTE;

// map to xml element
extern NSString *const PICO_KIND_ELEMENT;

// map to xml element array
extern NSString *const PICO_KIND_ELEMENT_ARRAY;

// map to xml value
extern NSString *const PICO_KIND_VALUE;

// map to xml any element
extern NSString *const PICO_KIND_ANY_ELEMENT;

// meta-data method name

// method name to get class meta-data
extern NSString *const PICO_GET_CLASS_META_DATA_METHOD;

// method name to get property meta-data
extern NSString *const PICO_GET_PROPERTY_META_DATA_METHOD;


// soap version
typedef enum {
    SOAP11 = 11,
    SOAP12 = 12,
} PicoSOAPVersion;

#define PicoErrorDomain @"com.leansoft.pico"

// pico custom error code
typedef enum {
    ReaderError = -1000,
    WriterError
    
} PicoErrorCode;



