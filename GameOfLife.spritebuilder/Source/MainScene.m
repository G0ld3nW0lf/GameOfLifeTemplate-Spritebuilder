//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "grid.h"
#import "MainScene.h"

@implementation MainScene{
    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_generationLabel;
    CCLabelTTF *_populationLabel;
    
}

int num = 0;

-(id)init{
    self = [super init];
    
    if(self){
        _timer = [[CCTimer alloc] init];
    }
    return self;
}

-(void)play{
    [self schedule:@selector(step) interval:0.5f];
    [_grid evolveStep];
}

-(void)pause{
    [self unschedule:@selector(step)];
}

-(void)step{
    num++;
    
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
    NSLog(@"%d", num);
}


@end
