#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct options {
  int e;  
  int i;  
  int v;  
  int c;  
  int l;  
  int n;  

  int h;  
  int s;  
  int f;  
  int o;  
  int noOpt;
  int notOneFile;
} opt;

int parcer(int argc, char **argv, opt *Options);
int reader(opt Options, char *pattern, char *file);
