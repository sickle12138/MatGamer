function leftClick
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);
end