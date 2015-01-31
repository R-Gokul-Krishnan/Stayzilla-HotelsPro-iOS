//
//  UIUtil.h
//  UIUtil
//
//  Created by vijayaragavan on 06/05/13.
//  Copyright (c) 2013 photon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <STAUtil/UIImage+FromView.h>
#import <STAUtil/UIView+Image.h>
#import <STAUtil/HPlistLoader.h>
#import <STAUtil/WSEnum.h>

// see http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
#define SuppressPerformSelectorLeakWarning(Stuff)                           \
do                                                                      \
{                                                                       \
_Pragma("clang diagnostic push")                                    \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff;                                                              \
_Pragma("clang diagnostic pop")                                     \
}                                                                       \
while (0)


#define objc_dynamic_cast(TYPE, object) \
({ \
TYPE *dyn_cast_object = (TYPE*)(object); \
[dyn_cast_object isKindOfClass:[TYPE class]] ? dyn_cast_object : nil; \
})


// Get Object from index for NSArray
#define objectAtIndex(object, index) \
({ \
object.count > index ? [object objectAtIndex:index] : NULL; \
})

// Replace Object from index for NSArray
#define replaceObjectAtIndex(sourceObj, destObj, index) \
({ \
sourceObj.count > index && destObj != NULL ? [sourceObj replaceObjectAtIndex:index withObject:destObj] : NULL; \
})

// Remove Object from NSArray
#define removeObject(sourceObj, destObj) \
({ \
destObj != NULL ? [sourceObj removeObject:destObj] : NULL; \
})

// Remove Object from index for NSArray
#define removeObjectAtIndex(sourceObj, index) \
({ \
sourceObj.count > index ? [sourceObj removeObjectAtIndex:index] : NULL; \
})

// Exchange Objects between index for NSArray
#define exchangeObjectAtIndex(sourceObj, index1, index2) \
({ \
((sourceObj.count > index1) && (sourceObj.count > index2)) ? [sourceObj exchangeObjectAtIndex:index1 withObjectAtIndex:index2] : NULL; \
})


// Add Object for Array
#define addObject(sourceObject, destObject) \
({ \
destObject != NULL ? [sourceObject addObject:destObject] : NULL; \
})

// Insert Object to index for Array
#define insertObject(sourceObject, destObject ,index) \
({ \
destObject != NULL ? [sourceObject insertObject:destObject atIndex:index] : NULL; \
})

// Initiate Array with object
#define arrayWithObject(destObject) \
({ \
destObject != NULL ? [NSArray arrayWithObject:destObject] : NULL; \
})

// Get Value from Dictionary
#define valueForKey(sourceObject, key) \
({ \
![[sourceObject valueForKey:key]isKindOfClass:[NSNull class]] && sourceObject != NULL && key != NULL? [sourceObject valueForKey:key] : NULL; \
})


// Get Object from Dictionary
#define objectForKey(sourceObject, key) \
({ \
![[sourceObject objectForKey:key]isKindOfClass:[NSNull class]]&& sourceObject != NULL && key != NULL? [sourceObject objectForKey:key] : NULL; \
})


// Add Object to Dictionary
#define setObject(sourceObject, destObject, key) \
({ \
destObject != NULL && key != NULL? [sourceObject setObject:destObject forKey:key] : NULL; \
})

// Remove Object from Dictionary
#define removeObjectForKey(sourceObject,key) \
({ \
key != NULL? [sourceObject removeObjectForKey:key] : NULL; \
})



// Remove Object from Dictionary
#define removeObjectsInRange(sourceObject,range) \
({ \
@try {\
[sourceObject removeObjectsInRange:range];}\
@catch (NSException *exception) {\
NSLog(@"Exception: %@", exception);}\
})


// Remove Object from Dictionary
#define stringByTrimmingCharactersInSet(sourceString,characterSet ) \
({ \
    [NMCFAUtility validateString:sourceString]? [sourceString stringByTrimmingCharactersInSet:characterSet] : NULL; \
})





