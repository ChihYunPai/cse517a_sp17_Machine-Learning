load spiral
Cs=2.^[-1:8];
kpar_rbf=2.^[-4:4];
kpar_poly=[0:1:5];

% for i=1
%     [bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',Cs,kpar_rbf);
%     if i==1
%         bestC_best=bestC;
%         bestP_best=bestP;
%         bestval_best=bestval;
%         allerrs_best=allerrs;
%     else
%         if bestval < bestval_best
%             bestC_best=bestC;
%             bestP_best=bestP;
%             bestval_best=bestval;
%             allerrs_best=allerrs;
%         end
%     end
% end

%% for rbf
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',Cs,kpar_rbf);
figure(1)
[xx,yy]=meshgrid(kpar_rbf,Cs);
surf(xx,yy,allerrs);
xlabel('\gamma'); ylabel('C'); zlabel('Val Error');
figure(2)
svmclassify=trainsvm(xTr,yTr,Cs(bestC),'rbf',kpar_rbf(bestP));
testerr_rbf=sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
visdecision(xTe,yTe,svmclassify,'vismargin',true);
Cs(bestC)
kpar_rbf(bestP)
bestval

%% for poly
% 
% [bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'poly',Cs,kpar_poly);
% figure(3)
% [xx,yy]=meshgrid(kpar_poly,Cs);
% surf(xx,yy,allerrs);
% xlabel('\gamma'); ylabel('C'); zlabel('Val Error');
% figure(4)
% svmclassify=trainsvm(xTr,yTr,bestC,'poly',bestP);
% testerr_poly=sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
% visdecision(xTe,yTe,svmclassify,'vismargin',true);
% 
% bestC
% bestP
% bestval




