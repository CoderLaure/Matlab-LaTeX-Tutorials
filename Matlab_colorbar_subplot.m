% CODE by Laure Lemrich, Nov 2017 at ETH Zurich
%
% This code lets you put one colorbar on the right of a 2x2 subplot set
% 
% Matlab makes it really hard to move a colorbar around when subplots are
% concerned. This example shows you how to set a unique colorbar on the
% right. 
% 1. Replace first part with your figure. Make sure you use the same color
% range
% 2. Update values in the second part so everything fits nicely
% 3. Uncomment print commands to save figures

figure;
hold all

% Plot your 4 figures -----------------------------------------------------
% HERE: Replace with your four figures (no need to use a loop here)

colorbarrange = [0 500];
for loopn = 1:4
    subplot(2,2,loopn)
    dat1 = 2*repmat(1:100,50,1)+loopn*50*rand(50,100);
    s = surf(dat1);
    s.LineStyle = 'none';
    xlabel('x legend')
    ylabel('y legend')
    axis tight
    view(2)
    caxis(colorbarrange)
end

% Create the colorbar
h = colorbar;
h.Label.String = 'value (m)';
h.Limits = colorbarrange;

% -------------------------------------------------------------------------
% HERE: adjust with parameters until everything fits
hfig = gcf;
axes = hfig.Children(isgraphics(hfig.Children,'axes'));
% Dimensions of all the elements
% Figures length
figlength_x = 0.27;
figlength_y = 0.3;
%X axis position of fig 1, fig 2, colorbar, axis length is (0,1)
fig1_x = axes(2).Position(1);
fig2_x = fig1_x+figlength_x+0.1;
clb_x = fig2_x+figlength_x+0.05;

%Y axis position of figures (from bottom !)
fig1_y = axes(2).Position(2)+0.1;
fig2_y = fig1_y+figlength_y+0.15;

% Move all elements to their position -------------------------------------
hfig = gcf;
% Move and adjust colorbar
h = hfig.Children(isgraphics(hfig.Children,'Colorbar'));
h.Position(1) = clb_x;
h.Position(2) = fig1_y;
h.Position(4) = fig2_y-fig1_y+figlength_y;

% Move all figures
axes = hfig.Children(isgraphics(hfig.Children,'axes'));
axes(4).Position = [fig1_x fig2_y figlength_x figlength_y]; % top left
axes(3).Position = [fig2_x fig2_y figlength_x figlength_y]; % top right
axes(2).Position = [fig1_x fig1_y figlength_x figlength_y]; % bottom left
axes(1).Position = [fig2_x fig1_y figlength_x figlength_y]; % bottom right

% Formatting & saving your figure to a file -------------------------------
% Parameters for your figure ----------------------------------------------
figurewidth = 18; % cm
fontsize = 14.5;
figureheightratio = 0.8;
%- Homogeneize
hfig = gcf;
set(findall(hfig,'-property','FontSize'),'FontSize',fontsize)
set(findall(hfig,'-property','FontWeight'),'FontWeight','normal') %no bold
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex')
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(findall(hfig,'-property','Box'),'Box','off')

% needed
h = hfig.Children(isgraphics(hfig.Children,'Colorbar'));
h.Label.Interpreter = 'latex';

%- Set figure dimensions
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','Units','centimeters');
hfig.Position = [3 3 figurewidth figureheightratio*figurewidth];
hfig.PaperSize = [hfig.Position(3) hfig.Position(4)];

%- Print
filename = 'colorbarfigure';
%print(hfig,filename,'-dpdf','-painters','-fillpage')% '-bestfit'
%print(hfig,filename,'-djpeg')
 


