dummy=open('tav.mat');
dummy=dummy.tav;

s0=dummy(dummy(:,9)==0,:); %membrane
s1=dummy(dummy(:,9)==1,:); %cytoplasm
s2=dummy(dummy(:,9)==2,:); %periplasm
s3=dummy(dummy(:,9)==3,:); %ribosomal
s4=dummy(dummy(:,9)==4,:); %unknown

fig=figure(1);
clf
plot3(s1(:,2), s1(:,3), s1(:,4), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,2), s2(:,3), s2(:,4), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,2), s3(:,3), s3(:,4), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,2), s4(:,3), s4(:,4), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,2), s0(:,3), s0(:,4), 'yo', 'MArkerFaceColor', 'y') %M
axis([-35, 35, 0, 10000, 0, 120000])
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
title('E. coli 150 most abundant')
xlabel('Charge')
ylabel('Abundance / ppm')
zlabel('MW / Da')
grid on
box on

fig2=figure(2);
clf
plot(s1(:,1), s1(:,6), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,1), s2(:,6), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,1), s3(:,6), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,1), s4(:,6), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,1), s0(:,6), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('ChargeDens')
ylabel('NumFattyExp')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
