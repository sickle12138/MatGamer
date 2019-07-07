function text(x,y,s,l,color)
    switch nargin
        case 4
             text(x,y,s,'FontSize',l,'HorizontalAlignment','center')
        otherwise
             text(x,y,s,'FontSize',l,'Color',color,'HorizontalAlignment','center')
    end
end