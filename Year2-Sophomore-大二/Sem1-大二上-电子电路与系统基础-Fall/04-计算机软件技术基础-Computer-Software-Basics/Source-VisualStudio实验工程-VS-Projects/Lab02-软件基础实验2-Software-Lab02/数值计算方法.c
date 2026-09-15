#include <stdio.h>
#include <math.h>

#define H 0.2
#define N 5 // (1-0)/0.2 + 1
#define f(x, y) (1 - 2 * (y)) // 函数f(x, y) = 1 - 2y

// 改进的欧拉法计算 y(0.2)
double improvedEuler(double y0) {
    double k1 = H * f(0, y0);
    double k2 = H * f(H, y0 + k1);
    return y0 + 0.5 * (k1 + k2);
}

// 显式2阶亚当姆斯方法（Adams-Bashforth）
void adamsBashforth(double y[]) {
    for (int i = 1; i < N - 1; i++) {
        y[i + 1] = y[i] + H * (1.5 * f(i * H, y[i]) - 0.5 * f((i - 1) * H, y[i - 1]));
    }
}

// 隐式2阶亚当姆斯方法（Adams-Moulton）
void adamsMoulton(double y[]) {
    for (int i = 1; i < N - 1; i++) {
        double y_predict = y[i] + H * f(i * H, y[i]);
        y[i + 1] = y[i] + H * (0.5 * f((i + 1) * H, y_predict) + 0.5 * f(i * H, y[i]));
    }
}

// 4阶龙格-库塔方法计算前三步
void rungeKutta(double y[]) {
    for (int i = 0; i < 3; i++) {
        double k1 = H * f(i * H, y[i]);
        double k2 = H * f(i * H + H / 2, y[i] + k1 / 2);
        double k3 = H * f(i * H + H / 2, y[i] + k2 / 2);
        double k4 = H * f(i * H + H, y[i] + k3);
        y[i + 1] = y[i] + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    }
}

// 亚当姆斯预测-校正法
void adamsPredictCorrect(double y[]) {
    rungeKutta(y); // 计算前三步
    for (int i = 3; i < N - 1; i++) {
        // 预测
        double y_predict = y[i] + H / 24 * (55 * f(i * H, y[i]) - 59 * f((i - 1) * H, y[i - 1]) + 37 * f((i - 2) * H, y[i - 2]) - 9 * f((i - 3) * H, y[i - 3]));
        // 校正
        y[i + 1] = y[i] + H / 24 * (9 * f((i + 1) * H, y_predict) + 19 * f(i * H, y[i]) - 5 * f((i - 1) * H, y[i - 1]) + f((i - 2) * H, y[i - 2]));
    }
}

int main() {
    double y_ab[N] = { 1.0 }; // Adams-Bashforth初始化
    double y_am[N] = { 1.0 }; // Adams-Moulton初始化
    double y_pc[N] = { 1.0 }; // Predictor-Corrector初始化

    // 1. 使用改进的欧拉法计算 y(0.2) 的近似值
    y_ab[1] = y_am[1] = improvedEuler(1.0);

    // 2. 使用显式的2阶亚当姆斯格式求解
    adamsBashforth(y_ab);
    printf("显式Adams-Bashforth:\n");
    for (int i = 0; i < N; i++) {
        printf("y(%.1f) = %.6f\n", i * H, y_ab[i]);
    }

    // 3. 使用隐式的2阶亚当姆斯格式求解
    adamsMoulton(y_am);
    printf("\n隐式Adams-Moulton:\n");
    for (int i = 0; i < N; i++) {
        printf("y(%.1f) = %.6f\n", i * H, y_am[i]);
    }

    // 4. 使用亚当姆斯预报-校正系统求解
    adamsPredictCorrect(y_pc);
    printf("\nAdams Predictor-Corrector:\n");
    for (int i = 0; i < N; i++) {
        printf("y(%.1f) = %.6f\n", i * H, y_pc[i]);
    }

    return 0;
}
