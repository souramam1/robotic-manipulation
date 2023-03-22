function [] = plot_Frames(T)

    c = 45;

    quiver3(T(1, 4), T(2, 4), T(3, 4), T(1, 1)*c  , T(2, 1)*c  , T(3, 1)*c ,'b');
    quiver3(T(1, 4), T(2, 4), T(3, 4), -T(1, 2)*c  , -T(2, 2)*c  , -T(3, 2)*c ,'r');
    quiver3(T(1, 4), T(2, 4), T(3, 4), T(1, 3)*c  , T(2, 3)*c  , T(3, 3)*c ,'k');    
    
end
