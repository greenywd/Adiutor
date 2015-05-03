

@protocol UITextLinkInteraction
-(void)cancelInteractionWithLink;
-(BOOL)isInteractingWithLink;
-(BOOL)mightHaveLinks;
-(void)startInteractionWithLinkAtPoint:(CGPoint)point;
-(void)startLongInteractionWithLinkAtPoint:(CGPoint)point;
-(void)tapLinkAtPoint:(CGPoint)point;
-(void)updateInteractionWithLinkAtPoint:(CGPoint)point;
-(void)validateInteractionWithLinkAtPoint:(CGPoint)point;
-(BOOL)willInteractWithLinkAtPoint:(CGPoint)point;
@end
