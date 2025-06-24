#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-C32_PIC32_ETH_SK_ETH795.mk)" "nbproject/Makefile-local-C32_PIC32_ETH_SK_ETH795.mk"
include nbproject/Makefile-local-C32_PIC32_ETH_SK_ETH795.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=C32_PIC32_ETH_SK_ETH795
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=serial.c Addon.c Helpers.c Delay.c TCP.c DNS.c UDP.c MAC.c ARP.c IP.c ETHPIC32ExtPhy.c IMCP.c Announce.c StackTsk.c Tick.c CustomHTTPApp.c HTTP2.c NBNS.c MPFS2.c ETHPIC32ExtPhySMSC8720.c PingTask.c UDPChangeIP.c Main.c NetworkConfig.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/serial.o ${OBJECTDIR}/Addon.o ${OBJECTDIR}/Helpers.o ${OBJECTDIR}/Delay.o ${OBJECTDIR}/TCP.o ${OBJECTDIR}/DNS.o ${OBJECTDIR}/UDP.o ${OBJECTDIR}/MAC.o ${OBJECTDIR}/ARP.o ${OBJECTDIR}/IP.o ${OBJECTDIR}/ETHPIC32ExtPhy.o ${OBJECTDIR}/IMCP.o ${OBJECTDIR}/Announce.o ${OBJECTDIR}/StackTsk.o ${OBJECTDIR}/Tick.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/HTTP2.o ${OBJECTDIR}/NBNS.o ${OBJECTDIR}/MPFS2.o ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o ${OBJECTDIR}/PingTask.o ${OBJECTDIR}/UDPChangeIP.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/NetworkConfig.o
POSSIBLE_DEPFILES=${OBJECTDIR}/serial.o.d ${OBJECTDIR}/Addon.o.d ${OBJECTDIR}/Helpers.o.d ${OBJECTDIR}/Delay.o.d ${OBJECTDIR}/TCP.o.d ${OBJECTDIR}/DNS.o.d ${OBJECTDIR}/UDP.o.d ${OBJECTDIR}/MAC.o.d ${OBJECTDIR}/ARP.o.d ${OBJECTDIR}/IP.o.d ${OBJECTDIR}/ETHPIC32ExtPhy.o.d ${OBJECTDIR}/IMCP.o.d ${OBJECTDIR}/Announce.o.d ${OBJECTDIR}/StackTsk.o.d ${OBJECTDIR}/Tick.o.d ${OBJECTDIR}/CustomHTTPApp.o.d ${OBJECTDIR}/HTTP2.o.d ${OBJECTDIR}/NBNS.o.d ${OBJECTDIR}/MPFS2.o.d ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d ${OBJECTDIR}/PingTask.o.d ${OBJECTDIR}/UDPChangeIP.o.d ${OBJECTDIR}/Main.o.d ${OBJECTDIR}/NetworkConfig.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/serial.o ${OBJECTDIR}/Addon.o ${OBJECTDIR}/Helpers.o ${OBJECTDIR}/Delay.o ${OBJECTDIR}/TCP.o ${OBJECTDIR}/DNS.o ${OBJECTDIR}/UDP.o ${OBJECTDIR}/MAC.o ${OBJECTDIR}/ARP.o ${OBJECTDIR}/IP.o ${OBJECTDIR}/ETHPIC32ExtPhy.o ${OBJECTDIR}/IMCP.o ${OBJECTDIR}/Announce.o ${OBJECTDIR}/StackTsk.o ${OBJECTDIR}/Tick.o ${OBJECTDIR}/CustomHTTPApp.o ${OBJECTDIR}/HTTP2.o ${OBJECTDIR}/NBNS.o ${OBJECTDIR}/MPFS2.o ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o ${OBJECTDIR}/PingTask.o ${OBJECTDIR}/UDPChangeIP.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/NetworkConfig.o

