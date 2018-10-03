#include "bootsect.h"

#define PROGRAM_NAME 	"hptag"
#define BACKUP_NAME		"bootsect.bak"

void print_header() {
	printf("HP Recovery Boot Sector Tag, by SiZiOUS, 2015\r\n");	
	printf("Based on the work done by Snack, LaptoniC, and MSFN board.\r\n\r\n");
}

void print_help() {
	printf("Usage: %s <recovery_partition_drive_letter>", PROGRAM_NAME);
}

int is_valid_drive_letter(char *param) {
	int len = strlen(param);
	char drv = (len > 0) ? toupper(param[0]) : 0x00;
	if ( len == 1 || (len == 2 && param[1] == ':') ) {
		if (drv >= 'A' && drv <= 'Z') {
			return 1;
		}
	}
	return 0;
}

int main(int argc, char *argv[]) {
	// If a letter is passed, then try to use that drive
	if (argc > 1 && is_valid_drive_letter(argv[1])) {
		set_drive(argv[1][0]);
	} else {
		print_header();
		print_help();
		return 2;
	}
	
	// Check the drive letter
	if (!check_drive()) {
		print_header();
		fprintf(stderr, "ERROR: The drive %c doesn't exist.\r\n", get_drive());
		return 3;
	}
	
	// Try to read the boot sector
	if (read_sector()) {
		print_header();
		
		printf("Using drive %c:\r\n", get_drive());
		
		// Just for information, check if the sector is bootable
		if (!is_sector_bootable()) {
			printf("WARNING: Disk is NOT bootable!\r\n");
		} else {
			printf("\r\n");
		}
		
		// Make backup
		dump_sector( BACKUP_NAME );
		
		// Patch the read sector in memory
		patch_sector();
		
		// Write the patched sector in the disk
		write_sector();		
	} else {
		// Error when reading the sector... we don't have access!
		fprintf(stderr, "Please run this program in Administrator mode.\r\n");
		return 1;
	}
	
	printf("The recovery partition has been successfully tagged.\r\n");
	
	return 0;
}
