%Вариант 14
clc,clear

%Открываем файл на запись
fileID = fopen('Integral.txt','w');
fprintf(fileID,'%10s|%10s|%10s|%10s|%26s\n','a', 'b', 'limit1', 'limit2', 'result');

%Выбираем a, b
a = randi([1,10],1);
b = randi([1,10],1);

%Вычисление неопределенного интеграла
syms x
f = 1/(a*x+b)^(0.5);
res = int(f, x);
fprintf(fileID,'%10d|%10d|%10s|%10s|%26s\n',a, b, '-', '-', char(res));

%Вычисление определенных интегралов
fun = @(z) 1./(a*z+b).^(0.5);
tic
for i=1:100
    limit1 = i;
    limit2 = i + 1;
    res = integral(@(z) fun(z), limit1, limit2);
    fprintf(fileID,'%10d|%10d|%10d|%10d|%26.5f\n',a, b, limit1, limit2, res);
end
end_time = toc;

%Запись времени выполнения в файл
fprintf(fileID, "Время вычислений " + num2str(end_time) + " секунд");

%Закрытие файла
fclose(fileID);
