function Rect = getWindowRect(class,name)
%����jar��
import com.sun.jna.platform.win32.User32;
import com.sun.jna.platform.win32.WinDef;
%��ȡ������
hwnd = User32.INSTANCE.FindWindow(class,name);
%�½�һ�����ζ���
rect = javaObject('com.sun.jna.platform.win32.WinDef$RECT');
%��ȡλ��
User32.INSTANCE.GetWindowRect(hwnd, rect);
width = rect.right - rect.left;
height = rect.bottom - rect.top;
Rect=[rect.left rect.top width height];
end