#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
    Grid *_grid;
    CCTimer *_timer;
    CCLabelTTF *_generationLabel;
    CCLabelTTF *_populationLabel;
}

- (id)init
{
    self = [super init];
    [_grid init];
    if (self) {
        _timer = [[CCTimer alloc] init];
    }
    
    return self;
}

- (void)play
{
    //this tells the game to call a method called 'step' every half second.
    [self schedule:[self step] interval:0.5f];
}

- (void)pause
{
    [self unschedule:[self step]];
}

// this method will get called every half second when you hit the play button and will stop getting called when you hi the pause button
- (SEL)step
{
    [_grid rapper];
    _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
    _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
}

@end