-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	display.setStatusBar( display.HiddenStatusBar )
	
	-------Set up green buttons
	local greenButton3=display.newImageRect("images/green-unclicked.png", 520,60)
	greenButton3.x=display.contentCenterX
	greenButton3.y=(970)
	greenButton3.button = 1
	local greenButton2=display.newImageRect("images/green-unclicked.png", 520,60)
	greenButton2.x=display.contentCenterX
	greenButton2.y=(870)
	greenButton2.button = 2
	local greenButton1=display.newImageRect("images/green-unclicked.png", 520,60)
	greenButton1.x=display.contentCenterX
	greenButton1.y=(770)
	greenButton1.button = 3
	--------SET UP RED BUTTONS
	local redButton1=display.newImageRect("images/red-dim.png",520,60)
	redButton1.x=display.contentCenterX
	redButton1.y=(40)
	local redButton2=display.newImageRect("images/red-dim.png",520,60)
	redButton2.x=display.contentCenterX
	redButton2.y=(140) 

	local redButton3=display.newImageRect("images/red-dim.png",520,60)
	redButton3.x=display.contentCenterX
	redButton3.y=(240)

	---------------TEXT
	---Questions
	local question1green=display.newText("How are you feeling?", 0,0,native.systemFontBold, 40)
	question1green.x=display.contentCenterX
	question1green.y=(705)
	
	local question1red=display.newText("The other person is feeling...", 0,0,native.systemFontBold, 40)
	question1red.x=display.contentCenterX
	question1red.y=(300)
	question1red.rotation = 180
	---Answers
	--Green
	local answer1green=display.newText("Sad",0,0,native.systemFontBold, 40)
	answer1green.x=display.contentCenterX
	answer1green.y=(773)
	
	local answer2green=display.newText("Angry",0,0,native.systemFontBold, 40)
	answer2green.x=display.contentCenterX
	answer2green.y=(870)
	
	local answer3green=display.newText("I don't know",0,0,native.systemFontBold, 40)
	answer3green.x=display.contentCenterX
	answer3green.y=(973)

	--Red
	local answer1red=display.newText("Sad",0,0,native.systemFontBold, 40)
	answer1red.x=display.contentCenterX
	answer1red.y=(238)
	answer1red.rotation = 180
	
	local answer2red=display.newText("Angry",0,0,native.systemFontBold, 40)
	answer2red.x=display.contentCenterX
	answer2red.y=(141)
	answer2red.rotation = 180
	
	local answer3red=display.newText("Confused",0,0,native.systemFontBold, 40)
	answer3red.x=display.contentCenterX
	answer3red.y=(38)
	answer3red.rotation = 180
	
	--------CREATE EMPTY BODY OUTLINE
	local bodyOutline=display.newImageRect("images/bodyoutline.png", 380,560)
	bodyOutline.x=display.contentCenterX 
	bodyOutline.y=display.contentCenterY-10
	bodyOutline.rotation = 270
	
	--------move text to front after new buttons are created
	function moveTextToFront (event)
		answer1green:toFront()
		answer2green:toFront()
		answer3green:toFront()
		answer1red:toFront()
		answer2red:toFront()
		answer3red:toFront()
	end
	
	------------------------------------------------------------
		--When the Buttons are Clicked
	------------------------------------------------------------
	
	local function buttonClicked (event)
		print("here")
		--[[function destroyAll (event)
			greenButton1:removeSelf()
			greenButton1 = nil
			greenButton2:removeSelf()
			greenButton2 = nil
			greenButton3:removeSelf()
			greenButton3 = nil
			redButton1:removeSelf()
			redButton1 = nil
			redButton2:removeSelf()
			redButton2 = nil
			redButton3:removeSelf()
			redButton3 = nil
			print("destroyed")
			
			question1green:removeSelf()
			question1green = nil
			question1red:removeSelf()
			question1red = nil
			answer1green:removeSelf()
			answer1green = nil
			answer2green:removeSelf()
			answer2green = nil
			answer3green:removeSelf()
			answer3green = nil
			answer1red:removeSelf()
			answer1red = nil
			answer2red:removeSelf()
			answer2red = nil
			answer3red:removeSelf()
			answer3red = nil
			--]]
		--end
		--destroyAll()
		------------------------------------------------------------
		--Start of Results Creation (SETUP)
		------------------------------------------------------------
		function createGray1 (event)
			local gray1=display.newImageRect("images/grayRSU.png",520,60)
			gray1.x=display.contentCenterX
			gray1.y=(970)
		end
		
		function createGray2 (event)
			local gray2=display.newImageRect("images/grayRSU.png",520,60)
			gray2.x=display.contentCenterX
			gray2.y=(870)
		end
		
		function createGray3 (event)
			local gray3=display.newImageRect("images/grayRSU.png",520,60)
			gray3.x=display.contentCenterX
			gray3.y=(770)
		end
		
		function createGray4 (event)
			local gray4=display.newImageRect("images/grayUD.png",520,60)
			gray4.x=display.contentCenterX
			gray4.y=(240)
		end
		
		function createGray5 (event)
			local gray5=display.newImageRect("images/grayUD.png",520,60)
			gray5.x=display.contentCenterX
			gray5.y=(140)
		end
		
		function createGray6 (event)
			local gray6=display.newImageRect("images/grayUD.png",520,60)
			gray6.x=display.contentCenterX
			gray6.y=(40)
		end
		
		function firstClicked (event)
			local greenClicked1=display.newImageRect("images/green-clicked.png",520,60)
			greenClicked1.x=display.contentCenterX
			greenClicked1.y=(970)
			
			local redClicked1=display.newImageRect("images/red-clicked.png",520,60)
			redClicked1.x=display.contentCenterX
			redClicked1.y=(240)
		end
		
		function secondClicked (event)
			local greenClicked2=display.newImageRect("images/green-clicked.png",520,60)
			greenClicked2.x=display.contentCenterX
			greenClicked2.y=(870)
			
			local redClicked2=display.newImageRect("images/red-clicked.png",520,60)
			redClicked2.x=display.contentCenterX
			redClicked2.y=(140)
		end
		
		function thirdClicked (event)
			local greenClicked3=display.newImageRect("images/green-clicked.png",520,60)
			greenClicked3.x=display.contentCenterX
			greenClicked3.y=(770)
			
			local redClicked3=display.newImageRect("images/red-clicked.png",520,60)
			redClicked3.x=display.contentCenterX
			redClicked3.y=(40)
		end
		------------------------------------------------------------
		--End of Results Creation (SETUP)
		------------------------------------------------------------
		local function sceneDone (event)
			composer.gotoScene("secondscene")
		end
			-------------------------
			--transition to next scene IN THIS FUNCTION
		if (event.target.button == 1) then
			greenButton1:removeSelf()
			greenButton1 = nil
			greenButton2:removeSelf()
			greenButton2 = nil
			greenButton3:removeSelf()
			greenButton3 = nil
			redButton1:removeSelf()
			redButton1 = nil
			redButton2:removeSelf()
			redButton2 = nil
			redButton3:removeSelf()
			redButton3 = nil
			firstClicked()
			createGray2()
			createGray3()
			createGray5()
			createGray6()
			moveTextToFront()
			sceneDone()
			--composer.removeScene("firstscene")
			
		end
		if (event.target.button == 2) then
			greenButton1:removeSelf()
			greenButton1 = nil
			greenButton2:removeSelf()
			greenButton2 = nil
			greenButton3:removeSelf()
			greenButton3 = nil
			redButton1:removeSelf()
			redButton1 = nil
			redButton2:removeSelf()
			redButton2 = nil
			redButton3:removeSelf()
			redButton3 = nil
			secondClicked()
			createGray1()
			createGray3()
			createGray4()
			createGray6()
			moveTextToFront()
			sceneDone()
			--composer.removeScene("firstscene")
		end
		if (event.target.button == 3) then
			greenButton1:removeSelf()
			greenButton1 = nil
			greenButton2:removeSelf()
			greenButton2 = nil
			greenButton3:removeSelf()
			greenButton3 = nil
			redButton1:removeSelf()
			redButton1 = nil
			redButton2:removeSelf()
			redButton2 = nil
			redButton3:removeSelf()
			redButton3 = nil
			thirdClicked()
			createGray1()
			createGray2()
			createGray4()
			createGray5()
			moveTextToFront()
			sceneDone()
			--composer.removeScene("firstscene")
		end
	end

	greenButton1:addEventListener("touch", buttonClicked)
	greenButton2:addEventListener("touch", buttonClicked)
	greenButton3:addEventListener("touch", buttonClicked)
end --end of images and stuff

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene