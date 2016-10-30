//
//  ATStartController.m
//  Random
//
//  Created by Aleksandr Tsebrii on 2/19/16.
//  Copyright © 2016 Aleksandr Tsebrii. All rights reserved.
//

#import "ATStartController.h"
#import "ATPredictionController.h"

@interface ATStartController ()

@end

@implementation ATStartController

#pragma mark - UIViewController

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *enghlishLanguageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    enghlishLanguageButton.frame = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2);
    enghlishLanguageButton.backgroundColor = [UIColor blackColor];
    [enghlishLanguageButton setTitle:@"ENGLISH" forState:UIControlStateNormal];
    [enghlishLanguageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [enghlishLanguageButton setTitleColor:[UIColor colorWithWhite:0.098 alpha:1.000] forState:UIControlStateHighlighted];
    enghlishLanguageButton.tag = ATSelectedLanguageEnglish;
    [self.view addSubview:enghlishLanguageButton];
    [enghlishLanguageButton addTarget:self action:@selector(actionLanguageButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *russianLanguageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    russianLanguageButton.frame = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2);
    [russianLanguageButton setTitle:@"RUSSIAN" forState:UIControlStateNormal];
    [russianLanguageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [russianLanguageButton setTitleColor:[UIColor colorWithWhite:0.098 alpha:1.000] forState:UIControlStateHighlighted];
    russianLanguageButton.backgroundColor = [UIColor blackColor];
    russianLanguageButton.tag = ATSelectedLanguageRussian;
    [self.view addSubview:russianLanguageButton];
    [russianLanguageButton addTarget:self action:@selector(actionLanguageButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

#pragma mark - Button Actions

- (void)actionLanguageButtonTouchUpInside:(UIButton *)sender {
    
    ATPredictionController *predictionController = [[ATPredictionController alloc] initWithselectedLanguage:sender.tag];
    [self presentViewController:predictionController animated:YES completion:nil];
    
}

@end
