%% Exercise Set 2.2 Problem 9.
% Numerical Analysis by R.L. Burden
% Author: Golnoosh Morshedi
% 9th Edition Page 65. 
% f(x) = x^2-3.
% Fixed-Point Iteration to approximate (3)^0.5
% Error bound <1e-4
%-------------------------------------------------------------------------
function FPI9()
clear
clc
    x=0:0.01:6;         % pick an interval for input variable.
    figure()            % Open new figure
    plot(x,f(x))        % plot f(x)
    hold on
    xx=3^(1/2);
    plot(xx,f(xx),'r*','Linewidth',2)
    grid on             % Show grid lines
    grid minor
    % Making Title for figure
    title('f(x)');xlabel('x');ylabel('f(x)')
    ylim([-4,4])
    % Ploting y=x and g(x) in new figure
    figure()
    y=x;
    plot(x,y,'b','Linewidth',2) 
    title('Fixed-Point Iteration for squar root of 3')
    xlabel('Input Variable (X)')
    grid on ; grid minor
    hold on
    plot(x,g(x),'r','Linewidth',2)
    legend('y=x','g(x)')
    ylim([0,4])
    %Initial Condition
    x0=0.5;
    x1=g(x0);
    iter=0;
    while abs(x1-x0)>1e-4
        % Plot a first point and its projection on both y=x & g(x)
        plot([x0 x0],[x0 g(x0)],'k')
        plot([x0 x1],[x0 g(x1)],'k--')
        % We can use pause command to see steps of convergence.
        %pause
        x0=x1;
        x1=g(x0);
        iter=iter+1;
    end
fprintf('Approximation of square root of 3 after %d Iteration is: %.10g\n',iter,x1) 
% Declare f(x)
function out=f(x)
out=(x.^2)-3;
% Translating f(x) in the form of x=g(x)
%Declare g(x)
function out=g(x)
out=0.5.*(x+(3./x));
