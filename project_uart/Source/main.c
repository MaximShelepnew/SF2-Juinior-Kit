#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_i2c/mss_i2c.h"
#include "drivers_config/sys_config/sys_config.h"
#include "string.h"

#define MSS_I2C_MASTER &g_mss_i2c0
#define MSS_MASTER_SER_ADDR  0x20
#define DEMO_I2C_TIMEOUT 3000u

mss_i2c_clock_divider_t clock_speed = MSS_I2C_PCLK_DIV_160; //MSS_I2C_PCLK_DIV_60
uint8_t Comp_buf[12];
uint8_t AG_buf[14];
uint8_t uart_tx_buf[24]; //static
uint8_t uart_rx_buf[2]; //static

mss_i2c_status_t mss_write_transaction(uint8_t, uint8_t *, uint16_t);
mss_i2c_status_t mss_read_transaction(uint8_t, uint8_t *, uint16_t);
mss_i2c_status_t mss_write_read_transaction(uint8_t, uint8_t *, uint16_t,uint8_t *, uint16_t);
mss_i2c_status_t I2C_writeU(uint8_t regAdr, uint8_t vbyte);
mss_i2c_status_t readcompass();
void fill_uart_tx_buf();


void delay(volatile uint32_t n);

mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;
uint8_t slave_address;
mss_i2c_status_t mss_instance;

size_t UART_Polled_Rx(mss_uart_instance_t * this_uart, uint8_t * rx_buff,
		size_t buff_size) {
	size_t rx_size = 0U;

	while (rx_size < buff_size) {
		while (((this_uart->hw_reg->LSR) & 0x1) != 0U) {
			rx_buff[rx_size] = this_uart->hw_reg->RBR;
			++rx_size;
		}
	}
	return rx_size;
}

/*------------------------------------------------------------------------------
 * main function.
 *------------------------------------------------------------------------------*/
