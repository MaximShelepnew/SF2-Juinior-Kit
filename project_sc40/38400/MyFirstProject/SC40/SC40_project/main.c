#include "drivers/mss_gpio/mss_gpio.h"
#include "CMSIS/system_m2sxxx.h"
#include "mss_uart.h"
 #define logo \
"\n\r \************************************************ \n\r \
  Welcome to SmartFusion2 and SoftConsole v4.0 \n\r \
************************************************ \n\r \n\r "

/*==============================================================================
  Private functions.
 */
static void delay(void);

/*==============================================================================
 * main() function.
 */
int main()
{
    MSS_GPIO_init();
    MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE );

    size_t rx_size;
    uint8_t rx_buff[1];

	MSS_UART_init	(&g_mss_uart0,

	// ¬ыберите скорость на которую настроен ваш HC-06

			MSS_UART_38400_BAUD,  // MSS_UART_115200_BAUD,
			MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );

	MSS_UART_polled_tx_string( &g_mss_uart0, (const uint8_t *)logo);
	MSS_UART_polled_tx_string(&g_mss_uart0,(const uint8_t*)" Hello, World!! \n\r \n\r") ;

    for(;;)
    {
        uint32_t gpio_pattern;
        delay();
        gpio_pattern = MSS_GPIO_get_outputs();
        gpio_pattern ^= 0xFFFFFFFF;
        MSS_GPIO_set_outputs( gpio_pattern );

		rx_size = MSS_UART_get_rx(&g_mss_uart0, rx_buff, sizeof(rx_buff));
		if( rx_size > 0 )
			MSS_UART_polled_tx(&g_mss_uart0, rx_buff, sizeof(rx_buff));


    }
}
/*==============================================================================
  Delay between displays of the watchdog counter value.
 */
static void delay(void)
{
    volatile uint32_t delay_count = SystemCoreClock / 128u;

    while(delay_count > 0u)
    {
        --delay_count;
    }
}
