// zombie.c
// /*  loop to create many zombie proess, waitpid to kill*/
 #include <sys/types.h>
 //#include <signal.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <signal.h>

static void sig_child(int signo)
 {
      pid_t        pid;
      int        stat;
      //处理僵尸进程
      while ((pid = waitpid(-1, &stat, WNOHANG)) >0)
             printf("child %d terminated.\n", pid);
 }
 int main()
 {
     pid_t pid;
     while(1){
        signal(SIGCHLD,sig_child);
        pid= fork();
        
        if(pid < 0){
            printf("create child process error!\n");
        }
        else{
            if(pid==0){
                printf("child process %d, father process %d\n",getpid(),getppid());
                exit(0);
            }else{
                printf("current father process, child process:%d, father process:%d\n",getpid(),getppid());
                system("ps -o pid,ppid,state,tty,command\n");
                sleep (2);
            }
        }
     }

    return 0;
}


