//
//  ViewController.h
//  QuoteGen
//
//  Created by Viget on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) NSArray *myQuotes;
@property (nonatomic, retain) NSMutableArray *movieQuotes;

@property (nonatomic, retain) IBOutlet UITextView *quote_text;
@property (nonatomic, retain) IBOutlet UISegmentedControl *quote_opt;

-(IBAction)quote_btn_touch:(id)sender;

@end
