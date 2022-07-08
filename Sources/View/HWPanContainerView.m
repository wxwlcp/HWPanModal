//
//  HWPanContainerView.m
//  HWPanModal
//
//  Created by heath wang on 2019/4/26.
//

#import "HWPanContainerView.h"

@interface HWPanContainerView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;


@end

@implementation HWPanContainerView

- (instancetype)initWithPresentedView:(UIView *)presentedView frame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
    	_contentView = [UIView new];
        
    	_contentView.frame = self.bounds;
		[self addSubview:_contentView];
		[_contentView addSubview:presentedView];
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
        [self addGestureRecognizer:_tapGestureRecognizer];
    }
	
    return self;
}

#pragma mark - touch action

- (void)didTapView {
    self.tapBlock ? self.tapBlock(self.tapGestureRecognizer) : nil;
}

- (void)updateShadow:(UIColor *)shadowColor shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset shadowOpacity:(float)shadowOpacity {
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
}

- (void)clearShadow {
	self.layer.shadowColor = nil;
	self.layer.shadowRadius = 3.0;
	self.layer.shadowOffset = CGSizeZero;
	self.layer.shadowOpacity = 0.0;
}

@end

@implementation UIView (PanContainer)

- (HWPanContainerView *)panContainerView {
	for (UIView *subview in self.subviews) {
		if ([subview isKindOfClass:HWPanContainerView.class]) {
			return (HWPanContainerView *) subview;
		}
	}
	return nil;
}


@end
