/*
// TI File $Revision: 1.9 $
// Checkin $Date: 2014/10/23 02:21:01 $
//###########################################################################
//
// FILE:	F28335.cmd
//
// TITLE:	Linker Command File For F28335 Device
//
//###########################################################################
// $TI Release: DSP2833x/DSP2823x C/C++ Header Files V1.31 $
// $Release Date: August 4, 2009 $
//###########################################################################
*/

/* ======================================================
// For Code Composer Studio V2.2 and later
// ---------------------------------------
// In addition to this memory linker command file, 
// add the header linker command file directly to the project. 
// The header linker command file is required to link the
// peripheral structures to the proper locations within 
// the memory map.
//
// The header linker files are found in <base>\DSP2833x_Headers\cmd
//   
// For BIOS applications add:      DSP2833x_Headers_BIOS.cmd
// For nonBIOS applications add:   DSP2833x_Headers_nonBIOS.cmd    
========================================================= */

/* ======================================================
// For Code Composer Studio prior to V2.2
// --------------------------------------
// 1) Use one of the following -l statements to include the 
// header linker command file in the project. The header linker
// file is required to link the peripheral structures to the proper 
// locations within the memory map                                    */

/* Uncomment this line to include file only for non-BIOS applications */
/* -l DSP2833x_Headers_nonBIOS.cmd */

/* Uncomment this line to include file only for BIOS applications */
/* -l DSP2833x_Headers_BIOS.cmd */

/* 2) In your project add the path to <base>\DSP2833x_headers\cmd to the
   library search path under project->build options, linker tab, 
   library search path (-i).
/*========================================================= */

/* Define the memory block start/length for the F28335  
   PAGE 0 will be used to organize program sections
   PAGE 1 will be used to organize data sections

    Notes: 
          Memory blocks on F28335 are uniform (ie same
          physical memory) in both PAGE 0 and PAGE 1.  
          That is the same memory region should not be
          defined for both PAGE 0 and PAGE 1.
          Doing so will result in corruption of program 
          and/or data. 
          
          L0/L1/L2 and L3 memory blocks are mirrored - that is
          they can be accessed in high memory or low memory.
          For simplicity only one instance is used in this
          linker file. 
          
          Contiguous SARAM memory blocks can be combined 
          if required to create a larger memory block. 
 */


MEMORY
{
PAGE 0:    /* Program Memory */
           /* Memory (RAM/FLASH/OTP) blocks can be moved to PAGE1 for data allocation */

   ZONE0       : origin = 0x004000, length = 0x001000     /* XINTF zone 0 */
 /*  RAML0       : origin = 0x008000, length = 0x001000 */    /* on-chip RAM block L0 */
   RAML1       : origin = 0x008000, length = 0x002000     /* on-chip RAM block L1 */
/*   RAML2       : origin = 0x00A000, length = 0x001000 */    /* on-chip RAM block L2 */
/*   RAML3       : origin = 0x00B000, length = 0x001000 */    /* on-chip RAM block L3 */
   ZONE6       : origin = 0x0100000, length = 0x100000    /* XINTF zone 6 */ 
   ZONE7A      : origin = 0x0200000, length = 0x00FC00    /* XINTF zone 7 - program space */ 
/*   FLASHH      : origin = 0x300000, length = 0x008000 */    /* on-chip FLASH */
/*   FLASHG      : origin = 0x308000, length = 0x008000 */    /* on-chip FLASH */
/*   FLASHF      : origin = 0x310000, length = 0x008000 */    /* on-chip FLASH */
/*   FLASHE      : origin = 0x318000, length = 0x008000  */  /* on-chip FLASH */
/*   FLASHD      : origin = 0x320000, length = 0x008000 */    /* on-chip FLASH */
  /* FLASHC      : origin = 0x328000, length = 0x008000 */    /* on-chip FLASH */
 /*  FLASHA      : origin = 0x338000, length = 0x007F80*/     /* on-chip FLASH */
 

   list_head     : origin = 0x300100, length = 0x10
   mod_list      : origin = 0x300110, length = 0x190
   DR_list_head  : origin = 0x300300, length = 0x10
   DR_list       : origin = 0x300310, length = 0x190
 
   FLASHA      : origin = 0x300500, length = 0x035B00
   CSM_RSVD    : origin = 0x336F80, length = 0x000076     /* Part of FLASHA.  Program with all 0x0000 when CSM is in use. */
   BEGIN       : origin = 0x300000, length = 0x000002     /* Part of FLASHA.  Used for "boot to Flash" bootloader mode. */
   CSM_PWL     : origin = 0x33FFF8, length = 0x000008     /* Part of FLASHA.  CSM password locations in FLASHA */ 
  
   OTP         : origin = 0x380400, length = 0x000400     /* on-chip OTP */
   ADC_CAL     : origin = 0x380080, length = 0x000009     /* ADC_cal function in Reserved memory */
   
   IQTABLES    : origin = 0x3FE000, length = 0x000b50     /* IQ Math Tables in Boot ROM */
   IQTABLES2   : origin = 0x3FEB50, length = 0x00008c     /* IQ Math Tables in Boot ROM */  
   FPUTABLES   : origin = 0x3FEBDC, length = 0x0006A0     /* FPU Tables in Boot ROM */
   ROM         : origin = 0x3FF27C, length = 0x000D44     /* Boot ROM */        
   RESET       : origin = 0x3FFFC0, length = 0x000002     /* part of boot ROM  */
   VECTORS     : origin = 0x3FFFC2, length = 0x00003E     /* part of boot ROM  */

PAGE 1 :   /* Data Memory */
           /* Memory (RAM/FLASH/OTP) blocks can be moved to PAGE0 for program allocation */
           /* Registers remain on PAGE1                                                  */
   
   BOOT_RSVD   : origin = 0x000000, length = 0x000050     /* Part of M0, BOOT rom will use this for stack */
   RAMM0       : origin = 0x000050, length = 0x0003B0     /* on-chip RAM block M0 */
   RAMM1       : origin = 0x000400, length = 0x000400     /* on-chip RAM block M1 */
   SRAM	       : origin = 0x100000, length = 0x40000      /*�ⲿram 384k*/
   MY_FAST_RAM : origin = 0x00A000,length = 0x3000       /*���ٱ�������*/
   FFT_RAM     : origin = 0x00D000,length = 0x00C44      /*FFT*/
   MY_STACK	   : origin = 0x00e000,length = 0x2000       /*ϵͳ��ջ����*/
   ZONE7B      : origin = 0x20FC00, length = 0x000400     /* XINTF zone 7 - data space */
}

