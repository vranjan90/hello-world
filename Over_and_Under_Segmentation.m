I1=imread('/home/histosr/Downloads/MKS/Set_2/GT/GT_1.png');
I2=imread('/home/histosr/Downloads/MKS/Set_2/Predicted/p4.png');
close all;


A=I2;
[Aval, ~, indAval] = unique(A);
% B=[0,63,126,189,252];
B=[0,64,127,191,255];

[is_it_there, idx] = ismember(uint8(A),B);
% idx(is_it_there);
ab=1-is_it_there;

[Bval, ~, BindAval] = unique(ab);


% BB1=A==0;
% BB2=A==64;
% BB3=A==127;
% BB4=A==191;
% BB5=A==255;

% BB1=(A<5)&(A>=0);
% BB2=(A<70)&(A>60);
% BB3=(A<130)&(A>120);
% BB4=(A<200)&(A>185);
% BB5=(A<=255)&(A>245);

BB1=(A<5)&(A>=0);
BB2=(A<70)&(A>50);
BB3=(A<130)&(A>110);
BB4=(A<200)&(A>165);
BB5=(A<=255)&(A>225);



all=BB1.*0+BB2.*64+BB3.*127+BB4.*191+BB5.*255;
dis1=uint8(all);



A=I1;
% BB1=(A<5)&(A>=0);
% BB2=(A<70)&(A>60);
% BB3=(A<130)&(A>120);
% BB4=(A<200)&(A>185);
% BB5=(A<=255)&(A>245);

BB1=(A<5)&(A>=0);
BB2=(A<70)&(A>50);
BB3=(A<130)&(A>110);
BB4=(A<200)&(A>165);
BB5=(A<=255)&(A>225);

all=BB1.*0+BB2.*64+BB3.*127+BB4.*191+BB5.*255;
% all=BB1.*5+BB2.*69+BB3.*132+BB4.*198+BB5.*250;
dis2=uint8(all);

% imshow(dis2);


xx=double(all);
aa=double(I2);
 
I3=uint8(aa.*xx);
% imshowpair(I2,I3);
% imshowpair(dis1,dis2,'Scaling','independent')
% figure;
% imshowpair(dis1,dis2,'montage')
figure;
subplot(1,3,1);imshow(dis2);title('Groundtruth');
subplot(1,3,2);imshow(dis1);title('Predicted');
subplot(1,3,3);imshowpair(dis1,dis2,'Scaling','independent');title('Overlap');


% figure;
% multi = cat(2,dis1,dis2,dis1,dis2);
% montage(multi);
