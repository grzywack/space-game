class HelloWorldScene < CCScene
  
  attr_accessor :layer
  
  def init
    super
    @layer = HelloWorldLayer.node
    addChild @layer
    self
  end
  
  def dealloc
    @layer = nil
    super
  end
  
end

class HelloWorldLayer < CCLayer
  
  def init
    super
    @batchNode = CCSpriteBatchNode.batchNodeWithFile "Spritesheets/Sprites.pvr.ccz"
    addChild @batchNode
    CCSpriteFrameCache.sharedSpriteFrameCache.addSpriteFramesWithFile "Spritesheets/Sprites.plist"
    @ship = CCSprite.spriteWithSpriteFrameName "SpaceFlier_sm_1.png"
    winSize = CCDirector.sharedDirector.winSize
    @ship.position = [winSize.width * 0.1, winSize.height * 0.5]
    @batchNode.addChild @ship, z: 1
    # 1) Create the CCParallaxNode
    @backgroundNode = CCParallaxNode.node
    @backgroundNode.parallaxArray
    addChild @backgroundNode, z: -1
    # 2) Create the sprites we'll add to the CCParallaxNode
    @spacedust1 = CCSprite.spriteWithFile "Backgrounds/bg_front_spacedust.png"
    @spacedust2 = CCSprite.spriteWithFile "Backgrounds/bg_front_spacedust.png"
    @planetsunrise = CCSprite.spriteWithFile "Backgrounds/bg_planetsunrise.png"
    @galaxy = CCSprite.spriteWithFile "Backgrounds/bg_galaxy.png"
    @spacialanomaly = CCSprite.spriteWithFile "Backgrounds/bg_spacialanomaly.png"
    @spacialanomaly2 = CCSprite.spriteWithFile "Backgrounds/bg_spacialanomaly2.png"
    # 3) Determine relative movement speeds for space dust and background
    dustSpeed = [0.1, 0.1]
    bgSpeed = [0.05, 0.05]
    # 4) Add children to CCParallaxNode
    @backgroundNode.addChild @spacedust1, z: 0, parallaxRatio: dustSpeed, positionOffset: [0, winSize.height/2]
    @backgroundNode.addChild @spacedust2, z: 0, parallaxRatio: dustSpeed, positionOffset: [@spacedust1.contentSize.width, winSize.height/2]
    @backgroundNode.addChild @galaxy, z: -1, parallaxRatio: bgSpeed, positionOffset: [0,winSize.height * 0.7]
    @backgroundNode.addChild @planetsunrise, z:-1, parallaxRatio: bgSpeed, positionOffset: [600,winSize.height * 0]
    @backgroundNode.addChild @spacialanomaly, z:-1, parallaxRatio: bgSpeed, positionOffset: [900,winSize.height * 0.3]
    @backgroundNode.addChild @spacialanomaly2, z:-1, parallaxRatio: bgSpeed, positionOffset: [1500,winSize.height * 0.9]
    # scheduleUpdate # "schedule 'update:'" also crashes mysteriously
    schedule 'update'
    self
  end
  
  def update #dt
    dt = 0.2
    backgroundScrollVel = [-1000, 0]
    mult = CGPoint.new(backgroundScrollVel[0] * dt, backgroundScrollVel[1] * dt)
    @backgroundNode.position = [@backgroundNode.position.x + mult.x, @backgroundNode.position.y + mult.y]
  end
  
end
