
c = imread('사진1.jpg');
hsv = rgb2hsv(c);
a1 = 720;
a2 = 960;

h = hsv(:,:,1);
s = hsv(:,:,2);
real = hsv(:,:,3);
color = zeros(a1,a2);
%초록색- mi:0.3 , ma:0.4 , s_value:0.5

mi = 0.3;
ma = 0.4;
s_value = 0.5;

 for i = 1: a1
            for j = 1:a2
                if (h(i, j)> mi) && (h(i, j) < ma) && (s(i,j) > s_value)
                    color(i, j) = 1;
                end
            end
 end

 color = bwareaopen(color,1000);
 invcolor = bwareaopen(~color,1000);
 color = ~invcolor;

 s = regionprops(~color,'Centroid','MajorAxisLength', 'MinorAxisLength');
 points = [s.Centroid];
 major = [s.MajorAxisLength];
 minor = [s.MinorAxisLength];
 [diameters] = (major+minor)/2;
 Center = [];
 max = 600;

 while 1
        i = i + 1;
        try
            if  diameters(i) < remove
                points(2*i-1) = [];
                points(2*i-1) =[];
                diameters(i) = [];
                i = i - 1;
            end
        catch
            break
        end
    end
    D = diameters';
    P = points;

    for k = 1:length(P)/2
        Center(k,1) = P(1,2*k-1);
        Center(k,2) = P(1,2*k);
    end
    [Diameter,num] = min(D);
    Centroid = Center(num,:);
    if Diameter > max
        Diameter = [];
        Centroid = [];
    end


imshow(~color)
hold on
plot(Centroid(1),Centroid(2),'b.','MarkerSize',10)




