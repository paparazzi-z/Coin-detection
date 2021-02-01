img = double(imread('db/multi/020.jpg'))/255;
% figure
% imshow(img,[])

[d, color] = get_data(img);
[value,items] = calculate_value(d,color);

%%

euro = floor(value/100);
cent = mod(value,100);
if (euro ~= 0 && cent == 0)
    total = sprintf('%d%s',euro,' euro ')
elseif (euro ~= 0)
    total = sprintf('%d%s%d%s',euro,' euro ',cent,' cent ')
else
    total = sprintf('%d%s',cent,' cent ')
end
items











% gr = rgb2gray(img);
% figure
% imshow(gr,[]),title('Gray Image')
% % segment
% se = strel('disk',3);
% test_hat = imopen(gr,se);
% figure, subplot(1,2,1),imshow(test_hat,[]),title('Image Open')
% [gmax,gh,gv] = tse_imgrad(test_hat,'gog',6);
% subplot(1,2,2),imshow(gmax,[]),title('Image Gaussian Gradients')
% fs = tse_imhysthreshold(gmax);
% figure
% subplot(2,2,1),imshow(fs,[]),title('Image Threshold')
% fs = tse_imextendedge(fs,gh,gv,14);
% subplot(2,2,2),imshow(fs,[]),title('Image Extend Edge')
% fs = imfill(fs,'holes');
% subplot(2,2,3),imshow(fs,[]),title('Image Fill Holes')
% fs = imopen(fs,se);
% fs = bwareaopen(fs,200);
% 
% subplot(2,2,4),imshow(fs,[]),title('Image Binary Segment')
% 
% test1 = fs.*img;
% figure
% subplot(1,2,1),imshow(test1),title('Image Segment')
% 
% % lidu
% [fe,n]=bwlabel(fs);
% fe_rgb=label2rgb(fe);
% subplot(1,2,2),imshow(fe_rgb,[]),title('Image Labeled')
% figure(6),imshow(fe_rgb);
% mes=regionprops(fe,'EquivDiameter');
% d=[mes.EquivDiameter];
% Conversion
% d=d/size(gr,1)*150;
% % 
% % 
% % % color
% % color = zeros(1,n);
% % for k = 1:1:n
% %     c = zeros(size(img));
% %     R = zeros(size(gr));
% %     G = zeros(size(gr));
% %     B = zeros(size(gr));
% %     R(fe==1) = 1;
% %     G(fe==1) = 1;
% %     B(fe==1) = 1;
% %     c(:,:,1) = R;
% %     c(:,:,2) = G;
% %     c(:,:,3) = B;
% %     cl = c.*img;
% %     r = cl(:,:,1);
% %     g = cl(:,:,2);
% %     sum = 0;
% %     for i = 1:1:500
% %         for j = 1:1:500
% %             for m = 1:1:3
% %                 sum = sum + cl(i,j,m);
% %             end
% %         end
% %     end
% %     avg = sum/(500*500);
% %     color(1,1) = avg;
% % end
