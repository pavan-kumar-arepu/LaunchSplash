//
//  ViewController.m
//  LaunchAnimation
//
//  Created by Pavankumar Arepu on 15/10/2015.
//  Copyright © 2015 Pavankumar Arepu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//https://github.com/ppam1524/LaunchSplash.git
@implementation ViewController

int DELAY = 4.0,INTERVAL = 0;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self hideSplash];
    [self startAnimation];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) hideSplash
{
    self.S1.hidden = YES;
    self.P.hidden = YES;
    self.L.hidden = YES;
    self.A.hidden = YES;
    self.S2.hidden = YES;
    self.H.hidden = YES;
}

-(void)startAnimation
{
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(S1Call) userInfo:nil repeats:NO];
}


-(void)S1Call
{
    self.S1.hidden = NO;
    self.S1.layer.anchorPoint = CGPointMake(0.5,0.5);
    
    [self animateReusableCode:self.S1];
    
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(PCall) userInfo:nil repeats:NO];
    
}

-(void)PCall
{
    self.P.hidden = NO;
    self.P.layer.anchorPoint = CGPointMake(0.5,0.5);
    [self animateReusableCode:self.P];
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(LCall) userInfo:nil repeats:NO];
    
}


-(void)LCall
{
    self.L.hidden = NO;
    self.L.layer.anchorPoint = CGPointMake(0.5,0.5);
    [self animateReusableCode:self.L];
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(ACall) userInfo:nil repeats:NO];
    
}
-(void)ACall
{
    self.A.hidden = NO;
    self.A.layer.anchorPoint = CGPointMake(0.5,0.5);
    [self animateReusableCode:self.A];
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(S2Call) userInfo:nil repeats:NO];
    
}

-(void)S2Call
{
    self.S2.hidden = NO;
    self.S2.layer.anchorPoint = CGPointMake(0.5,0.5);
    [self animateReusableCode:self.S2];
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(HCall) userInfo:nil repeats:NO];
    
}
-(void)HCall
{
    self.H.hidden = NO;
    self.H.layer.anchorPoint = CGPointMake(0.5,0.5);
    [self animateReusableCode:self.H];

    
    [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(cubeAnimation) userInfo:nil repeats:NO];

    
}


-(void)cubeAnimation
{

    [self animationCube:_S1];
    [self animationCube:_P];
    [self animationCube:_L];
    [self animationCube:_A];
    [self animationCube:_S2];
    [self animationCube:_H];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(cubeAnimation) userInfo:nil repeats:YES];

    
    [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(animateSwipe) userInfo:nil repeats:NO];

}
//UIViewAnimationCurveEaseOut
-(void)animateSwipe
{
    [UIView animateWithDuration:1.0
                          delay:0.6
                        options:(UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         
                         _animateVIew.layer.transform = CATransform3DRotate(CATransform3DIdentity, -M_PI_2, 0, 1, 0);
                     } completion:^(BOOL finished){
                         
                         //remove that imageview from the view
                         [_animateVIew removeFromSuperview];
                     }];
}

-(void)animationCube:(UIImageView*)imgView
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:2.0f];
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"cube" ];
    [imgView.layer addAnimation:animation forKey:NULL];
}
-(void)animateReusableCode:(UIImageView *)yourImage
{
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.0],
                              [NSNumber numberWithFloat:1.5],
                              [NSNumber numberWithFloat:1.0],
                              [NSNumber numberWithFloat:1.0],
                              nil];
    bounceAnimation.duration = DELAY;
    [bounceAnimation setTimingFunctions:[NSArray arrayWithObjects:
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         nil]];
    [yourImage.layer addAnimation:bounceAnimation forKey:@"bounce"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
