#include "bootsect.h"

#define PATCH_CODE_SIZE 14
const unsigned char PATCH_CODE[PATCH_CODE_SIZE] = { 0x2E, 0x2E, 0x2E, 0x0D, 0x0A, 0x00, 0x52, 0x45, 0x43, 0x4F, 0x56, 0x45, 0x52, 0x59 };

#define DRIVE_CODE_SIZE 7
char dsk[DRIVE_CODE_SIZE] = "\\\\.\\?:\0";

#define SECTOR_SIZE 512
unsigned char sector_data[SECTOR_SIZE];

int is_sector_bootable() {
	return (sector_data[0x1FE] == 0x55 && sector_data[0x1FF] == 0xAA);
}

char get_drive() {
	return dsk[4];
}

void set_drive(char drive) {
	dsk[4] = toupper(drive);
}

int check_drive() {
	char drive[4] = { 0x00, 0x3A, 0x5C, 0x00 };
	drive[0] = get_drive();
	return GetDriveType( drive ) == DRIVE_FIXED;
}

DWORD sector_handle(int is_write) {
	DWORD dwOutput = 0;
	DWORD dwDesiredAccess = (is_write ? GENERIC_WRITE : GENERIC_READ);	
	HANDLE hDisk = CreateFile(dsk, dwDesiredAccess, FILE_SHARE_VALID_FLAGS, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hDisk != INVALID_HANDLE_VALUE)
	{
		SetFilePointer(hDisk, 0, 0, FILE_BEGIN);
		if (is_write) {
			WriteFile(hDisk, &sector_data, SECTOR_SIZE, &dwOutput, NULL);
		} else {
			ReadFile(hDisk, &sector_data, SECTOR_SIZE, &dwOutput, NULL);
		}
		CloseHandle(hDisk);
	}	
	return dwOutput;
}

DWORD read_sector() {
	return sector_handle(0);
}

DWORD write_sector() {
	return sector_handle(1);
}

DWORD dump_sector(char *filename) {
	DWORD dwOutput = 0;
	HANDLE hFile = CreateFile(filename, GENERIC_WRITE, 0, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile != INVALID_HANDLE_VALUE)
	{
		WriteFile(hFile, &sector_data, SECTOR_SIZE, &dwOutput, NULL);
		CloseHandle(hFile);
	}	
	return dwOutput;
}

void patch_sector() {
	memcpy(&sector_data[0x1EA], &PATCH_CODE, PATCH_CODE_SIZE);
}
