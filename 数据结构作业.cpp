#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define OK   1
#define ERROR  0
#define TRUE 1
#define FALSE 0


#define	MAXSIZE  100   /*�˴��ĺ궨�峣����ʾ���Ա���ܴﵽ����󳤶�*/

struct student{
	int number;
	int scour;
};
typedef struct student ElemType; 

typedef struct SeqList * Ptr;
struct SeqList
{ 
	ElemType  elem[MAXSIZE];  /*���Ա�ռ�õ�����ռ�;int��*/
	int       last;    /*��¼���Ա������һ��Ԫ��������elem[ ]�е�λ�ã��±�ֵ�����ձ���Ϊ-1*/		
};
typedef Ptr position;


//��������
bool add(Ptr L){
	int StuNum;
	position p;
	int w;
	if (MAXSIZE <= L->last){
		printf("����");
		return false;
	} else {
		printf("������Ҫ��ӵ�ѧ������:");
		scanf("%d",&StuNum);
		if ((L->last+StuNum)<MAXSIZE){
			printf("������ѧ����Ϣ:\n");
			for (int i=0;i<StuNum;i++){
				L->last++;
				w = L->last;
				printf("ѧ��ѧ��:");
				scanf("%d",&L->elem[w].number);
				printf("ѧ���ɼ�:");
				scanf("%d",&L->elem[w].scour);
			}
		} else {
			printf("����");
			return false;
		}
	}
	return true;
}
//��ʾ����
void output(Ptr L){
	for (int i = 0; i<=L->last;i++){
		printf("ѧ����ѧ��Ϊ:%d ; �ɼ�Ϊ:%d ",L->elem[i].number,L->elem[i].scour);
		printf("\n");
	}
}
//��ѯ����
void find(Ptr L){
	int FindNumber;
	int i;
	bool y = false;
	printf("������Ҫ���ҵ�ѧ��ѧ�ţ�");
	scanf("%d",&FindNumber);
	for (i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			printf("ѧ��ѧ��:%d   ѧ���ɼ�:%d",L->elem[i].number,L->elem[i].scour);
			printf("\n");
			y = true;
		}
	}
	if (y == false){
		printf("δ�ҵ�\n");
	}
}
//�޸����� 
void update(Ptr L){
	int FindNumber;
	int NewNumber;
	int NewScoure;
	printf("������Ҫ�޸ĵ�ѧ��ѧ��:");
	scanf("%d",&FindNumber);
	for (int i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			printf("�������µ�ѧ��:");
			scanf("%d",&NewNumber);
			printf("�������µĳɼ�:");
			scanf("%d",&NewScoure);
			L->elem[i].number=NewNumber;
			L->elem[i].scour=NewScoure;
		}
	}
}
//ɾ������
bool  dele(Ptr L){
	int i;
	int FindNumber;
	int j;//Ҫɾ��ѧ��ѧ��λ�� 
	printf("������Ҫɾ����ѧ��ѧ��:");
	scanf("%d",&FindNumber);
	
	for (i=0;i<=L->last;i++){
		if (FindNumber == L->elem[i].number){
			j = i;
		}
	}
	j++;
	if (j<1||j>L->last+1){
		printf("δ�ҵ�ѧ����\n");
		return false;
	}
	for (j;j<=L->last;j++){
		L->elem[j-1]=L->elem[j];
	}
	L->last--;
	return true;
}
//�������ݵ��ļ�
void save(Ptr L){
	FILE * fp;
	int num=0; 
	fp = fopen("E:\\��ѧ\\C\\StudentsScore.txt","w+");
	if (fp == NULL){
		printf("Error.");
	}
	for (int i=0;i<=L->last;i++){
		fprintf(fp,"%d ",L->elem[i].number);
		fprintf(fp,"%d\n",L->elem[i].scour);
	}
	fprintf(fp,"%d\n",L->last+1);
	fflush(fp);//ˢ�»����� 
	fclose(fp);
}
//��ȡ�����ļ�
void read(Ptr L){
	FILE * fp;
	int num=0;
	fp = fopen("E:\\��ѧ\\C\\StudentsScore.txt","r+");
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
	printf("�������ǣ�%d\n",num);
	fclose(fp);
} 

//������������
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

//���˵� 
void menu(Ptr L)
{
	int n; 
	printf("          |***********ѧ���ɼ�����ϵͳ***********|            \n");
	printf("          | ------------------------------------ |            \n");
	printf("          |               ���˵���               |            \n");
	printf("          | ------------------------------------ |            \n");
	printf("          |	  1 --- ��������.                |            \n");
	printf("          |	  2 --- ��ʾ����.                |            \n");
	printf("          |	  3 --- ��ѯ����.                |            \n");
	printf("          |	  4 --- �޸�����.                |            \n");
	printf("          |	  5 --- ɾ������.                |            \n");
	printf("          |	  ----------------------         |            \n");
	printf("          |	  6 --- �������ݵ��ļ�.          |            \n");
	printf("          |	  7 --- ���ļ���ȡ����.          |            \n");
	printf("          |	  8 --- ��������.                |            \n");
	printf("          |	  9 --- �˳�ϵͳ.                |            \n");
	printf("\n");
	
	while (1){
		printf("��ѡ��˵���:");
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
