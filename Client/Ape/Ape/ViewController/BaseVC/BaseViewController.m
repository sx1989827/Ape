//
//  BaseViewController.m
//  RunMan-User
//
//  Created by 孙昕 on 15/5/19.
//  Copyright (c) 2015年 孙昕. All rights reserved.
//

#import "BaseViewController.h"
#import "Define.h"
#import <POP.h>
#import "UIColor+Category.h"
#import "UIImage+Extention.h"
#import "VCAnimateManager.h"
#import <AFNetworking.h>
static UIImageView *g_navBarHairlineImageView;
static __weak UINavigationController *g_nav;
static NSMutableArray *g_arrImgHud;
static NSString *g_backImg;
@interface BaseViewController ()<UIScrollViewDelegate>
{
    UIImageView *imageView;
    CGFloat curScrollViewPos;
    CGRect rectNavBar;
    CGFloat oriTop;
    CGFloat oriBottom;
    BOOL bTabShow;
    BOOL bHideBackButton;
    NSInteger iAppearCount;
    UILabel *titleLabel;
    UIScreenEdgePanGestureRecognizer *edgePanGesture;
}
@property (assign,readwrite,nonatomic) BOOL bFirstAppear;
@end

@implementation BaseViewController
+(void)load
{
    g_arrImgHud=[NSMutableArray array];
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @ "BaseVC" ofType :@ "bundle"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    for(int i=0;;i++)
    {
        NSString *path=[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.png",i+1]];
        if([fileManager fileExistsAtPath:path])
        {
            [g_arrImgHud addObject:[UIImage imageWithContentsOfFile:path]];
        }
        else
        {
            break;
        }
    }
    g_backImg=[bundlePath stringByAppendingPathComponent:@"back.png"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    iAppearCount=0;
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    bHideBackButton=NO;
    _bHud=YES;
    _bAutoHiddenBar=NO;
    _bFirstAppear=YES;
    if(self.hidesBottomBarWhenPushed==YES)
    {
        bTabShow=NO;
    }
    else
    {
        bTabShow=YES;
    }
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor hexStringToColor:@"#333333"];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=titleLabel;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationItem setHidesBackButton:YES];
    if(_bInteractive && edgePanGesture==nil)
    {
//        edgePanGesture=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:[VCAnimateManager sharedObject] action:@selector(handleRec:)];
        edgePanGesture.edges = UIRectEdgeLeft;
        [self.view addGestureRecognizer:edgePanGesture];
    }
    else if(!_bInteractive && edgePanGesture!=nil)
    {
        [self.view removeGestureRecognizer:edgePanGesture];
        edgePanGesture=nil;
    }
    [super viewDidAppear:animated];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setHidesBackButton:YES];
    if (g_nav != self.navigationController) {
        g_navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
        g_nav=self.navigationController;
    }
    [self setNavigationBottomLine:self.bHideNavigationBottomLine];

    iAppearCount++;
    if(iAppearCount==2)
    {
        _bFirstAppear=NO;
    }
    if(!bHideBackButton)
    {
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 12, 20)];
        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:g_backImg] forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [btn addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
        });
    }
    if(_bAutoHiddenBar && _bFirstAppear && _viewScrollAutoHidden)
    {
        rectNavBar=self.navigationController.navigationBar.frame;
        NSInteger i=0;
        for(NSLayoutConstraint *con in self.view.constraints)
        {
            if(con.firstAttribute==NSLayoutAttributeTop)
            {
                oriTop=con.constant;
                i++;
            }
            else if(con.firstAttribute==NSLayoutAttributeBottom)
            {
                oriBottom=con.constant;
                i++;
            }
            if(i==2)
            {
                break;
            }
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoHiddenAction) name:@"scrollViewDidScroll" object:nil];
    }
    if(!_bHud)
    {
        return;
    }
    if(imageView==nil)
    {
        imageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        imageView.userInteractionEnabled=YES;
        imageView.backgroundColor=[UIColor whiteColor];
        imageView.contentMode=UIViewContentModeCenter;
        imageView.layer.zPosition=MAXFLOAT;
        imageView.animationImages=g_arrImgHud;
        imageView.animationDuration=1.0;
        imageView.animationRepeatCount=-1;
    }
    imageView.alpha=1;
    [self.view addSubview:imageView];
    [imageView startAnimating];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationItem setHidesBackButton:YES];
    [self removeHud];
    if(_bAutoHiddenBar && _viewScrollAutoHidden)
    {
        NSInteger i=0;
        for(NSLayoutConstraint *con in self.view.constraints)
        {
            if(con.firstAttribute==NSLayoutAttributeTop)
            {
                con.constant=oriTop;
                i++;
            }
            else if(con.firstAttribute==NSLayoutAttributeBottom)
            {
                con.constant=oriBottom;
                i++;
            }
            if(i==2)
            {
                break;
            }
        }
        if(bTabShow)
        {
            self.tabBarController.tabBar.hidden=NO;
        }
        self.navigationController.navigationBar.frame=rectNavBar;
        for(UIView *view in self.navigationController.navigationBar.subviews)
        {
            if(![view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
            {
                view.hidden=NO;
            }
            
        }
    }


}

-(void)autoHiddenAction
{
    int currentPostion = _viewScrollAutoHidden.contentOffset.y;
    
    if (currentPostion - curScrollViewPos > 20  && currentPostion > 0 && _viewScrollAutoHidden.contentSize.height>_viewScrollAutoHidden.bounds.size.height) {
        curScrollViewPos = currentPostion;
        NSInteger i=0;
        for(NSLayoutConstraint *con in self.view.constraints)
        {
            if(con.firstAttribute==NSLayoutAttributeTop)
            {
                con.constant=20;
                i++;
            }
            else if (con.firstAttribute==NSLayoutAttributeBottom)
            {
                con.constant=0;
                i++;
            }
            if(i==2)
            {
                break;
            }
        }
        if(bTabShow)
        {
            self.tabBarController.tabBar.hidden=YES;
        }
        [UIView animateWithDuration:0.2 animations:^{
            self.navigationController.navigationBar.frame=CGRectMake(0, 0, rectNavBar.size.width, 20);
        } completion:^(BOOL finished) {
            for(UIView *view in self.navigationController.navigationBar.subviews)
            {
                if(![view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
                {
                    view.hidden=YES;
                }
            }
        }];
    }
    else if ((curScrollViewPos - currentPostion > 20) && (currentPostion  <= _viewScrollAutoHidden.contentSize.height-_viewScrollAutoHidden.bounds.size.height-5) )
    {
    
        curScrollViewPos = currentPostion;
        NSInteger i=0;
        for(NSLayoutConstraint *con in self.view.constraints)
        {
            if(con.firstAttribute==NSLayoutAttributeTop)
            {
                con.constant=oriTop;
                i++;
            }
            else if(con.firstAttribute==NSLayoutAttributeBottom)
            {
                con.constant=oriBottom;
                i++;
            }
            if(i==2)
            {
                break;
            }
        }
        if(bTabShow)
        {
            self.tabBarController.tabBar.hidden=NO;
        }
        [UIView animateWithDuration:0.2 animations:^{
            self.navigationController.navigationBar.frame=rectNavBar;
        } completion:^(BOOL finished) {
            for(UIView *view in self.navigationController.navigationBar.subviews)
            {
                if(![view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
                {
                    view.hidden=NO;
                }
                
            }
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onBack
{
	if(self.navigationController.viewControllers.count==1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)hideBackButton
{
    if(self.navigationItem!=nil)
    {
        self.navigationItem.leftBarButtonItem=nil;
        bHideBackButton=YES;
    }
    
}

-(void)removeHud
{
    [imageView stopAnimating];
    POPBasicAnimation *ani=[POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    ani.toValue=@0;
    ani.duration=0.2;
    [ani setCompletionBlock:^(POPAnimation *ani, BOOL bFinish) {
        [imageView removeFromSuperview];
    }];
    [imageView pop_addAnimation:ani forKey:@"hide"];
}

-(NSString*)title
{
    return titleLabel.text;
}

-(void)setTitle:(NSString *)title
{
    titleLabel.text=title;
}

- (void)setNavigationBottomLine:(BOOL)bHideNavigationBottomLine
{

    if (bHideNavigationBottomLine)
    {
        g_navBarHairlineImageView.hidden = YES;

//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor hexStringToColor:@"fafafa"]] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        g_navBarHairlineImageView.hidden = NO;

//        UINavigationBar *naviBar = [[UINavigationBar alloc] init];
//        UIImage *systemImage = [naviBar backgroundImageForBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setBackgroundImage:systemImage forBarMetrics:UIBarMetricsDefault];
    }
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *foundImageView = [self findHairlineImageViewUnder:subview];
        if (foundImageView) {
            return foundImageView;
        }
    }
    return nil;
}

-(void)flyIn
{
    NSMutableArray<UIView*> *arr=[NSMutableArray array];
    for(UIView * view in self.view.subviews)
    {
        [arr addObject:view];
    }
    [arr sortUsingComparator:^NSComparisonResult(UIView*  _Nonnull obj1, UIView*  _Nonnull obj2) {
        if(obj1.frame.origin.y<obj2.frame.origin.y)
        {
            return NSOrderedAscending;
        }
        else if(obj1.frame.origin.y>obj2.frame.origin.y)
        {
            return NSOrderedDescending;
        }
        else
        {
            return NSOrderedSame;
        }
    }];
    int i=0;
    CGFloat delay=0;
    for(UIView * v in arr)
    {
        i++;
        CABasicAnimation *ani=[CABasicAnimation animationWithKeyPath:@"position"];
        ani.removedOnCompletion=NO;
        ani.fillMode=kCAFillModeBackwards;
        ani.fromValue=[NSValue valueWithCGPoint:CGPointMake((i%2==0)?([UIScreen mainScreen].bounds.size.width*1.5+50):(-[UIScreen mainScreen].bounds.size.width*0.5-50), v.layer.position.y)];
        ani.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        ani.duration=0.3;
        ani.toValue=[NSValue valueWithCGPoint:v.layer.position];
        ani.beginTime=CACurrentMediaTime()+delay;
        [v.layer addAnimation:ani forKey:@"move"];
        delay+=0.2;
    }

}

@end









