dummy=open('tav.mat');
dummy=dummy.tav;

s0=dummy(dummy(:,12)==0,:); %membrane
s1=dummy(dummy(:,12)==1,:); %cytoplasm
s2=dummy(dummy(:,12)==2,:); %periplasm
s3=dummy(dummy(:,12)==3,:); %ribosomal
s4=dummy(dummy(:,12)==4,:); %unknown
ttha=dummy(dummy(:,12)==5,:); % XIN'S PROTEINS
hah1=dummy(dummy(:,12)==6,:);
sod1=dummy(dummy(:,12)==7,:);
fsod=dummy(dummy(:,12)==8,:);

fig=figure(1);
clf
plot3(s1(:,1), s1(:,2), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,1), s2(:,2), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,1), s3(:,2), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,1), s4(:,2), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,1), s0(:,2), s0(:,9), 'yo', 'MarkerFaceColor', 'y') %M

plot3(ttha(:,1), ttha(:,2), ttha(:,9), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot3(hah1(:,1), hah1(:,2), hah1(:,9), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot3(sod1(:,1), sod1(:,2), sod1(:,9), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot3(fsod(:,1), fsod(:,2), fsod(:,9), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')

legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('ChargeDens')
ylabel('Dipole moment')
zlabel('MW / Da')
grid on
box on
%--------------------------------------------------- Hydrophobic residues and MW
fig2=figure(2);
clf
plot(s1(:,9), s1(:,6)./s1(:,10), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,9), s2(:,6)./s2(:,10), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,9), s3(:,6)./s3(:,10), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,9), s4(:,6)./s4(:,10), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,9), s0(:,6)./s0(:,10), 'yo', 'MarkerFaceColor', 'y') %M

plot(ttha(:,9), ttha(:,6)./ttha(:,10), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,9), hah1(:,6)./hah1(:,10), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,9), sod1(:,6)./sod1(:,10), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,9), fsod(:,6)./fsod(:,10), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')
xlabel('MW / Da')
ylabel('Frac. of fatty exposed')
grid on
box on


fig3=figure(3);
clf
plot(s1(:,9), s1(:,6), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,9), s2(:,6), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,9), s3(:,6), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,9), s4(:,6), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,9), s0(:,6), 'yo', 'MArkerFaceColor', 'y') %M

plot(ttha(:,9), ttha(:,6), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,9), hah1(:,6), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,9), sod1(:,6), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none')
plot(fsod(:,9), fsod(:,6), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('MW / Da')
ylabel('Total number of fatty residues exposed')
grid on
box on


fig4=figure(4);
clf
plot(s1(:,9), s1(:,10), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,9), s2(:,10), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,9), s3(:,10), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,9), s4(:,10), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,9), s0(:,10), 'yo', 'MArkerFaceColor', 'y') %M

plot(ttha(:,9), ttha(:,10), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,9), hah1(:,10), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,9), sod1(:,10), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,9), fsod(:,10), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('MW / Da')
ylabel('Total number of fatty residues')
grid on
box on

%---------------------------------------- Charge density and MW
fig5=figure(5);
clf
plot(s1(:,1), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,1), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,1), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,1), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,1), s0(:,9), 'yo', 'MArkerFaceColor', 'y') %M

plot(ttha(:,1), ttha(:,9), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,1), hah1(:,9), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,1), sod1(:,9), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,1), fsod(:,9), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

ylabel('MW / Da')
xlabel('Charge density / Angstroms ^ (-2)')
grid on
box on

%--------------------------------------- Dipole (Quadrupole) moment and MW and EFR/SASA
%fig6=figure(6);
%clf
%plot3(s1(:,6), s1(:,2), s1(:,1), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot3(s2(:,6), s2(:,2), s2(:,1), 'bo', 'MarkerFaceColor', 'b') %P
%plot3(s3(:,6), s3(:,2), s3(:,1), 'go', 'MarkerFaceColor', 'g') %R
%plot3(s4(:,6), s4(:,2), s4(:,1), 'ko', 'MarkerFaceColor', 'k') %U
%plot3(s0(:,6), s0(:,2), s0(:,1), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('EFR')
%ylabel('Dipole moment')
%zlabel('Charge Density')
%grid on
%box on

%fig7=figure(7);
%clf
%plot3(s1(:,6), s1(:,3), s1(:,1), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot3(s2(:,6), s2(:,3), s2(:,1), 'bo', 'MarkerFaceColor', 'b') %P
%plot3(s3(:,6), s3(:,3), s3(:,1), 'go', 'MarkerFaceColor', 'g') %R
%plot3(s4(:,6), s4(:,3), s4(:,1), 'ko', 'MarkerFaceColor', 'k') %U
%plot3(s0(:,6), s0(:,3), s0(:,1), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('EFR')
%ylabel('Quadrupole moment (Q1)')
%zlabel('Charge Density')
%grid on
%box on
%-------------------------------------- Dipole moment and Guy potential 
fig8=figure(8);
clf
plot(s1(:,2), s1(:,1), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,2), s2(:,1), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,2), s3(:,1), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,2), s4(:,1), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,2), s0(:,1), 'yo', 'MArkerFaceColor', 'y') %M

plot(ttha(:,2), ttha(:,1), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,2), hah1(:,1), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,2), sod1(:,1), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,2), fsod(:,1), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('Dipole moment')
ylabel('ChDens')
grid on
box on


