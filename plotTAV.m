dummy=open('tav.mat');
dummy=dummy.tav;

s0=dummy(dummy(:,10)==0,:); %membrane
s1=dummy(dummy(:,10)==1,:); %cytoplasm
s2=dummy(dummy(:,10)==2,:); %periplasm
s3=dummy(dummy(:,10)==3,:); %ribosomal
s4=dummy(dummy(:,10)==4,:); %unknown

fig=figure(1);
clf
plot3(s1(:,1), s1(:,6)./s1(:,7), s1(:,9), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot3(s2(:,1), s2(:,6)./s2(:,7), s2(:,9), 'bo', 'MarkerFaceColor', 'b') %P
plot3(s3(:,1), s3(:,6)./s3(:,7), s3(:,9), 'go', 'MarkerFaceColor', 'g') %R
plot3(s4(:,1), s4(:,6)./s4(:,7), s4(:,9), 'ko', 'MarkerFaceColor', 'k') %U
plot3(s0(:,1), s0(:,6)./s0(:,7), s0(:,9), 'yo', 'MarkerFaceColor', 'y') %M
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
xlabel('ChargeDens')
ylabel('FractionFattyExp')
zlabel('MW / Da')
grid on
box on

fig2=figure(2);
clf
plot(s1(:,1), s1(:,6)./s1(:,7), 'ro', 'MarkerFaceColor', 'r') %C
hold on
plot(s2(:,1), s2(:,6)./s2(:,7), 'bo', 'MarkerFaceColor', 'b') %P
plot(s3(:,1), s3(:,6)./s3(:,7), 'go', 'MarkerFaceColor', 'g') %R
plot(s4(:,1), s4(:,6)./s4(:,7), 'ko', 'MarkerFaceColor', 'k') %U
plot(s0(:,1), s0(:,6)./s0(:,7), 'yo', 'MArkerFaceColor', 'y') %M
xlabel('ChargeDens')
ylabel('FractionFattyExp')
grid on
box on
legend('Cytoplasm', 'Periplasm', 'Ribosomal', 'Unknown', 'Membrane')
