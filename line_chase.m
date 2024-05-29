function [Boundary,Point,M2] = line_chase(BWa,remove)
    Boundary = bwboundaries(BWa);
    C = cellfun(@length,Boundary);
    i = 0;

    
    while 1
        i = i + 1;
        try
            if C(i) < remove
                Boundary(i) = [];
                C(i) = [];
                i = i - 1;
            end
        catch
            break 
        end
    end
    for j = 1:length(Boundary)
        Bn = Boundary(j);
        B_mat = cell2mat(Bn);
        M(j) = length(B_mat);
    end
    [~, num] = min(M);
    M2 = cell2mat(Boundary(num));
    center_x = mean(M2(:,2));
    center_y = mean(M2(:,1));
    Point = [center_x,center_y];
end