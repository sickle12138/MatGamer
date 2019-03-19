function rightClick
py.win32api.mouse_event(py.win32con.MOUSEEVENTF_RIGHTDOWN, int32(0), int32(0), int32(0), int32(0))
py.win32api.mouse_event(py.win32con.MOUSEEVENTF_RIGHTUP, int32(0), int32(0), int32(0), int32(0))
end