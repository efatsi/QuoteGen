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
@synthesize quote_opt;

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
    
    // 2 - Load movie quotes
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes= [[NSMutableArray arrayWithContentsOfFile:plistCatPath] copy];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    movieQuotes=nil;
    myQuotes=nil;
    movieQuotes=nil;
    quote_text=nil;
    quote_opt=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)quote_btn_touch:(id)sender {
    
    if (self.quote_opt.selectedSegmentIndex == 0) {
        int array_tot = [self.myQuotes count];
        NSString *all_quotes = @"";
        for (int x=0; x<array_tot; x++) {
            NSString *quote = [self.myQuotes objectAtIndex:x];
            all_quotes = [NSString stringWithFormat:@"%@\n%@", all_quotes, quote];            
        }
        self.quote_text.text = [NSString stringWithFormat:@"%@", all_quotes];
    }
    else {
        if (self.quote_opt.selectedSegmentIndex == 1) {
            int array_tot = [self.movieQuotes count];
            int index = (arc4random() % array_tot);
            NSString *quote = [[self.movieQuotes objectAtIndex:index] valueForKey:@"quote"];
            NSString *source = [[self.movieQuotes objectAtIndex:index] valueForKey:@"source"];
            self.quote_text.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@\n\nFrom: %@",  quote, source];
            
            /* replace category to log what movie quotes have been displayed */
            int movie_array_tot = [self.movieQuotes count];
            NSString *quote1 = [[self.movieQuotes objectAtIndex:index] valueForKey:@"quote"];
            for (int x=0; x < movie_array_tot; x++) {
                NSString *quote2 = [[movieQuotes objectAtIndex:x] valueForKey:@"quote"];
                if ([quote1 isEqualToString:quote2]) {
                    NSMutableDictionary *itemAtIndex = (NSMutableDictionary *)[movieQuotes objectAtIndex:x];
                    [itemAtIndex setValue:@"DONE" forKey:@"source"];
                }
            }
        }
        else {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", @"favorite"];
            NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
            int array_tot = [filteredArray count];
            if (array_tot > 0) {
                int index = (arc4random() % array_tot);
                NSString *quote = [[filteredArray objectAtIndex:index] valueForKey:@"quote"];
                NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
                self.quote_text.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@\n\nFrom: %@",  quote, source];
            }  
            else {
                self.quote_text.text = [NSString stringWithFormat:@"Something is going wrong"];
            }

        }
    }
}


//else {
//    // 2.1 - determine category
//    NSString *selectedCategory = @"classic";
//    if (self.quote_opt.selectedSegmentIndex == 1) {
//        selectedCategory = @"modern";
//    }
//    // 2.2 - filter array by category using predicate
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
//    NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
//    // 2.3 - get total number in filtered array
//    int array_tot = [filteredArray count];
//    // 2.4 - as a safeguard only get quote when the array has rows in it
//    if (array_tot > 0) {
//        // 2.5 - get random index
//        int index = (arc4random() % array_tot);
//        // 2.6 - get the quote string for the index 
//        NSString *quote = [[filteredArray objectAtIndex:index] valueForKey:@"quote"];
//        self.quote_text.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@",  quote];
//    } else {
//        self.quote_text.text = [NSString stringWithFormat:@"No quotes to display."];
//    }
//}
    
@end
