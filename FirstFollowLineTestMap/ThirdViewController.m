//
//  ThirdViewController.m
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 19..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "ThirdViewController.h"

#import "ListViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize imageView, myScrollView, routeImage;
@synthesize numberOfTapsRequired, dbName, sights, persons;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"노선도", @"노선도");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,480)];
    //myScrollView.pagingEnabled = YES;
    self.myScrollView.delegate = self;
    routeImage = [UIImage imageNamed:@"routeline.png"];
    self.imageView = [[UIImageView alloc]initWithImage:routeImage];
    self.myScrollView.contentSize = CGSizeMake(1200, 2500);
    self.myScrollView.maximumZoomScale = 2;
    
    [self.myScrollView addSubview:imageView];
    [myScrollView setContentOffset:CGPointMake(600, 1250)];
    [self.view addSubview:myScrollView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [myScrollView addGestureRecognizer:singleTap];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)centerScrollViewContents
{
    CGSize boundsSize = self.myScrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self centerScrollViewContents];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

- (float)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    _scale =  scale;
    return _scale;
}


- (UITapGestureRecognizer *)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    stationnumber = 0;
    _gesture = gesture;

    if (_scale <= 1) {
        if ([self getXPoint:_gesture]>166 && [self getXPoint:_gesture]<188 && [self getYPoint:_gesture]>1877 && [self getYPoint:_gesture]<1901){
          
            stationnumber = 3;
            NSLog(@"하단");
        }//하단
        else if ([self getXPoint:_gesture]>546 && [self getXPoint:_gesture]<581 && [self getYPoint:_gesture]>1930 && [self getYPoint:_gesture]<1950){
           
            stationnumber = 2;
            NSLog(@"남포동");
        }//남포동
        else if ([self getXPoint:_gesture]>852 && [self getXPoint:_gesture]<889 && [self getYPoint:_gesture]>708 && [self getYPoint:_gesture]<737){
      
            stationnumber = 4;
            NSLog(@"범어사");
        }//범어사
        else if ([self getXPoint:_gesture]>740 && [self getXPoint:_gesture]<777 && [self getYPoint:_gesture]>1399 && [self getYPoint:_gesture]<1431){
         
            stationnumber = 1;
            NSLog(@"양정");
        }//양정
        else if ([self getXPoint:_gesture]>817 && [self getXPoint:_gesture]<855 && [self getYPoint:_gesture]>1073 && [self getYPoint:_gesture]<1104){
           
            stationnumber = 5;
            NSLog(@"온천장");
        }//온천장
    }
    else if (_scale > 1){
        if ([self getXPoint:_gesture]>166*_scale && [self getXPoint:_gesture]<188*_scale && [self getYPoint:_gesture]>1877*_scale && [self getYPoint:_gesture]<1901*_scale){
      
            stationnumber = 3;
            NSLog(@"하단");
        }//하단
        else if ([self getXPoint:_gesture]>546*_scale && [self getXPoint:_gesture]<581*_scale && [self getYPoint:_gesture]>1930*_scale && [self getYPoint:_gesture]<1950*_scale){
         
            stationnumber = 2;
            NSLog(@"남포동");
        }//남포동
        else if ([self getXPoint:_gesture]>852*_scale && [self getXPoint:_gesture]<889*_scale && [self getYPoint:_gesture]>708*_scale && [self getYPoint:_gesture]<737*_scale){
  
            stationnumber = 4;
            NSLog(@"범어사");
        }//범어사
        else if ([self getXPoint:_gesture]>740*_scale && [self getXPoint:_gesture]<777*_scale && [self getYPoint:_gesture]>1399*_scale && [self getYPoint:_gesture]<1431*_scale){

            stationnumber = 1;
            NSLog(@"양정");
        }//양정
        else if ([self getXPoint:_gesture]>817*_scale && [self getXPoint:_gesture]<855*_scale && [self getYPoint:_gesture]>1073*_scale && [self getYPoint:_gesture]<1104*_scale){
            stationnumber = 5;
            NSLog(@"온천장");
        }//온천장
    }
    
    if(stationnumber != 0){
        ListViewController *listViewController = [[ListViewController alloc]init];
        NSLog(@"여기도 왔다용%d",stationnumber);
        listViewController.no = stationnumber;
        [self.navigationController pushViewController:listViewController animated:YES];
    }
  
    
    


    return _gesture;
}



- (float)getXPoint:(UITapGestureRecognizer *)gesture
{
    _gesture=gesture;
    CGPoint touchPoint=[_gesture locationInView:myScrollView];
    XPosition = touchPoint.x;
    //NSLog(@"right %g", touchPoint.x);
    
    return XPosition;
}

- (float)getYPoint:(UITapGestureRecognizer *)gesture
{
    _gesture=gesture;
    CGPoint touchPoint=[_gesture locationInView:myScrollView];
    YPosition = touchPoint.y;
    //NSLog(@"left %g", touchPoint.y);
    
    return YPosition;
}


- (float)getScale:(float)scale
{
    _scale=scale;
    //NSLog(@"Zoomscale %f",_scale);
    //NSLog(@"Zoom End!");
    return _scale;
}




@end
