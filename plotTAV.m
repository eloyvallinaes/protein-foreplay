dummy=open('tav.mat');
dummy=dummy.tav;

s0=dummy(dummy(:,11)==0,:); %membrane
s1=dummy(dummy(:,11)==1,:); %cytoplasm
s2=dummy(dummy(:,11)==2,:); %periplasm
s3=dummy(dummy(:,11)==3,:); %ribosomal
s4=dummy(dummy(:,11)==4,:); %unknown

fig=figure(1);
clf
plot3(s1(:,1), s1(:,2), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,1), s2(:,2), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,1), s3(:,2), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,1), s4(:,2), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,1), s0(:,2), s0(:,9), 'yo', 'MarkerFaceColor', 'y') %M
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
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
plot(s0(:,9), s0(:,6)./s0(:,10), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('MW / Da')
ylabel('Frac. of fatty exposed')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')

fig3=figure(3);
clf
plot(s1(:,9), s1(:,6), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,9), s2(:,6), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,9), s3(:,6), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,9), s4(:,6), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,9), s0(:,6), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('MW / Da')
ylabel('Total number of fatty residues exposed')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')

fig4=figure(4);
clf
plot(s1(:,9), s1(:,10), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,9), s2(:,10), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,9), s3(:,10), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,9), s4(:,10), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,9), s0(:,10), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('MW / Da')
ylabel('Total number of fatty residues')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%---------------------------------------- Charge density and MW
fig5=figure(5);
clf
plot(s1(:,1), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,1), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,1), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,1), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,1), s0(:,9), 'yo', 'MArkerFaceColor', 'y') %M
ylabel('MW / Da')
xlabel('Charge density / Angstroms ^ (-2)')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
%--------------------------------------- Dipole (Quadrupole) moment and MW and EFR/SASA
fig6=figure(6);
clf
plot3(s1(:,6), s1(:,2), s1(:,1), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,6), s2(:,2), s2(:,1), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,6), s3(:,2), s3(:,1), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,6), s4(:,2), s4(:,1), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,6), s0(:,2), s0(:,1), 'yo', 'MarkerFaceColor', 'y') %M
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
xlabel('EFR')
ylabel('Dipole moment')
zlabel('Charge Density')
grid on
box on

fig7=figure(7);
clf
plot3(s1(:,6), s1(:,3), s1(:,1), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,6), s2(:,3), s2(:,1), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,6), s3(:,3), s3(:,1), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,6), s4(:,3), s4(:,1), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,6), s0(:,3), s0(:,1), 'yo', 'MarkerFaceColor', 'y') %M
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
xlabel('EFR')
ylabel('Quadrupole moment (Q1)')
zlabel('Charge Density')
grid on
box on
%-------------------------------------- Dipole moment and Guy potential 
fig8=figure(8);
clf
plot(s1(:,2), s1(:,4), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,2), s2(:,4), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,2), s3(:,4), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,2), s4(:,4), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,2), s0(:,4), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('Dipole moment')
ylabel('Guy potential')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')

fig9=figure(9);
clf
plot3(s1(:,1), s1(:,4), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,1), s2(:,4), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,1), s3(:,4), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,1), s4(:,4), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,1), s0(:,4), s0(:,9), 'yo', 'MarkerFaceColor', 'y') %M
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
xlabel('Charge Density')
ylabel('Guy potential')
zlabel('MW / Da')
grid on
box on

