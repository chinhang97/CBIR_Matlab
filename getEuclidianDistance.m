function euclidian_dist = getEuclidianDistance(v1,v2)

    euclidian_dist  =  sqrt(sum((v1-v2).^ 2 ));
    
end