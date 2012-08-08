//
//  ViewController.m
//  QuoteGen
//
//  Created by Viget on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myQuotes;
@synthesize movieQuotes;
@synthesize quote_text;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1 - Add array of personal quotes
    self.myQuotes = [NSArray arrayWithObjects:
                     @"Live and let live", 
                     @"Don't cry over spilt milk", 
                     @"Always look on the bright side of life", 
                     @"Nobody's perfect", 
                     @"Can't see the woods for the trees",
                     @"Better to have loved and lost than not loved at all",
                     @"The early bird catches the worm",
                     @"As slow as a wet week",
                     nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    movieQuotes=nil;
    myQuotes=nil;
    quote_text=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)quote_btn_touch:(id)sender {
	// 1 - Get number of rows in array
    int array_tot = [self.myQuotes count];
	// 2 - Get random index
	int index = (arc4random() % array_tot);
	// 3 - Get the quote string for the index 
	NSString *my_quote = [self.myQuotes objectAtIndex:index];
	// 4 - Display the quote in the text view
	self.quote_text.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];      
}

@end
