//
//  CucumberishLoader.m
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCUITestTemplateUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit(){
    [CucumberishInitializer setupCucumberish];
}
