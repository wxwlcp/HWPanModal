//
//  HWPanContainerView.h
//  HWPanModal
//
//  Created by heath wang on 2019/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^didTap)(UITapGestureRecognizer *recognizer);

@interface HWPanContainerView : UIView

/// the presented view should add to the content view.
@property (nonatomic, strong, readonly) UIView *contentView;

@property (nullable, nonatomic, copy) didTap tapBlock;


- (instancetype)initWithPresentedView:(UIView *)presentedView frame:(CGRect)frame;

- (void)updateShadow:(UIColor *)shadowColor
        shadowRadius:(CGFloat)shadowRadius
        shadowOffset:(CGSize)shadowOffset
       shadowOpacity:(float)shadowOpacity;

- (void)clearShadow;

@end

@interface UIView (PanContainer)

@property (nullable, nonatomic, strong, readonly) HWPanContainerView *panContainerView;

@end

NS_ASSUME_NONNULL_END
