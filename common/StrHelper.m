classdef StrHelper
    methods(Static)
        function str = index(index,num)
        % 返回一定位数序列数字
            str = num2str(index);
            while num > length(str)
                str = strcat('0',str);
            end
        end
        
        function str = rand(num)
        % 返回一定位数随机数字
            str = num2str(round((10^num-10^(num-1)-1)*rand)+10^(num-1));
        end
        
        function str = arr2str(arr)
        % 返回一定位数随机数字
            str = '';
            for i=1:length(arr)
                str = [str '_' num2str(arr(i))];
            end
            str = str(2:end);
        end
        
        function str = date()
        % 返回年月日时分秒格式字符串
            str = char(datetime('now','TimeZone','local','Format','yMMddHHmmss'));
        end
    end
end