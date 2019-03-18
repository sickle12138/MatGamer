function rightClick
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
mouse.mousePress(InputEvent.BUTTON3_MASK);
mouse.mouseRelease(InputEvent.BUTTON3_MASK);
end