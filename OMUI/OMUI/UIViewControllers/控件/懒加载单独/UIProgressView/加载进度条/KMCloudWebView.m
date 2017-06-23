//
//  KMCloudWebView.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "KMCloudWebView.h"
#import "WYWebProgressLayer.h"
@interface KMCloudWebView ()<UIWebViewDelegate>
{
    UIWebView *_webView;
    
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
}
@end


@implementation KMCloudWebView


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.navigationController setNavigationBarHidden:YES];
        [self.navigationController.navigationBar setHidden:YES];
        
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    
}

- (void)setupUI {
    self.url = URLString;
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [_webView loadRequest:request];
    
    _webView.backgroundColor = [UIColor whiteColor];
    
    _progressLayer = [WYWebProgressLayer new];
    _progressLayer.frame = CGRectMake(0, 20, _webView.bounds.size.width, 2);
    
    [_webView.layer addSublayer:_progressLayer];
    [self.view addSubview:_webView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"backHome"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(55));
        make.bottom.equalTo(self.view).offset(-100);
        make.bottom.right.equalTo(self.view).offset(-20);
    }];
    
}

-(void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_progressLayer finishedLoad];
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_progressLayer finishedLoad];
}

- (void)dealloc {
    
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
    NSLog(@"i am dealloc");
}


@end

