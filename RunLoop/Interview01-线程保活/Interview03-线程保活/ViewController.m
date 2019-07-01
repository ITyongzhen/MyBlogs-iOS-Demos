

#import "ViewController.h"

/** YZThread **/
@interface YZThread : NSThread
@end
@implementation YZThread
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end

@interface ViewController ()
@property (strong, nonatomic) YZThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//      YZThread *thread = [[YZThread alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [thread start];
    
    
    
    self.thread = [[YZThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}
// 这个方法，线程不保活
- (void)run3 {
     NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

- (void)run {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    // 往RunLoop里面添加Source\Timer\Observer
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    NSLog(@"%s ----end----", __func__);
}
// 这个方法的目的：线程保活
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击屏幕");
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}
// 子线程需要执行的任务
- (void)test
{
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}
//// 这个方法：线程不保活
//- (void)run {
//    NSLog(@"%s %@", __func__, [NSThread currentThread]);
//
//}
@end
