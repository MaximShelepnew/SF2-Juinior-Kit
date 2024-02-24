/*******************************************************************************
 * (c) Copyright 2011 Microsemi Corporation.  All rights reserved.
 *
 * SmartFusion IEEE1588 Reference Design.
 *
 * The SmartFusion™ IEEE1588 Reference Design demonstrates the use of Core1588
 * IP core on a SmartFusion device as part of an IEEE1588 over Ethernet boundary
 * clock implementation. This reference design is targeted at the SmartFusion
 * Evaluation Board.
 *
 * The SmartFusion™ IEEE1588 Reference Design demonstrates the following
 * Core1588 IP features:
 *  - IEEE1588 Ethernet packets time stamping
 *  - Synchronization of the precision time clock with a master clock
 *  - Latching of the master synchronized time on input latch assertion
 *  - Triggering output pulses when the synchronized clock reaches specified values
 *
 * The reference design includes a web server allowing observing the current
 * state of the Precision Time Protocol (PTP) clock and exercise the Core1588
 * input latches and output triggers.
 *
 * This project is derived from the Microsemi A2F200M3 Demo project available
 * from http://www.freertos.org
 *
 */

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"

/* lwIP includes. */
#include "lwip/tcpip.h"
#include "lwip/dhcp.h"

/* CMSIS includes */
#include "system_m2sxxx.h"

/* Driver includes */
#include "mss_uart.h"
#include "mss_timer.h"
#include "mss_gpio.h"
//#include "mss_spi.h"

#include "stdint.h"

/* Priorities used by the various different tasks. */
#define mainuIP_TASK_PRIORITY        ( tskIDLE_PRIORITY + 2 )
#define mainPTPD_TASK_PRIORITY      ( configMAX_PRIORITIES - 1 )

/* Precision Time Protocol task stack size. */
#define ptpd_STACK_SIZE             ( configMINIMAL_STACK_SIZE + 128 )

/* The WEB server uses string handling functions, which in turn use a bit more
stack than most of the other tasks. */
#define mainuIP_STACK_SIZE            ( configMINIMAL_STACK_SIZE * 3 )

/* A zero block time. */
#define mainDONT_BLOCK                ( 0UL )

/* Web server task stack size. */
#define HTTPD_STACK_SIZE         1400
//#define CONFIG_PHY_MODE_1 (0x40028000 + 0x2028)
/*-----------------------------------------------------------*/

/*
 * Setup the NVIC, LED outputs, and button inputs.
 */
static void prvSetupHardware( void );

/*
 * Ethernet interface configuration function.
 */
static void prvEthernetConfigureInterface(void * param);

/*-----------------------------------------------------------*/
extern void delay ( volatile unsigned int n);

/* The queue used by PTPd task to trnsmit status information to webserver task. */
xQueueHandle xPTPdOutQueue = NULL;

/* lwIP MAC configuration. */
static struct netif s_EMAC_if;
/* File system. */



/*-----------------------------------------------------------*/
void http_server_netconn_thread(void *arg);
/*-----------------------------------------------------------*/

int main(void)
{
	/*turn off the watchdog*/
	SYSREG->WDOG_CR = 0;


	MSS_UART_init( &g_mss_uart0, MSS_UART_115200_BAUD,
			MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );


	/* Configure external clocks synthesizer. */
	//__asm("BKPT 0x45");
	{
		volatile uint32_t test_delay = 10000u;
		while(test_delay != 0u)
		{
			--test_delay;
		}
	}
	//    configure_zl30362();
	/*
    {
        volatile uint32_t wait = 1;
        while(wait)
        {
            ;
        }
    }
	 */
			printf("\n\r*************************************************************************\n\r");
            printf("\r##            Welcome to  SmartFusion2 Webserver TCP  Demo            ##\r");
            printf("\n\r*************************************************************************\n\r");
            printf("\r##             Initializing the MAC and getting IP Address            ##\r");
            printf("\n\r*************************************************************************\n\r");


	/* Configure the NVIC, LED outputs and button inputs. */
	//SystemCoreClockUpdate();
	prvSetupHardware();


	//SYSREG->CC_CR =1;
	//SYSREG->CC_REGION_CR = 1;

	/* Create the web server task. */
	tcpip_init( prvEthernetConfigureInterface, NULL );
	xTaskCreate( http_server_netconn_thread,
			( signed char * ) "http_server",
			HTTPD_STACK_SIZE,
			NULL,
			mainuIP_TASK_PRIORITY,
			NULL );




	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	/* If all is well, the scheduler will now be running, and the following line
    will never be reached.  If the following line does execute, then there was
    insufficient FreeRTOS heap memory available for the idle and/or timer tasks
    to be created.  See the memory management section on the FreeRTOS web site
    for more details. */
	for( ;; );
}

