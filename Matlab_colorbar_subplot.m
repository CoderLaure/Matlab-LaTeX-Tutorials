% CODE by Laure Lemrich, Nov 2017 at ETH Zurich
% 
% This snippet gives you a set of commands to add after your figure to format
% it. You can adjust figure width and fontsize to more closely match your
% latex document (I do this by trial& error). Using \the\textwidth in LaTeX
% gives you page width in points. The package 'layouts' can convert it for
% you. 
% Example for LaTeX at the end. 
%
% Parameters for your figure ----------------------------------------------
figurewidth = 16; % cm
fontsize = 14.5;
figureheightratio = 0.6;

% Your figure (replace by what you want) ----------------------------------
figure;
x = linspace(0,3*pi,100);
plot(x,sin(x),'DisplayName','trial $$\gamma$$')
hold all
plot(x,0.9*sin(x+0.2*pi),'DisplayName','Second trial','LineWidth',1.3)
xlabel('Angle $$\theta$$')
ylabel('Amplitude $\Sigma$ (m)')
lg = legend('show');
lg.Location = 'best';
title('Parameter $$\sigma_{ij}$$')

ax = gca;
ax.XTick = [0 pi 2*pi 3*pi];
ax.XTickLabel = {'$$0$$','$$\pi$$','$$2\pi$$','$$3\pi$$'};

% Formatting & saving your figure to a file -------------------------------
%- Homogeneize
hfig = gcf;
set(findall(hfig,'-property','FontSize'),'FontSize',fontsize)
set(findall(hfig,'-property','FontWeight'),'FontWeight','normal') %no bold
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex')
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(findall(hfig,'-property','Box'),'Box','off')

%- Set figure dimensions
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','Units','centimeters');
hfig.Position = [3 3 figurewidth figureheightratio*figurewidth];
hfig.PaperSize = [hfig.Position(3) hfig.Position(4)];

%- Print
filename = 'my.figure';
filename = strrep(filename,'.','-'); % because print() doesn't support '.'
print(hfig,filename,'-dpdf','-painters','-fillpage')% '-bestfit'
%print(hfig,filename,'-djpeg')

% LaTeX -------------------------------------------------------------------
% 
% I use PdfLatex for my files, and add them as such:
% \usepackage{graphicx}
% ...
% \begin{figure}
% 	\includegraphics[width=1\columnwidth]{myfigure}
% 	\caption{Comment}%
% 	\label{figlabel} 
% \end{figure} 


% Get both LaTeX and powerpoint in one run -------------------------------- 
% 
% filename = 'myfigure';
% filename = strrep(filename,'.','-'); % print doesn't support '.'
% set(findall(hfig,'-property','FontSize'),'FontSize',fontsize)
% print(hfig,filename,'-dpdf','-painters','-fillpage')% '-bestfit' 
% set(findall(hfig,'-property','FontSize'),'FontSize',18)
% filename = strcat(filename,'_ppt');
% print(hfig,filename,'-djpeg') 

% Generic notes -----------------------------------------------------------
% 
% Passing everything in LaTeX interpreter switches all strings to the same
% font (~Times). 
% The label of the colorbar, if you have one, won't be in latex
% interpreter so you need to manually set it (in your figure): 
% 
% h = colorbar;
% h.Label.String = 'value (m$$^2$$)';
% h.Label.Interpreter = 'latex';






