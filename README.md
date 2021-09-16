# EC311project2020fall


## a. Project name
Pong Game

## b. Team members
Yihe Bi

Qintian Huang

Zhengyi Yang

Nengneng Yu


## c. Link to project demo video
https://drive.google.com/file/d/1k0zd7tGIaJYuk6LLiVsHpkQum4EXyPa8/view?usp=sharing

## d. Overview of the project / Explanation of all functionalities
The project is a VGA pong game. The green block is moving in the screen, and will bounce if it goes to the upper/left/right boundary of the screen. If it goes to the lower boundary, the game ends. The user can move the red bar at the bottom horizontally to catch the green block to prevent it from going to the lower boundary. The red block is controlled by using keyboard, key A and D. 

Before the game starts, "GO" is displayed on the screen and the green block is moving horizontally. At this time, the 7-segment display is showing the difficulty of the game. 

There are totally 3 levels of difficulty. Before and after the game starts, there are 3 LEDs showing the difficulty level. H17 is level 1, K15 is level 2, J13 is level 3. The higher the level is, the speed of the block is higher.

The total time of 1 game is 30s. After the game starts, the right 2 bits of the 7-segment display will count down from 30 to 0. If the time is up, the game ends automatically (the block will disappear), and "GO" will be on the screen.

The game can be paused at any time. When it is paused, the green block is moving horizontally in the screen. And the 7-segment display count down will also pause. 

The program calculates the angle of reflection when the block goes to the red bar at the bottom, so that the user can control where the green block goes. If the block goes to the red bar at the top of the screen, there will be bonus points. The longer time that the green block overlaps with the red bar, the more bonus points the user will get. The bonus points will be shown on the 7-segment display (the 2 bits on the left).

Situation 1: the red bar is not moving. When the green block bounces at the red bar, the incidence angle is the same as the reflection angle.

Situation 2: the red bar is moving in the opposite direction of the green bar (horizontally) when they bounce. The horizontal speed of the green block will increase, and therefore the angle of the reflection angle decreases. The angle can decrease 5 times for maximum.

Situation 3: the red bar is moving in the same direction of the green bar (horizontally) when they bounce. The horizontal speed of the green block will decrease, and therefore the angle of the reflection angle increases. If the speed is already the slowest, it will not decrease again.

If the use fails to catch the green block/the green block goes to the lower boundary of the screen, it means game over. The green block will disappear and "DIE" will be on the screen.

## e. How to run the project
[Please Note] Due to clock settings, the button should be hold for up to approximately 1s before the value changes. The value does not change immediately after the press.
To start/pause the game, press button N17.

To move the red bar at the bottom, use key A (go left) and D (go right) on a USB keyboard.

To adjust the difficulty, press button M17. It goes from 1 to 2 to 3, and then goes back to 1. This can be adjusted before the game starts and during the game.
To restart, press button P17. 

To restart, press button P17. This can be done at any time whether the game ends or not.

## f. Overview of the code structure
[Combine.v] The top module. It combines every lower-level modules and controls the inputs and the outputs. It also decides what is shown on the 7-segment display (the difficulty before the game starts, and the timing+bonus when the game is in process).

[CLK1HZ.v] Divides the clock to 1Hz.

[GenerSequen.v] Finite state machine to adjust the difficulty by button press.

[Gst.v] Finite state machine to start/pause the game by button press.

[Start.v] Testing weather the game is in process not.

[vga.v] The main module of the VGA display. It generates all the patterns of the items will be displayed on the screen, and decides when to show what (e.g. before the game starts, "GO" will be shown; in the gaming process, "GO" is not shown). It also calculates the speed/direction of the green block and the red bar at the bottom.

[keyboard-driver.v] Detects the input of the keyboard and outputs the result of whether the use is pressing A, or D, or nothing.

[clock_divider.v] Divides the clock to 25MHz.

[h_counter.v and v_counter.v] Horizontal and vertical counters for VGA display.

[displaydiff.v] A module works for displaying difficulty of the game on 7-segment display before the game starts.

[top.v] The top module for the timing part. There are some redundant functions in the modules that are not used in the game because it is modified from what we have for lab 4.

[clock1.v] Divides the clock to 1Hz and show a 30 second countdown on 7-segment display.

[bin_dec1.v] Converting binary numbers to decimal numbers that is used for 7-segment display.

[led.v] The 7-segment display module. There are some redundant functions in this module.

[alarm.v and alarm_power.v] These two modules are not used basically.


## g. Other
When pressing the buttons, please hold up to approximately 1 second until the speed/7-segment display/led changes. The values do not change immediately after the button is pressed. The reason for this is that the frequency of the clock is 1Hz in the button press detection modules. 
