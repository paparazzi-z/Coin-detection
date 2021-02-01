function [value,items] = calculate_value(d,color)
n = size(d,2);
value = 0;
items = zeros(8,1);

for i = 1:1:n
    if(d(i)<22.5)
        value = value + 1;
        items(1) = items(1) + 1;
    end
    
    if(d(i)>23&&d(i)<25.05)
        value = value + 2;
        items(2) = items(2) + 1;
    end
    
    if(d(i)>27&&d(i)<28.42)
        value = value + 5;
        items(3) = items(3) + 1;
    end
    
    if(d(i)>25.05&&d(i)<27)
        value = value + 10;
        items(4) = items(4) + 1;
    end
    
    if(d(i)>28.42&&d(i)<29.7)
        value = value + 20;
        items(5) = items(5) + 1;
    end
    
    if(d(i)>30.8&&d(i)<32.5)
        value = value + 50;
        items(6) = items(6) + 1;
    end
    
    if(d(i)>29.7&&d(i)<30.8)
        value = value + 100;
        items(7) = items(7) + 1;
    end
    
    if(d(i)>32.5)
        value = value + 200;
        items(8) = items(8) + 1;
    end
end
