%% 
% particle
filestat1 = dir('0.out.dpa');
npart = filestat1.bytes/48;
fid1 = fopen('0.out.dpa');
a = fread(fid1,[npart,6],'double');
plot(a(:,2),a(:,1),'.',...
     'MarkerSize',1)

%std(a(:,1))/mean(a(:,1))*100

%% 
% field pattern

ncar = 301;dgrid=10e-6;
fid2 = fopen('./rad.out.dfl');
tmpa = fread(fid2,'double');
realpart = tmpa(1:2:end);
imagpart = tmpa(2:2:end);
fldinten = reshape(realpart.^2+imagpart.^2,ncar,ncar);
[x,y]=meshgrid((1-ncar)/2:(ncar-1)/2,(1-ncar)/2:(ncar-1)/2);
figure(4);
deltxy = 2*dgrid/(ncar-1);
contourf(x*deltxy*1e6,y*deltxy*1e6,fldinten,100)
shading flat
colorbar
xlim([-2,2])
ylim([-2,2])
% caxis([0,6e4])
xlabel('$y\,\mathrm{[\mu m]}$','Interpreter','LaTeX',...
		'FontSize',12,'FontName','Times New Roman',...
		'FontWeight','b','Color','black')
ylabel('$x\,\mathrm{[\mu m]}$','Interpreter','LaTeX',...
		'FontSize',12,'FontName','Times New Roman',...
		'FontWeight','b','Color','black')
fclose(fid2);

%%
title(strcat('P_{out}/P_0=',num2str(sum(sum(fldinten))/10e6),' [2k,10,0.1,1%]'))

%%
ncar  = 151;
dgird = 4e-6;
xlamd = 10e-6;
% filename = './TLM/rad.out.fld';
filename = '/home/tong/test/test/template.out.fld';
filestat2 = dir(filename);
fid3 = fopen(filename);
alldata = fread(fid3,'double');
totalstep = filestat2.bytes/ncar/ncar/16;
fldi = reshape(alldata,[ncar*ncar*2,totalstep]);
powerz = zeros(totalstep,2);
%maxfld = 3.0381e+04;
%maxfldTGU = 4.3504e+03;
%maxfldNorm = 5.8622e+03;
[x1,y1]=meshgrid((1-ncar)/2:(ncar-1)/2,(1-ncar)/2:(ncar-1)/2);
deltxy1 = 2*dgird/(ncar-1);
M(1:totalstep) = struct('cdata',[],'colormap',[]);
for i = 1:1:totalstep
    istep = i;
    tmpb  = reshape(fldi(:,istep),ncar*ncar,2);
    realpart1 = tmpb(:,1);
    imagpart1 = tmpb(:,2);
    fldinten1 = reshape(realpart1.^2+imagpart1.^2,ncar,ncar);
%      if maxfld < max(max(fldinten1))
%         maxfld = max(max(fldinten1));
%      end
    figure(5);
    f1=subplot(2,1,2);
    contourf(x1*deltxy1*1e6,y1*deltxy1*1e6,fldinten1,100)
    shading flat
    colorbar
    xlabel('x [\mum]')
    ylabel('y [\mum]')
    %caxis([0,1])
    f1p = get(f1,'position');
    f1p(4) = f1p(4)*1.25;
    set(f1,'position',f1p)
    
    f2=subplot(2,1,1);
    plot(powerz(1:i-1,1),powerz(1:i-1,2),'r-','LineWidth',2);
    xlabel('z [m]')
    ylabel('FEL power [W]')
    xlim([0,005])
    %ylim([10e6,20e6])
    f2p = get(f2,'position');
    f2p(2) = f2p(2)*1.07;
    f2p(3) = f2p(3)*0.84;
    f2p(4) = f2p(4)*0.85;
    set(f2,'position',f2p)
    
    M(i) = getframe(gcf);
    powerz(i,:) = [(i-1)*xlamd,sum(sum(fldinten1))];
end
fclose(fid3);

%%
movie2avi(M,'NOTGU_TM_SIOM.avi','quality',50,'fps',30)