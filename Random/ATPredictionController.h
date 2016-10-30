//
//  ATPredictionController.h
//  Random
//
//  Created by Aleksandr Tsebrii on 2/19/16.
//  Copyright © 2016 Aleksandr Tsebrii. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ATSelectedLanguage) {
    ATSelectedLanguageEnglish = 1,
    ATSelectedLanguageRussian = 0
};

@interface ATPredictionController : UIViewController

@property (assign, nonatomic) ATSelectedLanguage selectedLanguage;

- (instancetype)initWithselectedLanguage:(ATSelectedLanguage)selectedLanguage;

@end
