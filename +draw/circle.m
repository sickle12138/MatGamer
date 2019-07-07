function circle(x,y,r,color)
    switch nargin
        case 3
            rectangle('position',[x-r,y-r,r*2,r*2],'curvature',[1,1]);
        otherwise
            rectangle('position',[x-r,y-r,r*2,r*2],'curvature',[1,1],'edgecolor',color,'facecolor',color);
    end
end