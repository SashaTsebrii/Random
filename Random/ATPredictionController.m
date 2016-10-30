//
//  ATPredictionController.m
//  Random
//
//  Created by Aleksandr Tsebrii on 2/19/16.
//  Copyright © 2016 Aleksandr Tsebrii. All rights reserved.
//

#import "ATPredictionController.h"

@interface ATPredictionController ()

@property (weak, nonatomic) UIView *predictionView;
@property (weak, nonatomic) UILabel *predictionLabel;
@property (assign, nonatomic) BOOL firstTime;
@property (strong, nonatomic) NSArray *predictionArray;
@property (assign, nonatomic) NSInteger randomPrediction;

@end

@implementation ATPredictionController

#pragma mark - Initialization

- (instancetype)initWithselectedLanguage:(ATSelectedLanguage)selectedLanguage {
    self = [super init];
    
    if (self) {
        
        self.selectedLanguage = selectedLanguage;
        
    }
    
    return self;
    
}

#pragma mark - UIViewController

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat maxSize = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    CGFloat offset = maxSize * 0.1f;
    CGFloat maxSizeWithOffset = maxSize - offset;
    
    UIView *predictionView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - maxSizeWithOffset / 2.f,
                                                                      CGRectGetMidY(self.view.bounds) - maxSizeWithOffset / 2.f,
                                                                      maxSizeWithOffset, maxSizeWithOffset)];
    predictionView.backgroundColor = [UIColor colorWithWhite:0.098 alpha:1.000];
    predictionView.alpha = 0.f;
    
    CALayer *predictionViewLayer = predictionView.layer;
    predictionViewLayer.cornerRadius = maxSizeWithOffset / 2.f;
    predictionViewLayer.borderWidth = 1.f;
    predictionViewLayer.borderColor = [[UIColor colorWithWhite:0.045 alpha:1.000] CGColor];
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = predictionView.bounds;
    gradientLayer.cornerRadius = maxSizeWithOffset / 2.f;
    gradientLayer.colors = [[NSArray alloc] initWithObjects:
                            (id)[[UIColor colorWithWhite:0.095 alpha:1.000] CGColor],
                            (id)[[UIColor colorWithWhite:0.025 alpha:1.000] CGColor], nil];
    [predictionView.layer insertSublayer:gradientLayer above:0];
    
    [self.view addSubview:predictionView];
    self.predictionView = predictionView;
    
    UILabel *predictionLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(predictionView.bounds) - maxSizeWithOffset / 2,
                                                                         CGRectGetMidY(predictionView.bounds) - maxSizeWithOffset / 4 / 2,
                                                                         maxSizeWithOffset, maxSizeWithOffset / 4)];
    predictionLabel.backgroundColor = [UIColor clearColor];
    predictionLabel.textAlignment = NSTextAlignmentCenter;
    predictionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    predictionLabel.numberOfLines = 0;
    predictionLabel.textColor = [UIColor whiteColor];
    predictionLabel.font = [UIFont boldSystemFontOfSize:24.f];
    predictionLabel.text = [NSString stringWithFormat:@"%@", self.selectedLanguage ? @"Ask your question" : @"Задавайте ваш вопрос"];
    predictionLabel.alpha = 0.f;
    [self.predictionView addSubview:predictionLabel];
    self.predictionLabel = predictionLabel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *englishPredictionArray = [[NSArray alloc] initWithObjects:
                                       @"It is certain", @"It is decidedly so", @"Without a doubt", @"Yes — definitely", @"You may rely on it",
                                       @"As I see it, yes", @"Most likely", @"Outlook good", @"Signs point to yes", @"Yes",
                                       @"Reply hazy, try again", @"Ask again later", @"Better not tell you now", @"Cannot predict now", @"Concentrate and ask again",
                                       @"Don’t count on it", @"My reply is no", @"My sources say no", @"Outlook not so good", @"Very doubtful", nil];
    NSArray *russianPredictionArray = [[NSArray alloc] initWithObjects:
                                       @"Бесспорно", @"Предрешено", @"Никаких сомнений", @"Определённо да", @"Можешь быть уверен в этом",
                                       @"Мне кажется — «да»", @"Вероятнее всего", @"Хорошие перспективы", @"Знаки говорят — «да»", @"Да",
                                       @"Пока не ясно, попробуй снова", @"Спроси позже", @"Лучше не рассказывать", @"Сейчас нельзя предсказать", @"Сконцентрируйся и спроси опять",
                                       @"Даже не думай", @"Мой ответ — «нет»", @"По моим данным — «нет»", @"Перспективы не очень хорошие", @"Весьма сомнительно", nil];
    
    if (self.selectedLanguage == ATSelectedLanguageEnglish) {
        self.predictionArray = [[NSArray alloc] initWithArray:englishPredictionArray];
    } else if (self.selectedLanguage == ATSelectedLanguageRussian) {
        self.predictionArray = [[NSArray alloc] initWithArray:russianPredictionArray];
    }
    
    __weak ATPredictionController *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.f
                         animations:^{
                             weakSelf.predictionView.alpha = 1.f;
                         }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1.f
                             animations:^{
                                 weakSelf.predictionLabel.alpha = 1.f;
                             }];
        });
    });
    
}

- (void)changePredictionLabelTextToText:(NSString *)toText {
    
    __weak ATPredictionController *weakSelf = self;
    
    [UIView animateWithDuration:1.f
                     animations:^{
                         weakSelf.predictionLabel.alpha = 0.f;
                     } completion:^(BOOL finished) {
                         weakSelf.predictionLabel.text = toText;
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             [UIView animateWithDuration:1.f
                                              animations:^{
                                                  if (weakSelf.randomPrediction >= 0 & weakSelf.randomPrediction < 5) {
                                                      weakSelf.predictionLabel.textColor = [UIColor colorWithRed:0.000 green:0.251 blue:0.502 alpha:1.000];
                                                  } else if (weakSelf.randomPrediction >= 5 & weakSelf.randomPrediction < 10) {
                                                      weakSelf.predictionLabel.textColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000];
                                                  } else if (weakSelf.randomPrediction >= 10 & weakSelf.randomPrediction < 15) {
                                                      weakSelf.predictionLabel.textColor = [UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000];
                                                  } else if (weakSelf.randomPrediction >= 15 & weakSelf.randomPrediction < 20) {
                                                      weakSelf.predictionLabel.textColor = [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000];
                                                  }
                                                  weakSelf.predictionLabel.alpha = 1.f;
                                                  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                      [UIView animateWithDuration:1.f
                                                                       animations:^{
                                                                           weakSelf.predictionLabel.alpha = 0.f;
                                                                       } completion:^(BOOL finished) {
                                                                           weakSelf.predictionLabel.text = [NSString stringWithFormat:@"%@", weakSelf.selectedLanguage ? @"Ask your question" : @"Задавайте ваш вопрос"];
                                                                           weakSelf.predictionLabel.textColor =  [UIColor whiteColor];
                                                                           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                               [UIView animateWithDuration:1.f
                                                                                                animations:^{
                                                                                                    weakSelf.predictionLabel.alpha = 1.f;
                                                                                                }];
                                                                           });
                                                                       }];
                                                  });
                                              }];
                         });
                     }];
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (event.subtype == UIEventSubtypeMotionShake) {
        self.randomPrediction = arc4random() % self.predictionArray.count;
        [self changePredictionLabelTextToText:[self.predictionArray objectAtIndex:self.randomPrediction]];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
    
}

@end
