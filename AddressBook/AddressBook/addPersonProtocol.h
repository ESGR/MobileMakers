//
//  addPersonProtocol.h
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@protocol addPersonProtocol <NSObject>

-(void) refreshData;
-(void) saveToCoreData;
@end
