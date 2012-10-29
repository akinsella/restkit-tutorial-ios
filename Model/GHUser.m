//
//  GHUser.h
//  RestKit Tutorial
//
//  Created by Alexis Kinsella on 09/29/12.
//  Copyright (c) 2012 Xebia France. All rights reserved.
//

#import "GHUser.h"

@implementation GHUser

+ (RKObjectMapping *)mapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]
                                                     usingBlock:^(RKObjectMapping *mapping) {
        [mapping mapAttributes:  @"login", @"gravatar_id", @"avatar_url", @"url", nil];
        [mapping mapKeyPathsToAttributes:  @"id", @"identifier", nil];
    }];
    return mapping;
}

- (NSURL *)avatarImageUrl {
    return [NSURL URLWithString:self.gravatar_id != nil ?
               [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?s=88&d=404", self.gravatar_id] :
                self.avatar_url];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.identifier, self.login];
}

@end