/* Allocate sections to memory blocks.
   Note:
         codestart user defined section in DSP28_CodeStartBranch.asm used to redirect code 
                   execution when booting to flash
         ramfuncs  user defined section to store functions that will be copied from Flash into RAM
*/ 
 
SECTIONS
{
 
   /* Allocate program areas: */
   .cinit              : > FLASHA      PAGE = 0
   .pinit              : > FLASHA      PAGE = 0
   .text               : > FLASHA      PAGE = 0
   codestart           : > BEGIN       PAGE = 0
   ramfuncs            : LOAD = FLASHA, 
                         RUN = RAML1, 
                         LOAD_START(_RamfuncsLoadStart),
                         LOAD_END(_RamfuncsLoadEnd),
                         RUN_START(_RamfuncsRunStart),
                         PAGE = 0

   csmpasswds          : > CSM_PWL     PAGE = 0
   csm_rsvd            : > CSM_RSVD    PAGE = 0
   
   /* Allocate uninitalized data sections: */
   .stack              : > RAMM1    PAGE = 1
   .ebss               : > SRAM        PAGE = 1
   .esysmem            : > RAMM1       PAGE = 1

   /* Initalized sections go in Flash */
   /* For SDFlash to program these, they must be allocated to page 0 */
   .econst             : > FLASHA      PAGE = 0
   .switch             : > FLASHA      PAGE = 0      

   /* Allocate IQ math areas: */
   IQmath              : > FLASHA      PAGE = 0                  /* Math Code */
   IQmathTables     : > IQTABLES,  PAGE = 0, TYPE = NOLOAD 
   
   /* Uncomment the section below if calling the IQNexp() or IQexp()
      functions from the IQMath.lib library in order to utilize the 
      relevant IQ Math table in Boot ROM (This saves space and Boot ROM 
      is 1 wait-state). If this section is not uncommented, IQmathTables2
      will be loaded into other memory (SARAM, Flash, etc.) and will take
      up space, but 0 wait-state is possible.
   */
   /*
   IQmathTables2    : > IQTABLES2, PAGE = 0, TYPE = NOLOAD 
   {
   
              IQmath.lib<IQNexpTable.obj> (IQmathTablesRam)
   
   }
   */
   
   FPUmathTables    : > FPUTABLES, PAGE = 0, TYPE = NOLOAD 
         
   
   /* Allocate 0x400 of XINTF Zone 7 to storing data */
   ZONE7DATA        : > ZONE7B,    PAGE = 1

   /* .reset is a standard section used by the compiler.  It contains the */ 
   /* the address of the start of _c_int00 for C Code.   /*
   /* When using the boot ROM this section and the CPU vector */
   /* table is not needed.  Thus the default type is set here to  */
   /* DSECT  */ 
   .reset              : > RESET,      PAGE = 0, TYPE = DSECT
   vectors             : > VECTORS     PAGE = 0, TYPE = DSECT
   
   /* Allocate ADC_cal function (pre-programmed by factory into TI reserved memory) */
   .adc_cal     : load = ADC_CAL,   PAGE = 0, TYPE = NOLOAD
    MY_MEM  	:  {} > MY_STACK  		PAGE 1     
    FAST_RAM  	        :{} > MY_FAST_RAM  	PAGE 1  
    FFTipcb             :>FFT_RAM PAGE=1 
    FFTmag              :>FFT_RAM  PAGE=1 
    MOD_LIST_ADDR	    :>mod_list           PAGE =0
    MOD_LIST_HEAD	    :>list_head          PAGE =0
    DR_LIST_ADDR	    :>DR_list            PAGE =0
    DR_LIST_HEAD	    :>DR_list_head       PAGE =0
}

/*
//===========================================================================
// End of file.
//===========================================================================
*/
