
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    
	local arr = CCArray:create()
    local str = cc.String:create("test")
    local str2 = CCString:create("test2")
    arr:addObject(str)
    arr:addObject(str2)
    --print(arr:count())
     local s1 = arr:objectAtIndex(0)
     local s2 = arr:objectAtIndex(1)
     tolua:cast(s1, "CCString")
     tolua:cast(s2, "CCString")
     --print(s1:getCString())

    ui.newTTFLabel({text = "Hello, World", size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy)
        :addTo(self)
    ui.newTTFLabel({text = "Test Label", size = 64, color = ccc3(0, 0, 255),
        align = ui.TEXT_VALIGN_TOP}) 
        :addTo(self, 3, 3)
        :pos(300, 200)

    local label = CCLabelTTF:create("label","Arial", 24)
    label:setPosition(ccp(80, 80))
    self:addChild(label)

    local label2 = CCLabelTTF:create("label2", "Arial", 45);
    label2:setPosition(ccp(100, 100))
    self:addChild(label2)

    function changeScene()
      local s = require("app.scenes.Another").new()
      CCDirector:sharedDirector():replaceScene(s)
    end

    
    local item = ui.newImageMenuItem({image = "image.png", 
        imageSelected = "imageSelected.png",
        listener = changeScene})
    local menu = ui.newMenu({item}) : pos(300, 800)
    self:addChild(menu)
    function createLayer(  )
      local layer = CCLayer:create()

      local menuItem = CCMenuItemImage:create("image.png", "image.png")
          menuItem:setPosition(0, 0)
         -- menuItem:registerScriptTapHandler(changeScene)
        menuItem:addNodeEventListener(cc.NODE_EVENT, changeScene, 1)
      local menu1 = CCMenu:createWithItem(menuItem)
          menu1:setPosition(300, 600)
          menu1:setVisible(true)
      layer:addChild(menu1) 
      return layer
    end
    self:addChild(createLayer())
end



function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
