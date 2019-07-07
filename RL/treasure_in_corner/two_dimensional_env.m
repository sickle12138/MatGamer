classdef two_dimensional_env
    %二维宝藏环境类
    properties
        weight
        height
        actions
        fresh_time
        fig
        agent
        observation
        reward
        done
        info
        max_episodes
        step_counter
    end
    % 上面是外部可操作的属性
    % 下面是内部可操作的属性
    properties (SetAccess = private)
      weight_
      height_
      fresh_time_
      fig_
      target=[3,3]
      trap=[2,3;3,2]
   end
    % 在methods中是外部可调用的方法
    methods
        function self = two_dimensional_env(weight,height,fresh_time)
            % 新建类时候初始化
            switch nargin
                case 1
                    self.weight=weight;
                    self.height=weight;
                    self.fresh_time=0.05;
                case 2
                    self.weight=weight;
                    self.height=height;
                    self.fresh_time=0.05;
                case 3
                    self.weight=weight;
                    self.height=height;
                    self.fresh_time=fresh_time;
                otherwise
                    error('缺少参数');
            end
            self.max_episodes=100;
            self.step_counter=0;
            self.actions=[1 2 3 4];
            self.agent=[1 1];
            self.observation=self.agent;
            self.reward=0;
            self.done=0;
            self.info=0;
            h=figure;
            self.fig = h.Number;
            self.weight_=self.weight;
            self.height_=self.height;
            self.fresh_time_=self.fresh_time;
            self.fig_=self.fig;
        end
        
        function render(self)
            % 绘制图像
            pause(self.fresh_time)
            h=figure(self.fig);
            ax = axes('Parent',h);
            ax.YAxis.Visible = 'off';
            ax.XAxis.Visible = 'off';
            for i=1:self.weight
                for j=1:self.weight
                    draw.rect(i*10,j*10,10);
                    if all([i,j]==self.agent)
                        draw.circle(i*10,j*10,2,'r');
                    end
                    if all([i,j]==self.target)
                        draw.circle(i*10,j*10,4);
                    end
                    if any(all([i,j]==self.trap,2))
                        draw.circle(i*10,j*10,4,'k');
                    end
                end
            end
            axis(ax, 'equal')
        end
        function self = step(self,action)
            % 一步动作
            self.done = 0;
            self.reward=0;
            temp_w=self.agent(1);
            temp_h=self.agent(2);
            if action == 1
                temp_w = self.agent(1)-1;
            end
            if action == 2
                temp_w = self.agent(1)+1;
            end
            if action == 3
                temp_h = self.agent(2)-1;
            end
            if action == 4
                temp_h = self.agent(2)+1;
            end
            if temp_w < 1
                temp_w=1;
                self.reward=-1;
            end
            if temp_h < 1
                temp_h=1;
                self.reward=-1;
            end
            if temp_w > self.weight
                temp_w=self.weight;
                self.reward=-1;
            end
            if temp_h > self.height
                temp_h=self.height;
                self.reward=-1;
            end
            if all([temp_w,temp_h]==self.target)
                self.done = 1;
                self.reward=1;
            end
            if any(all([temp_w,temp_h]==self.trap,2))
                self.done = 1;
                self.reward=-1;
            end
            self.observation=[temp_w,temp_h];
            self.info=0;
        end
        function self=reset(self)
            % 重置环境
            self.weight=self.weight_;
            self.height=self.height_;
            self.fresh_time=self.fresh_time_;
            self.fig=self.fig_;
            self.actions=[1 2];
            self.step_counter=0;
            self.agent=[1 1];
            self.observation=self.agent;
            self.reward=0;
            self.done=0;
            self.info=0;
        end
    end
end

