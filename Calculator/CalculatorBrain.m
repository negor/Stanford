//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Gregor Tomasevic on 2011-11-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic,strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if (_operandStack == nil)
        _operandStack =[[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    }
    else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operation isEqualToString:@"-"]) {
        result = [self popOperand] - [self popOperand];
    }
    else if ([operation isEqualToString:@"/"]) {
        result = [self popOperand] / [self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) 
        [self.operandStack removeLastObject];
    
    return [operandObject doubleValue];
}

@end