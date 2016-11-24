//
//  JiKeAnimationStatus.h
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/23.
//  Copyright © 2016年 李龙. All rights reserved.
//

#ifndef JiKeAnimationStatus_h
#define JiKeAnimationStatus_h

typedef enum
{
    // User must provide pre-transition and transition blocks
    BBCyclingLabelTransitionEffectCustom = 0,
    
    BBCyclingLabelTransitionEffectFadeIn    = 1 << 0,
    BBCyclingLabelTransitionEffectFadeOut   = 1 << 1,
    BBCyclingLabelTransitionEffectCrossFade = BBCyclingLabelTransitionEffectFadeIn |
    BBCyclingLabelTransitionEffectFadeOut,
    
    BBCyclingLabelTransitionEffectZoomIn  = 1 << 2,
    BBCyclingLabelTransitionEffectZoomOut = 1 << 3,
    
    BBCyclingLabelTransitionEffectScaleFadeOut = BBCyclingLabelTransitionEffectFadeIn |
    BBCyclingLabelTransitionEffectFadeOut |
    BBCyclingLabelTransitionEffectZoomOut,
    BBCyclingLabelTransitionEffectScaleFadeIn  = BBCyclingLabelTransitionEffectFadeIn |
    BBCyclingLabelTransitionEffectFadeOut |
    BBCyclingLabelTransitionEffectZoomIn,
    
    // These two move the entering label from above/below to center and exiting label up/down without cross-fade
    // It's a good idea to set the clipsToBounds property of the BBCyclingLabel to true and use this in a confined space
    BBCyclingLabelTransitionEffectScrollUp   = 1 << 4,
    BBCyclingLabelTransitionEffectScrollDown = 1 << 5,
    
    BBCyclingLabelTransitionEffectDefault = BBCyclingLabelTransitionEffectCrossFade
} BBCyclingLabelTransitionEffect;

#endif /* JiKeAnimationStatus_h */
