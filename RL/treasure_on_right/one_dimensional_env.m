classdef one_dimensional_env
    %һά���ػ�����
    properties
        len
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
    % �������ⲿ�ɲ���������
    % �������ڲ��ɲ���������
    properties (SetAccess = private)
      len_
      fresh_time_
      fig_
   end
    % ��methods�����ⲿ�ɵ��õķ���
    methods
        function self = one_dimensional_env(len,fresh_time)
            % �½���ʱ���ʼ��
            switch nargin
                case 1
                    self.len=len;
                    self.fresh_time=0.05;
                case 2
                    self.len=len;
                    self.fresh_time=fresh_time;
                otherwise
                    error('ȱ�ٲ���');
            end
            self.max_episodes=13;
            self.step_counter=0;
            self.actions=[1 2];
            self.agent=1;
            self.observation=self.agent;
            self.reward=0;
            self.done=0;
            self.info=0;
            h=figure;
            self.fig = h.Number;
            self.len_=self.len;
            self.fresh_time_=self.fresh_time;
            self.fig_=self.fig;
        end
        
        function render(self)
            % ����ͼ��
            pause(self.fresh_time)
            h=figure(self.fig);
            ax = axes('Parent',h);
            ax.YAxis.Visible = 'off';
            ax.XAxis.Visible = 'off';
            for i=1:self.len
                draw.rect(i*10,50,10);
                if i==self.agent
                    draw.circle(i*10,50,2,'r');
                end
            end
            draw.circle(i*10,50,4,'b');
            axis(ax, 'equal')
        end
        function self = step(self,action)
            % һ������
            self.done = 0;
            if action == 1
                temp = self.agent-1;
            end
            if action == 2
                temp = self.agent+1;
            end
            if temp <= 1
                temp=1;
            end
            if temp >= self.len
                temp=self.len;
            end
            if temp == self.len
                self.done = 1;
            end
            self.observation=temp;
            self.reward=self.done;
            self.info=0;
        end
        function self=reset(self)
            % ���û���
            self.len=self.len_;
            self.fresh_time=self.fresh_time_;
            self.fig=self.fig_;
            self.actions=[1 2];
            self.step_counter=0;
            self.agent=1;
            self.observation=self.agent;
            self.reward=0;
            self.done=0;
            self.info=0;
        end
    end
end

