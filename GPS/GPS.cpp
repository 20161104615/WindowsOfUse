#include <stdio.h>
#include "string.h"
int main(){
    int i,n,k;
    char DLOfGPRMCNumber[24],DLOfGPGGANumber[24],time[6],timeofh[3],timeofm[3],timeofs[3],date[6],dateofy[3],dateofm[3],dateofd[3];
    FILE *f,*p,*t;
    char *m,*g,*l;
    f = fopen ("GPS.txt","r+");
    p = fopen ("GPS.txt","r+");
    t = fopen ("GPS.csv","w");
    printf("请输入输出行数：");
    scanf("%d",&k);
    if (f==NULL&&p==NULL){
        printf("文件打开失败!\n");
    }
    else {
        fprintf(t,"时间,时,分,秒,纬度,N/S,经度,E/W,年,月,日\n");
            for(n=0;n<k;n++){
                fseek(f, 7+n*125L, SEEK_CUR);
                printf("GPRMC的时间为：");
                for (i=0;i<6;i++){
                    fscanf(f,"%c",&time[i]);
                    printf("%c",time[i]);
                }
                g=time;
                fprintf(t,"%s,",time);
                fseek(f, 0L, SEEK_SET);
                printf("\n");
                strncpy(timeofh,g,2);
		        timeofh[2]='\0';
		        strncpy(timeofm,g+2,2);
		        timeofm[2]='\0';
		        strncpy(timeofs,g+4,2);
		        timeofm[2]='\0';
               	fprintf(t,"%s,",timeofh);
               	fprintf(t,"%s,",timeofm);
               	fprintf(t,"%s,",timeofs);
               	
                
                
                fseek(f, 16+n*125L, SEEK_CUR);
                printf("GPRMC经纬度为：");
                for (i=0;i<22;i++){
                    fscanf(f,"%c",&DLOfGPRMCNumber[i]);
                    printf("%c",DLOfGPRMCNumber[i]);
                }
                fprintf(t,"%s,",DLOfGPRMCNumber);
                fseek(f,0L,SEEK_SET);
                printf("\n");
    
				
				fseek(f, 51+n*125L, SEEK_CUR);
                printf("GPRMC的日期为：");
                for (i=0;i<6;i++){
                    fscanf(f,"%c",&date[i]);
                    printf("%c",date[i]);
                }
                m=date;
                fseek(f, 0L, SEEK_SET);
                printf("\n");
	            strncpy(dateofd,m,2);
		        dateofd[2]='\0';
		        strncpy(dateofm,m+2,2);
		        dateofm[2]='\0';
	          	strncpy(dateofy,m+4,2);
	            dateofy[2]='\0';
               	fprintf(t,"20%s,",dateofy);
               	fprintf(t,"%s,",dateofm);
               	fprintf(t,"%s,\n",dateofd);
                
                
                
                
                
                fseek(p, 71+n*125L, SEEK_CUR);
                printf("GPGGA时间为：");
                for (i=0;i<6;i++){
                    fscanf(p,"%c",&time[i]);
                    printf("%c",time[i]);
                }
                l=time;
                fprintf(t,"%s,",time);
                fseek(p, 0L, SEEK_SET);
                printf("\n");
                strncpy(timeofh,l,2);
		        timeofh[2]='\0';
		        strncpy(timeofm,l+2,2);
		        timeofm[2]='\0';
		        strncpy(timeofs,l+4,2);
		        timeofm[2]='\0';
               	fprintf(t,"%s,",timeofh);
               	fprintf(t,"%s,",timeofm);
               	fprintf(t,"%s,",timeofs);
                
                fseek(p, 78+n*125L, SEEK_CUR);
                printf("GPGGA经纬度为：");
                for (i=0;i<22;i++){
                    fscanf(p,"%c",&DLOfGPGGANumber[i]);
                    printf("%c",DLOfGPGGANumber[i]);
                }
                fprintf(t,"%s,\n",DLOfGPGGANumber);
                fseek(p,0L,SEEK_SET);
                printf("\n");
        }
        free(l);
        free(g);
        fclose(f);
        fclose(p);
    }
    return 0;
}
