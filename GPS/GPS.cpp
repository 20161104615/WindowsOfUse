#include <stdio.h>
int main(){
    int i,n,k;
    char DLOfGPRMCNumber[24],DLOfGPGGANumber[24],time[6],date[6],dateofy[2],dateofm[2],dateofd[2];
    FILE *f,*p,*t;
    f = fopen ("GPS.txt","r+");
    p = fopen ("GPS.txt","r+");
    t = fopen ("GPS.csv","w");
    printf("请输入输出行数：");
    scanf("%d",&k);
    if (f==NULL&&p==NULL){
        printf("文件打开失败!\n");
    }
    else {
        fprintf(t,"时间,纬度,N/S,经度,E/W,年,月,日\n");
            for(n=0;n<k;n++){
                fseek(f, 7+n*125L, SEEK_CUR);
                printf("GPRMC的时间为：");
                for (i=0;i<6;i++){
                    fscanf(f,"%c",&time[i]);
                    printf("%c",time[i]);
                }
                fprintf(t,"%s,",time);
                fseek(f, 0L, SEEK_SET);
                printf("\n");
                
                
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
                for (i=0;i<2;i++){
                	fscanf(f,"%c",&dateofd[i]);
				}
				for (i=0;i<2;i++){
					fscanf(f,"%c",&dateofm[i]);
				}
				for (i=0;i<2;i++){
					fscanf(f,"%c",&dateofy[i]);
				}
				fprintf(t,"20%s,",dateofy);
				fprintf(t,"%s,",dateofm);
				fprintf(t,"%s,\n",dateofd);
				fseek(f, 0L, SEEK_SET);
				
				fseek(f, 51+n*125L, SEEK_CUR);
                printf("GPRMC的日期为：");
                for (i=0;i<6;i++){
                    fscanf(f,"%c",&date[i]);
                    printf("%c",date[i]);
                }
                fseek(f, 0L, SEEK_SET);
                printf("\n");
                
                
                
                
                
                
                fseek(p, 71+n*125L, SEEK_CUR);
                printf("GPGGA时间为：");
                for (i=0;i<6;i++){
                    fscanf(p,"%c",&time[i]);
                    printf("%c",time[i]);
                }
                fprintf(t,"%s,",time);
                fseek(p, 0L, SEEK_SET);
                printf("\n");
                
                
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

    char DLOfGPRMCNumber[24],DLOfGPGGANumber[24];
    FILE *f,*p,*t;
    f = fopen ("GPS.txt","r+");
    p = fopen ("GPS.txt","r+");
    t = fopen ("GPS.csv","w"); 
    printf("请输入查询的行数：");
    scanf("%d",&k);
    if (f==NULL&&p==NULL){
        printf("文件打卡失败!\n");
    }
    else {
    	for(n=0;n<k;n++){
	    	fseek(f, 16+n*125L, SEEK_CUR);
	    	printf("GPRMC:");
	        for (i=0;i<22;i++){
	            fscanf(f,"%c",&DLOfGPRMCNumber[i]);
	            printf("%c",DLOfGPRMCNumber[i]);
	        }
	        fseek(f,0L,SEEK_SET);
	        printf("\n");
	        fseek(f, 16+n*125L, SEEK_CUR);
	        fprintf(t,"%s\n",DLOfGPRMCNumber);
	        fseek(f,0L,SEEK_SET);
	        fseek(p, 78+n*125L, SEEK_CUR);
	    	printf("GPGGA：");
	        for (i=0;i<22;i++){
	            fscanf(p,"%c",&DLOfGPGGANumber[i]);
	            printf("%c",DLOfGPGGANumber[i]);
	        }
	        fseek(p,0L,SEEK_SET); 
	        printf("\n");
	        fseek(p, 78+n*125L, SEEK_CUR);
	        fprintf(t,"%s\n",DLOfGPGGANumber);
	        fseek(p,0L,SEEK_SET); 
		} 
        fclose(f);
        fclose(p);
    }
    return 0;
	}
}
