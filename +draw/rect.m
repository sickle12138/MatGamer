function rect(x,y,a,b,color)
    switch nargin
        case 3
            rectangle('position',[x-a/2,y-a/2,a,a]);
        case 4
            rectangle('position',[x-a/2,y-b/2,a,b]);
        otherwise
            rectangle('position',[x-a/2,y-b/2,a,b],'edgecolor',color,'facecolor',color);
    end
end