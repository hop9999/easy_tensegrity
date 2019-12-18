function print_force_tape(x, t, robot)

Count = length(t);

ro = robot.ro;
k  = robot.k;
r1 = robot.r1;
r2 = robot.r2;
r3 = robot.r3;

r_init = [robot.initial_state(1); robot.initial_state(2)];

get_force_normal1 = get_force_normal_approx(r_init, r1);
get_force_normal2 = get_force_normal_approx(r_init, r2);
get_force_normal3 = get_force_normal_approx(r_init, r3);


f1 = zeros(Count, 2);
f2 = zeros(Count, 2);
f3 = zeros(Count, 2);

f1_na = zeros(Count, 2);
f2_na = zeros(Count, 2);
f3_na = zeros(Count, 2);

f1_tan = zeros(Count, 2);
f2_tan = zeros(Count, 2);
f3_tan = zeros(Count, 2);

for i = 1:Count
    r = [x(i, 1); x(i, 2)];
    f1(i, :) = get_force_exact(r, r1, k(1), ro(1));
    f2(i, :) = get_force_exact(r, r2, k(2), ro(2));
    f3(i, :) = get_force_exact(r, r3, k(3), ro(3));
    
    f1_na(i, :) = get_force_normal1(r, r1, k(1), ro(1));
    f2_na(i, :) = get_force_normal2(r, r2, k(2), ro(2));
    f3_na(i, :) = get_force_normal3(r, r3, k(3), ro(3));
    
%     f1_tan(i, :) = get_force_normal_approx(r, r1, k(1), ro(1));
%     f2_tan(i, :) = get_force_normal_approx(r, r2, k(2), ro(2));
%     f3_tan(i, :) = get_force_normal_approx(r, r3, k(3), ro(3));
end

fig = figure;

subplot(1, 3, 1)
xlabel("t, s");
ylabel("f, N");
plot(t, f1, 'LineWidth', 3); hold on;
plot(t, f1_na, '--', 'LineWidth', 3);
plot(t, f1_tan, ':', 'LineWidth', 3);
legend_handle = legend('$$f_x$$', '$$f_y$$', ...
                       '$$f_x^n$$', '$$f_y^n$$', ...
                       '$$f_x^t$$', '$$f_y^t$$');
legend_handle.Interpreter = 'latex';
grid on; grid minor;
ax = gca;
ax.GridAlpha = 0.6;
ax.LineWidth = 0.5;
ax.MinorGridLineStyle = '-';
ax.MinorGridAlpha = 0.2;
ax.FontName = 'Times New Roman';
ax.FontSize = 18;


subplot(1, 3, 2)
xlabel("t, s");
ylabel("f, N");
plot(t, f2, 'LineWidth', 3); hold on;
plot(t, f2_na, '--', 'LineWidth', 3);
plot(t, f2_tan, ':', 'LineWidth', 3);
legend_handle = legend('$$f_x$$', '$$f_y$$', ...
                       '$$f_x^n$$', '$$f_y^n$$', ...
                       '$$f_x^t$$', '$$f_y^t$$');
legend_handle.Interpreter = 'latex';
grid on; grid minor;
ax = gca;
ax.GridAlpha = 0.6;
ax.LineWidth = 0.5;
ax.MinorGridLineStyle = '-';
ax.MinorGridAlpha = 0.2;
ax.FontName = 'Times New Roman';
ax.FontSize = 18;


subplot(1, 3, 3)
xlabel("t, s");
ylabel("f, N");
plot(t, f3, 'LineWidth', 3); hold on;
plot(t, f3_na, '--', 'LineWidth', 3);
plot(t, f3_tan, ':', 'LineWidth', 3);
legend_handle = legend('$$f_x$$', '$$f_y$$', ...
                       '$$f_x^n$$', '$$f_y^n$$', ...
                       '$$f_x^t$$', '$$f_y^t$$');
legend_handle.Interpreter = 'latex';
grid on; grid minor;
ax = gca;
ax.GridAlpha = 0.6;
ax.LineWidth = 0.5;
ax.MinorGridLineStyle = '-';
ax.MinorGridAlpha = 0.2;
ax.FontName = 'Times New Roman';
ax.FontSize = 18;

end