function Click(src, event,Vorticef,largo,distance)
    
    x= src.Children.CurrentPoint(1,1);
    y= src.Children.CurrentPoint(1,2);
    newcenter=[x y];

    Vorticef = Vorticef.*distance./474;
    newcenter = newcenter.*distance./474;

    for i=1:length(Vorticef)
        for l=1:length(Vorticef(:,1,1))
            distancia(l,:,i) = pdist([Vorticef(l,:,i); newcenter]);
        end
    end

    disp(size(distancia))
    [~, minimo] = min(distancia, [],'all');
    %disp(minimo)

    [xa,ya,za] = ind2sub([6 1 339],minimo);
   
 
    Tray = Vorticef(:,:,za);
    Tray = Tray.*474./distance;


    p = figure(2)
    k = plot(Tray(:,1),Tray(:,2),'o-','MarkerSize',7,'MarkerEdgeColor','k','LineWidth',2,'Tag','NewTray')

    k.MarkerFaceColor=k.Color;

    dli = zeros(1,largo)
    dlt = zeros(1,largo);
    for j=2:length(Tray)
        dli(j) = sqrt((Tray(j,1) - Tray(j-1,1))^2+(Tray(j,2) - Tray(j-1,2))^2);
        dlt(j) = sum(dli)
        
    end

    B = [10 10.5 11 11.5 12 12.5]
    
    f7 = figure(7)
    f = plot(B,dlt,'.-','MarkerSize',15)
    hold on
    f.Color = k.Color
    xlabel('B(T)')
    ylabel('Accumulative distance (nm) ')
    ax=gca;
    ax.FontSize = 15

    FFT = fft(dlt)

    f8 = figure(8)
    plot(dlt,FFT,'.-','MarkerSize',15)
    hold on


    set(p, 'KeyPressFcn', @retoceso);

    function retoceso(p, event)
        trays = findobj(p,'Tag','NewTray');
        delete(trays)
        close(f7)
        close(f8)
    end

end