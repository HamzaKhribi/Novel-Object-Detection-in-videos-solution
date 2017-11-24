function [CHOP] = features(im,sbin)
[X,Y,Z]=size(im);
if(Z==3)
%im=imresize(im,[128 64]);
% xyz_img =rgb2xyz(im) ;
% cform = makecform('xyz2uvl');
% im = applycform(xyz_img,cform);
%im=rgb2ycbcr(im);
red = im(:,:,1); % Red channel
green = im(:,:,2); % Green channel
blue = im(:,:,3); % Blue channel
%in this step we compute the phase congruency for every channel


% [M_red m_red or_red ft_red PC_red EO_red] = compute_phasecong(red, 4, 6, 3, 2.5, 0.55, 2.0, 0.4, 10);
% [M_green m_green or_green ft_green P77C_green EO_green] = compute_phasecong(green, 4, 6, 3, 2.5, 0.55, 2.0, 0.4, 10);
% [M_blue m_blue or_blue ft_blue PC_blue EO_blue] = compute_phasecong(blue, 4, 6, 3, 2.5, 0.55, 2.0, 0.4, 10);
% 
[ pc_red or_red ft_red T_red]=phasecongmono(red,4,3,2.1,0.55,3.0,0.5,10,1.5,-1);
[ pc_green or_green ft_green T_green]=phasecongmono(green,4,3,2.1,0.55,3.0,0.5,10,1.5,-1);
[ pc_blue or_blue ft_blue T_blue]=phasecongmono(blue,4,3,2.1,0.55,3.0,0.5,10,1.5,-1);

max_phasecong=double(max(pc_red(:,:),max(pc_green(:,:),pc_blue(:,:))));
max_orientation=double(max(or_red(:,:),max(or_green(:,:),or_blue(:,:))));
CHOP=featuresChop(max_phasecong,max_orientation,sbin);
elseif(Z==1)
red = im(:,:,1); % Red channel

[ pc_red or_red ft_red T_red]=phasecongmono(red,4,3,2.1,0.55,3.0,0.5,10,1.5,-1);
CHOP=featuresChop(pc_red,or_red,sbin);
    
end
    