%fig9=figure(9);
%clf
%plot3(s1(:,2), s1(:,1), s1(:,5), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot3(s2(:,2), s2(:,1), s2(:,5), 'bo', 'MarkerFaceColor', 'b') %P
%plot3(s3(:,2), s3(:,1), s3(:,5), 'go', 'MarkerFaceColor', 'g') %R
%plot3(s4(:,2), s4(:,1), s4(:,5), 'ko', 'MarkerFaceColor', 'k') %U
%plot3(s0(:,2), s0(:,1), s0(:,5), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('Dipole moment')
%ylabel('Charge density')
%zlabel('Guy density')
%grid on
%box on
%-------------------------------------- Abundance [log(copy_number)]
%fig10=figure(10);
%clf
%plot3(s1(:,4)./s1(:,7), s1(:,11), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot3(s2(:,4)./s2(:,7), s2(:,11), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
%plot3(s3(:,4)./s3(:,7), s3(:,11), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
%plot3(s4(:,4)./s4(:,7), s4(:,11), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
%plot3(s0(:,4)./s0(:,7), s0(:,11), s0(:,9), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('Guy potential')
%ylabel('log(copy_number)')
%zlabel('MW')
%grid on
%box on
%------------------------------------ Guy potential (hydrophillicity) and hydrophobicity
fig11=figure(11);
clf
plot(s1(:,6)./s1(:,7), s1(:,4)./s1(:,7), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,6)./s2(:,7), s2(:,4)./s2(:,7), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,6)./s3(:,7), s3(:,4)./s3(:,7), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,6)./s4(:,7), s4(:,4)./s4(:,7), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,6)./s0(:,7), s0(:,4)./s0(:,7), 'yo', 'MarkerFaceColor', 'y') %M

plot(ttha(:,6)./ttha(:,7), ttha(:,4)./ttha(:,7), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,6)./hah1(:,7), hah1(:,4)./hah1(:,7), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,6)./sod1(:,7), sod1(:,4)./sod1(:,7), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,6)./fsod(:,7), fsod(:,4)./fsod(:,7), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')

linmod=fitlm(dummy(:,6)./dummy(:,7), dummy(:,4)./dummy(:,7));
x=dummy(:,6)./dummy(:,7);
p=linmod.predict(x);
plot(x,p, '-b')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD', 'linear model')

xlabel('Hydrophobicity')
ylabel('Guy potential')
grid on
box on
%-------------------------------------- Hydrophillicity and hydrophobicity and DPM
fig12=figure(12);
clf
plot(s1(:,4)./s1(:,7), s1(:,2), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,4)./s2(:,7), s2(:,2), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,4)./s3(:,7), s3(:,2), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,4)./s4(:,7), s4(:,2), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,4)./s0(:,7), s0(:,2), 'yo', 'MarkerFaceColor', 'y') %M

plot(ttha(:,4)./ttha(:,7), ttha(:,2), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,4)./hah1(:,7), hah1(:,2), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,4)./sod1(:,7), sod1(:,2), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,4)./fsod(:,7), fsod(:,2), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('Guy hydrophillicity')
ylabel('DPM')
grid on
box on

fig13=figure(13);
clf
plot(s1(:,6)./s1(:,7), s1(:,2), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,6)./s2(:,7), s2(:,2), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,6)./s3(:,7), s3(:,2), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,6)./s4(:,7), s4(:,2), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,6)./s0(:,7), s0(:,2), 'yo', 'MarkerFaceColor', 'y') %M

plot(ttha(:,6)./ttha(:,7), ttha(:,2), 'Color', [1 0.4 0.6], 'Marker', 'd', 'MarkerFaceColor', [1 0.4 0.6], 'LineStyle', 'none') %pink
plot(hah1(:,6)./hah1(:,7), hah1(:,2), 'Color', [148,0,211]./255, 'Marker', 'd', 'MarkerFaceColor', [148,0,211]./255, 'LineStyle', 'none') %purple
plot(sod1(:,6)./sod1(:,7), sod1(:,2), 'Color', [0, 191, 255]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 255]./255, 'LineStyle', 'none') %deepblue
plot(fsod(:,6)./fsod(:,7), fsod(:,2), 'Color', [0, 191, 100]./255, 'Marker', 'd', 'MarkerFaceColor', [0, 191, 100]./255, 'LineStyle', 'none')
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane', 'TTHA', 'HAH1', 'NoLoops', 'FullSOD')

xlabel('Hydrophobicity')
ylabel('DPM')
grid on
box on
%-------------------------------- Hydrophillicity, hydrophobicity and QM1
%fig14=figure(14);
%clf
%plot(s1(:,4)./s1(:,7), s1(:,3), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot(s2(:,4)./s2(:,7), s2(:,3), 'bo', 'MarkerFaceColor', 'b') %P
%plot(s3(:,4)./s3(:,7), s3(:,3), 'go', 'MarkerFaceColor', 'g') %R
%plot(s4(:,4)./s4(:,7), s4(:,3), 'ko', 'MarkerFaceColor', 'k') %U
%plot(s0(:,4)./s0(:,7), s0(:,3), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('Guy hydrophillicity')
%ylabel('QM1')
%grid on
%box on

%fig15=figure(15);
%clf
%plot(s1(:,6)./s1(:,7), s1(:,3), 'ro', 'MarkerFaceColor', 'r') %C
%hold on
%plot(s2(:,6)./s2(:,7), s2(:,3), 'bo', 'MarkerFaceColor', 'b') %P
%plot(s3(:,6)./s3(:,7), s3(:,3), 'go', 'MarkerFaceColor', 'g') %R
%plot(s4(:,6)./s4(:,7), s4(:,3), 'ko', 'MarkerFaceColor', 'k') %U
%plot(s0(:,6)./s0(:,7), s0(:,3), 'yo', 'MarkerFaceColor', 'y') %M
%legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%xlabel('Hydrophobicity')
%ylabel('QM1')
%grid on
%box on
