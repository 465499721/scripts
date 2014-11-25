local Another = class("Another", function (  )
	return display.newScene("Another")
end)

function Another:ctor(  )
    function back(  )
    	local mainScene = require("app.scenes.MainScene").new()
    	CCDirector:sharedDirector():replaceScene(mainScene)
    end

	local item = ui.newImageMenuItem({image = "imageSelected.png", 
		imageSelected = "image.png", listener = back} )
	local menu = ui.newMenu({item})
	menu:setPosition(300, 400)
	self:addChild(menu)
end
return Another