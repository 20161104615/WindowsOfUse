#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define OK   1
#define ERROR  0
#define TRUE 1
#define FALSE 0


#define	MAXSIZE  100   /*此处的宏定义常量表示线性表可能达到的最大长度*/

struct student{
	int number;
	int scour;
};
typedef struct student ElemType; 

typedef struct SeqList * Ptr;
struct SeqList
{ 
	ElemType  elem[MAXSIZE];  /*线性表占用的数组空间;int型*/
	int       last;    /*记录线性表中最后一个元素在数组elem[ ]中的位置（下标值），空表置为-1*/		
};
typedef Ptr position;


//输入数据
bool add(Ptr L){
	int StuNum;
	position p;
	int w;
	if (MAXSIZE <= L->last){
		printf("表满");
		return false;
	} else {
		printf("请输入要添加的学生个数:");
		scanf("%d",&StuNum);
		if ((L->last+StuNum)<MAXSIZE){
			printf("请输入学生信息:\n");
			for (int i=0;i<StuNum;i++){
				L->last++;
				w = L->last;
				printf("学生学号:");
				scanf("%d",&L->elem[w].number);
				printf("学生成绩:");
				scanf("%d",&L->elem[w].scour);
			}
		} else {
			printf("表满");
			return false;
		}
	}
	return true;
}
//显示数据
void output(Ptr L){
	for (int i = 0; i<=L->last;i++){
		printf("学生的学号为:%d ; 成绩为:%d ",L->elem[i].number,L->elem[i].scour);
		printf("\n");
	}
}
//查询数据
void find(Ptr L){
	int FindNumber;
	int i;
	bool y = false;
	printf("请输入要查找的学生学号：");
	scanf("%d",&FindNumber);
	for (i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			printf("学生学号:%d   学生成绩:%d",L->elem[i].number,L->elem[i].scour);
			printf("\n");
			y = true;
		}
	}
	if (y == false){
		printf("未找到\n");
	}
}
//修改数据 
void update(Ptr L){
	int FindNumber;
	int NewNumber;
	int NewScoure;
	printf("请输入要修改的学生学号:");
	scanf("%d",&FindNumber);
	for (int i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			printf("请输入新的学号:");
			scanf("%d",&NewNumber);
			printf("请输入新的成绩:");
			scanf("%d",&NewScoure);
			L->elem[i].number=NewNumber;
			L->elem[i].scour=NewScoure;
		}
	}
}
//删除数据
bool  dele(Ptr L){
	int i;
	int FindNumber;
	int j;//要删除学生学号位置 
	printf("请输入要删除的学生学号:");
	scanf("%d",&FindNumber);
	
	for (i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			j = i;
		}
	}
	j++;
	if (j<1||j>L->last+1){
		printf("未找到学生！\n");
		return false;
	}
	for (j;j<=L->last;j++){
		L->elem[j-1]=L->elem[j];
	}
	L->last--;
	return true;
}
//保存数据到文件
void save(Ptr L){
	FILE * fp;
	int num=0; 
	fp = fopen("E:\\大学\\C\\StudentsScore.txt","w+");
	if (fp == NULL){
		printf("Error.");
	}
	for (int i=0;i<=L->last;i++){
		fprintf(fp,"%d ",L->elem[i].number);
		fprintf(fp,"%d\n",L->elem[i].scour);
	}
	fprintf(fp,"%d\n",L->last+1);
	fflush(fp);//刷新缓冲区 
	fclose(fp);
}
//读取数据文件
void read(Ptr L){
	FILE * fp;
	int num=0;
	fp = fopen("E:\\大学\\C\\StudentsScore.txt","r+");
	if (fp == NULL){
		printf("Error.");
	}
	fseek(fp,-3L,2);
	fscanf(fp,"%d",&num);
	fseek(fp,0L,0);
	L->last=num-1;
	//ftell(fp);
	for (int i = 0;i<num;i++){
		fscanf(fp,"%d",&L->elem[i].number);
		fscanf(fp,"%d",&L->elem[i].scour);
	}
	output(L);
	printf("总人数是：%d\n",num);
	fclose(fp);
} 

//插入排序数据
void sort(Ptr L){
	int len = L->last+1;
	int preIndex,currnet,num;
	for (int i=1;i<len;i++){
		preIndex = i-1;
		currnet = L->elem[i].scour;
		num = L->elem[i].number;
		while(preIndex >=0 && L->elem[preIndex].scour > currnet){
			L->elem[preIndex + 1].scour = L->elem[preIndex].scour;
			L->elem[preIndex + 1].number = L->elem[preIndex].number;
			preIndex--;
		}
		L->elem[preIndex + 1].scour = currnet;
		L->elem[preIndex + 1].number = num;
	}
}

//主菜单 
void menu(Ptr L)
{
	int n; 
	printf("          |***********学生成绩管理系统***********|            \n");
	printf("          | ------------------------------------ |            \n");
	printf("          |               主菜单项               |            \n");
	printf("          | ------------------------------------ |            \n");
	printf("          |	  1 --- 输入数据.                |            \n");
	printf("          |	  2 --- 显示数据.                |            \n");
	printf("          |	  3 --- 查询数据.                |            \n");
	printf("          |	  4 --- 修改数据.                |            \n");
	printf("          |	  5 --- 删除数据.                |            \n");
	printf("          |	  ----------------------         |            \n");
	printf("          |	  6 --- 保存数据到文件.          |            \n");
	printf("          |	  7 --- 从文件读取数据.          |            \n");
	printf("          |	  8 --- 排序数据.                |            \n");
	printf("          |	  9 --- 退出系统.                |            \n");
	printf("\n");
	
	while (1){
		printf("请选择菜单项:");
		scanf("%d",&n);
		switch(n){
			case 1:
				add(L);
				break;
			case 2:
				output(L);
				break;
			case 3:
				find(L);
				break;
			case 4:
				update(L); 
				output(L);
				break;
			case 5:
				dele(L);
				output(L);
				break;
			case 6:
				save(L);
				break;
			case 7:
				read(L);
				break;
			case 8:
				sort(L);
				break;
			case 9:
				return;
				break;
		}
	}
}
int main()
{
	Ptr L = (SeqList*)malloc(sizeof(SeqList));
	L->last=-1;
	menu(L);
	return 0;
}
