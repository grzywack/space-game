class RootViewController < UIViewController
  
  def shouldAutorotateToInterfaceOrientation orientation
    [UIInterfaceOrientationLandscapeLeft, UIInterfaceOrientationLandscapeRight].include? orientation
  end
  
end
