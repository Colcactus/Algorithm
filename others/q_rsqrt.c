// 传说中的快速平方根倒数算法，解析正在编写中

float q_rsqrt(float number){
    long i;
    float x2, y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y = number;
    i = * (long * ) &y;
    i = 0x5f3759df - (i >> 1);
    y = * (float * ) &i;
    y = y * (threehalfs - (x2 * y * y));
}
