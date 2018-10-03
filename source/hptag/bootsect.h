#ifndef __BOOTSECT_H__
#define __BOOTSECT_H__

#include <windows.h>
#include <stdio.h>
#include <ctype.h>

DWORD dump_sector(char *filename);
char get_drive();
void set_drive(char drive);
int check_drive();
int is_sector_bootable();
DWORD read_sector();
DWORD write_sector();
void patch_sector();

#endif // __BOOTSECT_H__