/*-----------------------------------------------------------*/
static void prvSetupHardware( void )
{
    /*turn off the watchdog*/
		SYSREG->WDOG_CR = 0; // èç 1
		SystemCoreClockUpdate();
		SYSREG->CC_CR = 1u; // èç 1
// èç 1
		MSS_GPIO_init();
		MSS_GPIO_config( MSS_GPIO_0,  MSS_GPIO_OUTPUT_MODE);
        MSS_GPIO_config( MSS_GPIO_1,  MSS_GPIO_OUTPUT_MODE);
        MSS_GPIO_config( MSS_GPIO_2, MSS_GPIO_OUTPUT_MODE);
        MSS_GPIO_config( MSS_GPIO_3, MSS_GPIO_OUTPUT_MODE);
  //      MSS_GPIO_config( MSS_GPIO_4, MSS_GPIO_OUTPUT_MODE);
 //       MSS_GPIO_config( MSS_GPIO_5, MSS_GPIO_OUTPUT_MODE);
 //       MSS_GPIO_config( MSS_GPIO_6, MSS_GPIO_OUTPUT_MODE);
//       MSS_GPIO_config( MSS_GPIO_7, MSS_GPIO_OUTPUT_MODE);
        MSS_GPIO_set_outputs(0x0002);

    /* Disable the Watch Dog Timer */
}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* Called if a call to pvPortMalloc() fails because there is insufficient
    free memory available in the FreeRTOS heap.  pvPortMalloc() is called
    internally by FreeRTOS API functions that create tasks, queues, software
    timers, and semaphores.  The size of the FreeRTOS heap is set by the
    configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
    configconfigCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
    function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
	volatile size_t xFreeStackSpace;

	/* This function is called on each cycle of the idle task.  In this case it
    does nothing useful, other than report the amount of FreeRTOS heap that
    remains unallocated. */
	xFreeStackSpace = xPortGetFreeHeapSize();

	if( xFreeStackSpace > 100 )
	{
		/* By now, the kernel has allocated everything it is going to, so
        if there is a lot of heap remaining unallocated then
        the value of configTOTAL_HEAP_SIZE in FreeRTOSConfig.h can be
        reduced accordingly. */
	}
}


/*-----------------------------------------------------------*/

void vMainConfigureTimerForRunTimeStats( void )
{
	const unsigned long ulMax32BitValue = 0xffffffffUL;

	MSS_TIM64_init( MSS_TIMER_PERIODIC_MODE );
	MSS_TIM64_load_immediate( ulMax32BitValue, ulMax32BitValue );
	MSS_TIM64_start();
}
/*-----------------------------------------------------------*/

unsigned long ulGetRunTimeCounterValue( void )
{
	unsigned long long ullCurrentValue = 0u;
	const unsigned long long ulMax64BitValue = 0xffffffffffffffffULL;
	unsigned long *pulHighWord, *pulLowWord;

	pulHighWord = ( unsigned long * ) &ullCurrentValue;
	pulLowWord = pulHighWord++;

	MSS_TIM64_get_current_value( ( uint32_t * ) pulHighWord, ( uint32_t * ) pulLowWord );

	//Convert the down count into an upcount.
	ullCurrentValue = ulMax64BitValue - ullCurrentValue;

	//  Scale to a 32bit number of suitable frequency.
	ullCurrentValue >>= 13;

	// Just return 32 bits.
	return ( unsigned long ) ullCurrentValue;
}
/*-----------------------------------------------------------*/

static void prvEthernetConfigureInterface(void * param)
{
	struct ip_addr xIpAddr, xNetMast, xGateway;
	extern err_t ethernetif_init( struct netif *netif );

	/* Parameters are not used - suppress compiler error. */
	( void ) param;

	/* Create and configure the EMAC interface. */
#ifdef NET_USE_DHCP
	IP4_ADDR( &xIpAddr, 0, 0, 0, 0 );
	IP4_ADDR( &xGateway, 10, 69, 0, 1 ); // IP4_ADDR( &xGateway, 192, 168, 1, 254 );
#else
	IP4_ADDR( &xIpAddr, 10, 69, 0, 101 );   // IP4_ADDR( &xIpAddr, 169, 254, 1, 23 );
	IP4_ADDR( &xGateway, 10, 69, 0, 1 );  // IP4_ADDR( &xGateway, 169, 254, 1, 23 );
#endif

	IP4_ADDR( &xNetMast, 255, 255, 255, 0 );

	netif_add( &s_EMAC_if, &xIpAddr, &xNetMast, &xGateway, NULL, ethernetif_init, tcpip_input );

	/* bring it up */

#ifdef NET_USE_DHCP
	dhcp_start(&s_EMAC_if);
#else
	netif_set_up(&s_EMAC_if);
#endif

	/* make it the default interface */
	netif_set_default(&s_EMAC_if);
}

uint32_t get_ip_address(void)
{
	return (uint32_t)(s_EMAC_if.ip_addr.addr);
}

void get_mac_address(uint8_t * mac_addr)
{
	uint32_t inc;

	for(inc = 0; inc < 6; ++inc)
	{
		mac_addr[inc] = s_EMAC_if.hwaddr[inc];
	}
}
void led_test()
{
    uint32_t gpio_pattern;
    int i=1;

    gpio_pattern = MSS_GPIO_get_outputs();
    for(i=1;i<256;i++)
    {
    MSS_GPIO_set_outputs( i);
    gpio_pattern = MSS_GPIO_get_outputs();
    delay(100000);
    }
    /*This delay is required to distinguish the ON and OFF of LEDs */

    return;
}
void delay ( volatile unsigned int n)
{
	while(n!=0)
	{
		n--;
	}
}
