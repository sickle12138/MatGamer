function setMouse(x,y)
%x为到屏幕左边距离
%y为到屏幕顶部距离
import java.awt.Robot;
mouse = Robot;
mouse.mouseMove(x,y);
end