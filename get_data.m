function [ d, color ] = get_data(img)

%% get gray image
gr = rgb2gray(img);
% figure
% subplot(3,3,1),imshow(gr,[]),title('Image Gray')

%% segment
se = strel('disk',3);
img_open = imopen(gr,se);
% subplot(3,3,2),imshow(img_open,[]),title('Image Open')
[gmax,gh,gv] = tse_imgrad(img_open,'gog',6);
% subplot(3,3,3),imshow(gmax,[]),title('Image Gaussian Gradients')
fs = tse_imhysthreshold(gmax);
% subplot(3,3,4),imshow(fs,[]),title('Image Threshold')
fs = tse_imextendedge(fs,gh,gv,14);
% subplot(3,3,5),imshow(fs,[]),title('Image Extend Edge')
fs = imfill(fs,'holes');
% subplot(3,3,6),imshow(fs,[]),title('Image Fill Holes')
fs = tse_imsplitobjects(fs);
bw = imopen(fs,se);
bw = bwareaopen(bw,200);
% subplot(3,3,7),imshow(bw,[]),title('Image Binary Segment')
test = bw.*img;
% subplot(3,3,8),
imshow(test),title('Segmented Image')

%% Particle size distribution
[fe,n]=bwlabel(bw);
fe_rgb=label2rgb(fe);
% subplot(3,3,9),imshow(fe_rgb,[]),title('Image Labeled')
mes=regionprops(fe,'EquivDiameter');
d=[mes.EquivDiameter];
% Conversion
d=d/size(gr,1)*150;

%% color
color = zeros(1,n);
for k = 1:1:n
    c = zeros(size(gr));
    c(fe == k) = 1;
    cl = c.*img;
    sum = 0;
    for i = 1:1:size(gr,1)
        for j = 1:1:size(gr,2)
            for m = 1:1:3
                sum = sum + cl(i,j,m);
            end
        end
    end
    avg = sum/(pi*(d(k)/2)^2);
    color(1,k) = avg;
end