# Source Files
SOURCEFILES=serial.c Addon.c Helpers.c Delay.c TCP.c DNS.c UDP.c MAC.c ARP.c IP.c ETHPIC32ExtPhy.c IMCP.c Announce.c StackTsk.c Tick.c CustomHTTPApp.c HTTP2.c NBNS.c MPFS2.c ETHPIC32ExtPhySMSC8720.c PingTask.c UDPChangeIP.c Main.c NetworkConfig.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-C32_PIC32_ETH_SK_ETH795.mk ${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serial.o.d 
	@${RM} ${OBJECTDIR}/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/serial.o.d" -o ${OBJECTDIR}/serial.o serial.c  
	
${OBJECTDIR}/Addon.o: Addon.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Addon.o.d 
	@${RM} ${OBJECTDIR}/Addon.o 
	@${FIXDEPS} "${OBJECTDIR}/Addon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Addon.o.d" -o ${OBJECTDIR}/Addon.o Addon.c  
	
${OBJECTDIR}/Helpers.o: Helpers.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Helpers.o.d 
	@${RM} ${OBJECTDIR}/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Helpers.o.d" -o ${OBJECTDIR}/Helpers.o Helpers.c  
	
${OBJECTDIR}/Delay.o: Delay.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Delay.o.d 
	@${RM} ${OBJECTDIR}/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Delay.o.d" -o ${OBJECTDIR}/Delay.o Delay.c  
	
${OBJECTDIR}/TCP.o: TCP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TCP.o.d 
	@${RM} ${OBJECTDIR}/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/TCP.o.d" -o ${OBJECTDIR}/TCP.o TCP.c  
	
${OBJECTDIR}/DNS.o: DNS.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DNS.o.d 
	@${RM} ${OBJECTDIR}/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/DNS.o.d" -o ${OBJECTDIR}/DNS.o DNS.c  
	
${OBJECTDIR}/UDP.o: UDP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UDP.o.d 
	@${RM} ${OBJECTDIR}/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/UDP.o.d" -o ${OBJECTDIR}/UDP.o UDP.c  
	
${OBJECTDIR}/MAC.o: MAC.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC.o.d 
	@${RM} ${OBJECTDIR}/MAC.o 
	@${FIXDEPS} "${OBJECTDIR}/MAC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/MAC.o.d" -o ${OBJECTDIR}/MAC.o MAC.c  
	
${OBJECTDIR}/ARP.o: ARP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ARP.o.d 
	@${RM} ${OBJECTDIR}/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ARP.o.d" -o ${OBJECTDIR}/ARP.o ARP.c  
	
${OBJECTDIR}/IP.o: IP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IP.o.d 
	@${RM} ${OBJECTDIR}/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/IP.o.d" -o ${OBJECTDIR}/IP.o IP.c  
	
${OBJECTDIR}/ETHPIC32ExtPhy.o: ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhy.o ETHPIC32ExtPhy.c  
	
${OBJECTDIR}/IMCP.o: IMCP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IMCP.o.d 
	@${RM} ${OBJECTDIR}/IMCP.o 
	@${FIXDEPS} "${OBJECTDIR}/IMCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/IMCP.o.d" -o ${OBJECTDIR}/IMCP.o IMCP.c  
	
${OBJECTDIR}/Announce.o: Announce.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Announce.o.d 
	@${RM} ${OBJECTDIR}/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Announce.o.d" -o ${OBJECTDIR}/Announce.o Announce.c  
	
${OBJECTDIR}/StackTsk.o: StackTsk.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/StackTsk.o.d" -o ${OBJECTDIR}/StackTsk.o StackTsk.c  
	
${OBJECTDIR}/Tick.o: Tick.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tick.o.d 
	@${RM} ${OBJECTDIR}/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Tick.o.d" -o ${OBJECTDIR}/Tick.o Tick.c  
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	@${FIXDEPS} "${OBJECTDIR}/CustomHTTPApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c  
	
${OBJECTDIR}/HTTP2.o: HTTP2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/HTTP2.o.d" -o ${OBJECTDIR}/HTTP2.o HTTP2.c  
	
${OBJECTDIR}/NBNS.o: NBNS.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NBNS.o.d 
	@${RM} ${OBJECTDIR}/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/NBNS.o.d" -o ${OBJECTDIR}/NBNS.o NBNS.c  
	
${OBJECTDIR}/MPFS2.o: MPFS2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/MPFS2.o.d" -o ${OBJECTDIR}/MPFS2.o MPFS2.c  
	
${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o: ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o ETHPIC32ExtPhySMSC8720.c  
	
${OBJECTDIR}/PingTask.o: PingTask.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PingTask.o.d 
	@${RM} ${OBJECTDIR}/PingTask.o 
	@${FIXDEPS} "${OBJECTDIR}/PingTask.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/PingTask.o.d" -o ${OBJECTDIR}/PingTask.o PingTask.c  
	
${OBJECTDIR}/UDPChangeIP.o: UDPChangeIP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UDPChangeIP.o.d 
	@${RM} ${OBJECTDIR}/UDPChangeIP.o 
	@${FIXDEPS} "${OBJECTDIR}/UDPChangeIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/UDPChangeIP.o.d" -o ${OBJECTDIR}/UDPChangeIP.o UDPChangeIP.c  
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c  
	
${OBJECTDIR}/NetworkConfig.o: NetworkConfig.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkConfig.o.d 
	@${RM} ${OBJECTDIR}/NetworkConfig.o 
	@${FIXDEPS} "${OBJECTDIR}/NetworkConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/NetworkConfig.o.d" -o ${OBJECTDIR}/NetworkConfig.o NetworkConfig.c  
	
else
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serial.o.d 
	@${RM} ${OBJECTDIR}/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/serial.o.d" -o ${OBJECTDIR}/serial.o serial.c  
	
${OBJECTDIR}/Addon.o: Addon.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Addon.o.d 
	@${RM} ${OBJECTDIR}/Addon.o 
	@${FIXDEPS} "${OBJECTDIR}/Addon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Addon.o.d" -o ${OBJECTDIR}/Addon.o Addon.c  
	
${OBJECTDIR}/Helpers.o: Helpers.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Helpers.o.d 
	@${RM} ${OBJECTDIR}/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Helpers.o.d" -o ${OBJECTDIR}/Helpers.o Helpers.c  
	
${OBJECTDIR}/Delay.o: Delay.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Delay.o.d 
	@${RM} ${OBJECTDIR}/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Delay.o.d" -o ${OBJECTDIR}/Delay.o Delay.c  
	
${OBJECTDIR}/TCP.o: TCP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TCP.o.d 
	@${RM} ${OBJECTDIR}/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/TCP.o.d" -o ${OBJECTDIR}/TCP.o TCP.c  
	
${OBJECTDIR}/DNS.o: DNS.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DNS.o.d 
	@${RM} ${OBJECTDIR}/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/DNS.o.d" -o ${OBJECTDIR}/DNS.o DNS.c  
	
${OBJECTDIR}/UDP.o: UDP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UDP.o.d 
	@${RM} ${OBJECTDIR}/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/UDP.o.d" -o ${OBJECTDIR}/UDP.o UDP.c  
	
${OBJECTDIR}/MAC.o: MAC.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC.o.d 
	@${RM} ${OBJECTDIR}/MAC.o 
	@${FIXDEPS} "${OBJECTDIR}/MAC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/MAC.o.d" -o ${OBJECTDIR}/MAC.o MAC.c  
	
${OBJECTDIR}/ARP.o: ARP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ARP.o.d 
	@${RM} ${OBJECTDIR}/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ARP.o.d" -o ${OBJECTDIR}/ARP.o ARP.c  
	
${OBJECTDIR}/IP.o: IP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IP.o.d 
	@${RM} ${OBJECTDIR}/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/IP.o.d" -o ${OBJECTDIR}/IP.o IP.c  
	
${OBJECTDIR}/ETHPIC32ExtPhy.o: ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhy.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhy.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhy.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhy.o ETHPIC32ExtPhy.c  
	
${OBJECTDIR}/IMCP.o: IMCP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IMCP.o.d 
	@${RM} ${OBJECTDIR}/IMCP.o 
	@${FIXDEPS} "${OBJECTDIR}/IMCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/IMCP.o.d" -o ${OBJECTDIR}/IMCP.o IMCP.c  
	
${OBJECTDIR}/Announce.o: Announce.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Announce.o.d 
	@${RM} ${OBJECTDIR}/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Announce.o.d" -o ${OBJECTDIR}/Announce.o Announce.c  
	
${OBJECTDIR}/StackTsk.o: StackTsk.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/StackTsk.o.d" -o ${OBJECTDIR}/StackTsk.o StackTsk.c  
	
${OBJECTDIR}/Tick.o: Tick.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tick.o.d 
	@${RM} ${OBJECTDIR}/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Tick.o.d" -o ${OBJECTDIR}/Tick.o Tick.c  
	
${OBJECTDIR}/CustomHTTPApp.o: CustomHTTPApp.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o.d 
	@${RM} ${OBJECTDIR}/CustomHTTPApp.o 
	@${FIXDEPS} "${OBJECTDIR}/CustomHTTPApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/CustomHTTPApp.o.d" -o ${OBJECTDIR}/CustomHTTPApp.o CustomHTTPApp.c  
	
${OBJECTDIR}/HTTP2.o: HTTP2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HTTP2.o.d 
	@${RM} ${OBJECTDIR}/HTTP2.o 
	@${FIXDEPS} "${OBJECTDIR}/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/HTTP2.o.d" -o ${OBJECTDIR}/HTTP2.o HTTP2.c  
	
${OBJECTDIR}/NBNS.o: NBNS.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NBNS.o.d 
	@${RM} ${OBJECTDIR}/NBNS.o 
	@${FIXDEPS} "${OBJECTDIR}/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/NBNS.o.d" -o ${OBJECTDIR}/NBNS.o NBNS.c  
	
${OBJECTDIR}/MPFS2.o: MPFS2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MPFS2.o.d 
	@${RM} ${OBJECTDIR}/MPFS2.o 
	@${FIXDEPS} "${OBJECTDIR}/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/MPFS2.o.d" -o ${OBJECTDIR}/MPFS2.o MPFS2.c  
	
${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o: ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d 
	@${RM} ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o 
	@${FIXDEPS} "${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o.d" -o ${OBJECTDIR}/ETHPIC32ExtPhySMSC8720.o ETHPIC32ExtPhySMSC8720.c  
	
${OBJECTDIR}/PingTask.o: PingTask.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PingTask.o.d 
	@${RM} ${OBJECTDIR}/PingTask.o 
	@${FIXDEPS} "${OBJECTDIR}/PingTask.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/PingTask.o.d" -o ${OBJECTDIR}/PingTask.o PingTask.c  
	
${OBJECTDIR}/UDPChangeIP.o: UDPChangeIP.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UDPChangeIP.o.d 
	@${RM} ${OBJECTDIR}/UDPChangeIP.o 
	@${FIXDEPS} "${OBJECTDIR}/UDPChangeIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/UDPChangeIP.o.d" -o ${OBJECTDIR}/UDPChangeIP.o UDPChangeIP.c  
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.c  
	
${OBJECTDIR}/NetworkConfig.o: NetworkConfig.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkConfig.o.d 
	@${RM} ${OBJECTDIR}/NetworkConfig.o 
	@${FIXDEPS} "${OBJECTDIR}/NetworkConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DCFG_INCLUDE_PIC32_ETH_SK_ETH795 -Wall -MMD -MF "${OBJECTDIR}/NetworkConfig.o.d" -o ${OBJECTDIR}/NetworkConfig.o NetworkConfig.c  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=16000,--defsym=_min_stack_size=2048,-Map="$(BINDIR_)$(TARGETBASE).map" 
else
${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=16000,--defsym=_min_stack_size=2048,-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}\\pic32-bin2hex ${DISTDIR}/IoT-TCP-CAN-Web.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
