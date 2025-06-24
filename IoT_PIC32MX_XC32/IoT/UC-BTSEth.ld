/* Default linker script, for normal executables */
OUTPUT_FORMAT("elf32-tradlittlemips")
OUTPUT_ARCH(pic32mx)
ENTRY(_reset)
/*
 * Provide for a minimum stack and heap size
 * - _min_stack_size - represents the minimum space that must be made
 *                     available for the stack.  Can be overridden from
 *                     the command line using the linker's --defsym option.
 * - _min_heap_size  - represents the minimum space that must be made
 *                     available for the heap.  Can be overridden from
 *                     the command line using the linker's --defsym option.
 */
EXTERN (_min_stack_size _min_heap_size)
PROVIDE(_min_stack_size = 0x400) ;
PROVIDE(_min_heap_size = 0) ;


/*************************************************************************
 * Processor-specific object file.  Contains SFR definitions.
 *************************************************************************/
INPUT("processor.o")

/*************************************************************************
 * For interrupt vector handling
 *************************************************************************/
PROVIDE(_vector_spacing = 0x00000001);
/* _ebase_address value must be same as the ORIGIN value of exception_mem (see below) */
_ebase_address = 0x9D006000;

/*************************************************************************
* Memory Address Equates
*************************************************************************/
/* Equate _RESET_ADDR to the ORIGIN value of kseg1_boot_mem (see below) */
_RESET_ADDR = (0x9D006000 + 0x1000 + 0x970);

/*Map _BEV_EXCPT_ADDR and _DBG_EXCPT_ADDR in to kseg1_boot_mem (see below) */
/* Place _BEV_EXCPT_ADDR at an offset of 0x380 to _RESET_ADDR */
/* Place _DBG_EXCPT_ADDR at an offset of 0x480 to _RESET_ADDR */

_BEV_EXCPT_ADDR = (0x9D006000 + 0x1000 + 0x970 + 0x380);
_DBG_EXCPT_ADDR = (0x9D006000 + 0x1000 + 0x970 + 0x480);

_DBG_CODE_ADDR = 0xBFC02000;
_DBG_CODE_SIZE = 0xFF0 ;
_GEN_EXCPT_ADDR = _ebase_address + 0x180;

/*************************************************************************
* Memory Regions
*
* Memory regions without attributes cannot be used for orphaned sections.
* Only sections specifically assigned to these regions can be allocated
* into these regions.
*************************************************************************/
MEMORY
{
/* IVT is mapped into the exception_mem. ORIGIN value of exception_mem must align with 4K
address boundary. Keep the default value for the length */

exception_mem : ORIGIN = 0x9D006000, LENGTH = 0x1000

/* Place kseg0_boot_mem adjacent to exception_mem. Keep the default value for the length */

kseg0_boot_mem : ORIGIN = (0x9D006000 + 0x1000), LENGTH = 0x970

/* C Start-up code is mapped into kseg1_boot_mem. Place kseg1_boot_mem adjacent to
kseg0_boot_mem. Keep the default value for the length */

kseg1_boot_mem : ORIGIN = (0x9D006000 + 0x1000 + 0x970), LENGTH = 0x490

/*All C files (Text and Data) are mapped into kseg0_program_mem. Place kseg0_program_mem
adjacent to kseg1_boot_mem. Change the length of kseg0_program_mem as required. In this
example, 512 KB Flash size is shrunk as follows: */

kseg0_program_mem (rx)  :ORIGIN = (0x9D006000 + 0x1000 + 0x970 + 0x490),
    LENGTH = (0x80000 - (0x1000 + 0x970 + 0x490))

  debug_exec_mem             : ORIGIN = 0xBFC02000, LENGTH = 0xFF0
  config3                    : ORIGIN = 0xBFC02FF0, LENGTH = 0x4
  config2                    : ORIGIN = 0xBFC02FF4, LENGTH = 0x4
  config1                    : ORIGIN = 0xBFC02FF8, LENGTH = 0x4
  config0                    : ORIGIN = 0xBFC02FFC, LENGTH = 0x4
  kseg1_data_mem       (w!x) : ORIGIN = 0xA0000000, LENGTH = 0x20000
  sfrs                       : ORIGIN = 0xBF800000, LENGTH = 0x100000
  configsfrs                 : ORIGIN = 0xBFC02FF0, LENGTH = 0x10
}

/*************************************************************************
 * Configuration-word sections
 *************************************************************************/
SECTIONS
{
  /* Boot Sections */
  .reset _RESET_ADDR :
  {
    KEEP(*(.reset))
    KEEP(*(.reset.startup))
  } > kseg1_boot_mem
  .bev_excpt _BEV_EXCPT_ADDR :
  {
    KEEP(*(.bev_handler))
  } > kseg1_boot_mem
