classdef (Sealed) each
    %EACH
    % helper function for iterating all elements of a cell array (one-by-one):
    % >> for x = each({1, 2, [3 4]})
    % ... yields x=1, x=2 and x=[3,4]
    % >> for x = each({'a', 'b'; 'c', 'd'})
    % ... this has size 2x2 loop will have 1x4 entries during iter

    properties (Access=private)
        content
    end
    
    methods (Access = public)
        function this = each(content)
            assert(iscell(content))
            this.content = content;
        end
        
        function varargout = size(this)
            % MATLAB invokes this before each iteration with for-loops, we must manipulate the
            % size to be 1 x prod(size)
            varargout = {1 numel(this.content)};
            if 1 == nargout, varargout = {[varargout{:}]}; end
        end
        
        function col = subsref(this, subs)
            % we support only the type of subscript that the for-loop uses: 'this(:, <i>)'
            assert( ...
                isscalar(subs) && strcmp(subs.type, '()') && ...
                numel(subs.subs) == 2 && ...
                strcmp(subs.subs{1}, ':') && isnumeric(subs.subs{2}) && ...
                isscalar(subs.subs{2}), ...
                'illegal iterator subscript'...
                );
            col = this.content{subs.subs{2}};
        end
    end
end
