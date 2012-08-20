class AppDelegate
  
  attr_accessor :window
  
  def application application, didFinishLaunchingWithOptions: launchOptions
    UIApplication.sharedApplication.setStatusBarHidden true, withAnimation: UIStatusBarAnimationNone
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    
    director = CCDirector.sharedDirector
    viewController = RootViewController.alloc.initWithNibName nil, bundle: nil
    viewController.wantsFullScreenLayout = true
    
    glView = EAGLView.viewWithFrame window.bounds, pixelFormat: KEAGLColorFormatRGB565, depthFormat: 0
    director.setOpenGLView glView
    puts("Retina Display Not supported") unless director.enableRetinaDisplay(true)
    director.setAnimationInterval 1.0 / 60
    director.setDisplayFPS true
    director.wantsFullScreenLayout = true
    viewController.setView glView
    window.addSubview viewController.view
    window.makeKeyAndVisible
    CCTexture2D.setDefaultAlphaPixelFormat KCCTexture2DPixelFormat_RGBA8888
    director.runWithScene HelloWorldScene.node
    true
  end
end
