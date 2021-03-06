//
//  $Id: uart1.h 110 2008-10-11 00:21:58Z jcw $
//  $Revision: 110 $
//  $Author: jcw $
//  $Date: 2008-10-10 20:21:58 -0400 (Fri, 10 Oct 2008) $
//  $HeadURL: http://tinymicros.com/svn_public/arm/lpc2148_demo/trunk/uart/uart1.h $
//

#ifndef _UART1_H_
#define _UART1_H_

#include "FreeRTOS.h"
#include "queue.h"

signed portBASE_TYPE uart1Init (unsigned portLONG ulWantedBaud, unsigned portBASE_TYPE uxQueueLength);
void uart1Deinit (void);
signed portBASE_TYPE uart1GetChar (signed portCHAR *pcRxedChar, portTickType xBlockTime);
signed portBASE_TYPE uart1PutChar (signed portCHAR cOutChar, portTickType xBlockTime);
void uart1GetRxQueue (xQueueHandle *qh);

#endif
