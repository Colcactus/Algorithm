/*
������ʽ��
����
5
1 3 2 5 4
������
��һ��n��ʾ�ڶ��е���������
�ڶ��������Ǵ��������飬��n��������֮��ӿո�
�����ʽ��
����
5 4 3 2 1
��һ��
��ʾ������ϵ�����

���ݲ�����int��Χ
*/
#include<cstdio>
using namespace std;
int main(){
    int lenth,i,j,temp;
	scanf("%d",&lenth);
	int a[lenth+1];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}
    for(i=1;i<lenth;i++){
        temp=a[i];
        for(j=i-1;(a[j]<temp)&&(j>=0);j--){
            a[j+1]=a[j];
        }
        a[j+1]=temp;
    }
	for(i=0;i<lenth;i++){
        printf("%d ",a[i]);
	}
	return 0;
}
