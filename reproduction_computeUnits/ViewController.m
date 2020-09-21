//
//  ViewController.m
//  reproduction_compatibility
//
//  Created by 市川雄二 on 2020/09/18.
//

#import "ViewController.h"
#import "ModelUnderTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSError *error;

    id shape = @[@1, @22, @361];
    id bin_inputs = [[MLMultiArray alloc] initWithShape: shape dataType: MLMultiArrayDataTypeDouble error: &error];
    for (int p = 0; p < 22; p++) {
        for (int i = 0; i < 361; i++) {
            bin_inputs[@[@0, @(p), @(i)]] = [NSNumber numberWithFloat: p == 0 ? 1.0 : 0.0];
        }
    }
    id global_inputs = [[MLMultiArray alloc] initWithShape: @[@1, @19] dataType: MLMultiArrayDataTypeDouble error: &error];
    for (int i = 0; i < 19; i++) {
        global_inputs[i] = [NSNumber numberWithFloat: 0.0];
    }
    global_inputs[5] = [NSNumber numberWithFloat: -0.375];
    global_inputs[18] = [NSNumber numberWithFloat: -0.5];
    id symmetries = [[MLMultiArray alloc] initWithShape: @[@3] dataType: MLMultiArrayDataTypeDouble error: &error];
    for (int i = 0; i < 3; i++) {
        symmetries[i] = [NSNumber numberWithFloat: 0.0];
    }
    id userInputArray = [[ModelUnderTestInput alloc] initWithBin_inputs: bin_inputs global_inputs: global_inputs symmetries: symmetries];

    MLComputeUnits units[] = { MLComputeUnitsCPUOnly, MLComputeUnitsCPUAndGPU, MLComputeUnitsAll };
    for (int u = 0; u < 3; u++) {
        MLModelConfiguration* configuration = [[MLModelConfiguration alloc] init];
        //configuration.allowLowPrecisionAccumulationOnGPU = true;
        switch (u) {
            case MLComputeUnitsCPUOnly:
                NSLog(@"MLComputeUnitsCPUOnly");
                break;
            case MLComputeUnitsCPUAndGPU:
                NSLog(@"MLComputeUnitsCPUAndGPU");
                break;
            case MLComputeUnitsAll:
                NSLog(@"MLComputeUnitsAll");
                break;
            default:
                NSLog(@"should not reach here");
                break;
        }
        configuration.computeUnits = units[u];
        NSLog(@"model");
        id mlModel = [[ModelUnderTest alloc] initWithConfiguration: configuration error: &error];

        NSLog(@"predict");
        id output = [mlModel predictionFromFeatures: userInputArray error: &error];
        if (error) {
            NSLog(@" error => %@ ", [error userInfo]);
        } else {
            NSLog(@"output: %f %f %f", [output value_output][0].floatValue, [output value_output][1].floatValue, [output value_output][2].floatValue);
            // output: 2.464226 2.640257 -5.235566
        }
    }
}


@end
