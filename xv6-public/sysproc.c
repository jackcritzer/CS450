#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}


// alsoNice implementation
// increase time before releasing process lock by n times
// returns the number of ticks taken by the process if succesful
// returns -1 if n is invalid, errno is set
int
sys_alsonice(void)
{
  struct proc *p = myproc();
  int n;

  if(argint(0, &n) < 0)
    return -1;

  p->timeslice += n;
  if(p->timeslice < 1)
    p->timeslice = 1;
  return p->timeslice;
}


// hasPages implementation

int
sys_haspages(void)
{
  struct proc *p;
  int pid;
  pde_t *pgdir;
  pte_t *pte;

  if(argint(0, &pid) < 0)
    return 0;
  
  // get process with pid
  p = (struct proc*) findProc(pid);

  // process not found
  if(!p){
    cprintf("No process with PID %d", pid);
    return -1;
  }

  pgdir = p->pgdir;

  // top of process address space
  //uint top_process = 0xFFFFF000;

  // process segments
  uint data_text_end = p->data_text_end;
  uint stack_start = p->stack_start;
  uint heap_start = p->heap_start;

  cprintf("This process, %s, has the following pages:\n\n", (char *) p->name);
  cprintf("Virtual Address  |   Permissions   |   Segment\n\n");
  cprintf("----------------------------------------------\n\n");

  // iterate thru page directory, i points at current page offset
  for(uint i=0; i < KERNBASE; i += PGSIZE) {

    // get page table entry
    pte = walkpgdir(pgdir, (void *) i, 0);

    // page not mapped or present bit not set, go to next page
    if(!pte || !(*pte & PTE_P))
      continue;

    // get permission bits
    int perm_bits = ((int)*pte) & 0x7;

    char perm_arr[3] = "";

    // check if R, W, U flags are set
    // if yes, add permission to array, else add -

    perm_bits & PTE_P ? add_char(perm_arr, 'R') : add_char(perm_arr, '-');

    perm_bits & PTE_W ? add_char(perm_arr, 'W') : add_char(perm_arr, '-');

    perm_bits & PTE_U ? add_char(perm_arr, 'U') : add_char(perm_arr, '-');


    // determine segment page is in
    char *segment = (char *) 0;

    // data/text segment
    if(i < data_text_end) {
        segment = "DATA/TEXT";
    }
    // guard page, skip
    else if (i < stack_start) {
        segment = "GUARD PAGE";
    }
    // stack page
    else if  (i < heap_start) {
        segment = "STACK";
    }
    // heap page
    else if (i >= heap_start && (perm_bits & PTE_U)) {
        segment = "HEAP";
    }
    // kernel page
    else if (i >= KERNBASE) {
        segment = "KERNEL";
    }

    cprintf(" %x            |       %s        |    %s\n", i, perm_arr, segment);
  }

  cprintf("----------------------------------------------\n\n");

  return 1;
}

void add_char (char *str, char c)
  {
    for (;*str;str++);
    *str++ = c; 
    *str++ = 0;
  }