#include "vcp_app.h"
#include "./CMSIS/mss_assert.h"
#include "drivers/mss_uart/mss_uart.h"

uint8_t g_greeting[] = "\n\r\n\rSmartFusion2 MSS USB Virtual COM-Port.\n\r \
\n\rСимволы нажатых клавиш будут отображаться в окнах терминалов\n\r\n\r";

uint8_t MMUART_0_greeting[] = "\n\r\n\rSmartFusion2 MSS MMUART COM-Port.\n\r \
\n\rСимволы нажатых клавиш будут отображаться в окнах терминалов\n\r\n\r";

#if defined(__GNUC__)
uint8_t receive_buf[512] __attribute__ ((aligned (4))) = {0x00u};
#elif defined(__ICCARM__)
#pragma data_alignment = 4
uint8_t receive_buf[512] = {0};
#elif defined(__CC_ARM)
__align(4) uint8_t receive_buf[512] = {0};
#endif

volatile uint32_t g_rx_count=0;
volatile uint32_t g_tx_count=0;

void receive_data_handler( uint32_t rx_count, uint32_t rx_err_status );

int main()
{
    VCP_init(MSS_USB_VCP_9600_BAUD, MSS_USB_VCP_ONE_STOP_BIT,
             MSS_USB_VCP_NO_PARITY, MSS_USB_VCP_DATA_8_BITS);

	MSS_UART_init	(&g_mss_uart0, MSS_UART_115200_BAUD,
			MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );

    while(VCP_HOST_APP_READY != VCP_configuration_state());

    VCP_rx_prepare(receive_buf, sizeof(receive_buf), receive_data_handler);
    VCP_tx(g_greeting, sizeof(g_greeting));
    MSS_UART_polled_tx_string( &g_mss_uart0, (const uint8_t *)MMUART_0_greeting);

    size_t rx_size;
    uint8_t rx_buff[3];
    for(;;)
    {
        if(g_rx_count)
        {
            VCP_tx(receive_buf, g_rx_count);
            MSS_UART_polled_tx(&g_mss_uart0, receive_buf, g_rx_count);
            g_rx_count=0;
        }
        if((1 == VCP_tx_done()))
        {
            VCP_rx_prepare(receive_buf, sizeof(receive_buf), receive_data_handler);
        }
        rx_size = MSS_UART_get_rx(&g_mss_uart0, rx_buff, sizeof(rx_buff));
        if( rx_size > 0 )
        {
           	MSS_UART_polled_tx(&g_mss_uart0, rx_buff, sizeof(rx_buff));
           	VCP_tx(rx_buff, rx_size);
        }
    }
}

void
receive_data_handler
(
    uint32_t rx_count,
    uint32_t rx_err_status
)
{
    if(rx_err_status == 0)
    {
        if(rx_count)
        {
            g_rx_count = rx_count;
        }
        else
        {
            g_rx_count = 0;
            ASSERT(0);
        }
    }
    else
    {
        ASSERT(0);
    }
}