int main(void) {
	uint8_t RegAdd[2];
	static uint8_t stateWorking;

	// ������������� UART
	MSS_UART_init(gp_my_uart, MSS_UART_115200_BAUD, MSS_UART_DATA_8_BITS
			      | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

	// ������������� I2�
	MSS_I2C_init(MSS_I2C_MASTER, MSS_MASTER_SER_ADDR, clock_speed);

	//�������� ����� bypass ��������������� ���������� Auxiliary I2C (ES_CL and ES_DA)
	slave_address = 0x68;
	mss_instance = I2C_writeU(0x37, 0x02);

	// �������� Continuous_measurement_mode_2 ������� (100 ��)
	slave_address = 0x0C;
	mss_instance = I2C_writeU(0x0A, 0x06);//������������ 2
	stateWorking = 0;
	while (1) {
		if (stateWorking == 0) { // ��������� ���������� ����� �������
			UART_Polled_Rx(gp_my_uart, uart_rx_buf, 1);
			if (uart_rx_buf[0] == 119)  {
				uart_tx_buf[0] = 121;
				MSS_UART_polled_tx(gp_my_uart, uart_tx_buf, 1);
				UART_Polled_Rx(gp_my_uart, uart_rx_buf, 1);
				if (uart_rx_buf[0] == 115)  stateWorking = 1; // ���������� �����������
			}
		}
		if (stateWorking == 1) { // ������� ����� - ����� MPU-9255
			while (1) {
				// ������ ������ �� ��������� MPU-6555
				slave_address = 0x68;
				RegAdd[0]= 59;
				mss_instance = mss_write_read_transaction(slave_address, RegAdd, 1, AG_buf, 14);

				// ������ ������ �� ��������� AK8963
				mss_instance = readcompass();
				// ���������� ������ ���������� �� MPU-6555 � AK8963 � ������ ������ ��� ������ �� UART
				fill_uart_tx_buf();
				if(MSS_I2C_SUCCESS == mss_instance)
				{
					MSS_UART_polled_tx(gp_my_uart, uart_tx_buf, 22);
				}
				else
				{
					MSS_UART_polled_tx ( gp_my_uart, (const uint8_t *)"F", 1 );
				}
				delay(600000);
			}
		}
	return 0;
	}
}

/*------------------------------------------------------------------------------
 * MSS I2C Master perform read transaction with parameters gathered from the GUI.
 *------------------------------------------------------------------------------*/
mss_i2c_status_t mss_read_transaction(uint8_t serial_addr, uint8_t * rx_buffer,
		uint16_t read_length) {
	mss_i2c_status_t status;

	MSS_I2C_read(MSS_I2C_MASTER, serial_addr, rx_buffer, read_length,
			MSS_I2C_RELEASE_BUS);

	status = MSS_I2C_wait_complete(MSS_I2C_MASTER, DEMO_I2C_TIMEOUT);

	return status;
}

/*------------------------------------------------------------------------------
 * MSS I2C Master perform write transaction with parameters gathered from the GUI.
 *-------------------------------------------------------------------------------*/
mss_i2c_status_t mss_write_transaction(uint8_t serial_addr,
		uint8_t * tx_buffer, uint16_t write_length) {
	mss_i2c_status_t status;

	MSS_I2C_write(MSS_I2C_MASTER, serial_addr, tx_buffer, write_length,
			MSS_I2C_RELEASE_BUS);

	status = MSS_I2C_wait_complete(MSS_I2C_MASTER, DEMO_I2C_TIMEOUT);

	return status;
}

/*------------------------------------------------------------------------------
 * MSS I2C Master perform write-read transaction with parameters gathered from
 * the GUI.
 *------------------------------------------------------------------------------*/
mss_i2c_status_t mss_write_read_transaction(uint8_t serial_addr,
		uint8_t * tx_buffer, uint16_t write_length, uint8_t * rx_buffer,
		uint16_t read_length) {
	mss_i2c_status_t status;

	MSS_I2C_write_read(MSS_I2C_MASTER, serial_addr, tx_buffer, write_length,
			rx_buffer, read_length, MSS_I2C_RELEASE_BUS);

	status = MSS_I2C_wait_complete(MSS_I2C_MASTER, DEMO_I2C_TIMEOUT);

	return status;
}

mss_i2c_status_t I2C_writeU(uint8_t regAdr, uint8_t vbyte) {
	mss_i2c_status_t status;
	uint8_t tx_buf[2];
	tx_buf[0] = regAdr;
	tx_buf[1] = vbyte;
	status = mss_write_transaction(slave_address, tx_buf, 2);
	return status;
}

mss_i2c_status_t readcompass() {
	mss_i2c_status_t status;
	uint8_t tx_buf[2];
	slave_address = 0x0C;
	tx_buf[0] = 0;
	// ���������� ������ ������
	status = mss_write_read_transaction(slave_address, tx_buf, 1, Comp_buf, 10);
	return status;
}

void fill_uart_tx_buf()
{
	uart_tx_buf[0] = 10;
	uart_tx_buf[1] = 13;

	uart_tx_buf[2] =  AG_buf[0];   //AX high
	uart_tx_buf[3] =  AG_buf[1];   //AX low
	uart_tx_buf[4] =  AG_buf[2];   //AY high
	uart_tx_buf[5] =  AG_buf[3];   //AY low
	uart_tx_buf[6] =  AG_buf[4];   //AZ high
	uart_tx_buf[7] =  AG_buf[5];   //AZ low
	uart_tx_buf[8] =  AG_buf[6];   //T high
	uart_tx_buf[9] =  AG_buf[7];   //T low
	uart_tx_buf[10] = AG_buf[8];   //GX high
	uart_tx_buf[11] = AG_buf[9];   //GX low
	uart_tx_buf[12] = AG_buf[10];  //GY high
	uart_tx_buf[13] = AG_buf[11];  //GY low
	uart_tx_buf[14] = AG_buf[12];  //GZ high
	uart_tx_buf[15] = AG_buf[13];  //GZ low

	uart_tx_buf[16] = Comp_buf[3];  //MX low
	uart_tx_buf[17] = Comp_buf[4];  //MX high
	uart_tx_buf[18] = Comp_buf[5];  //MY low
	uart_tx_buf[19] = Comp_buf[6];  //MY high
	uart_tx_buf[20] = Comp_buf[7];  //MZ low
	uart_tx_buf[21] = Comp_buf[8];  //MZ high
}

/* Function for delay */
void delay(volatile uint32_t n) {
	while (n != 0) {
		n--;
	}
}
