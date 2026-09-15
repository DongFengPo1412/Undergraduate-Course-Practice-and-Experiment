#include "main.h"
#include "RC522.H"

uint8_t UID[4], Temp[4];

uint8_t UI0[4] = {0xFF, 0xFF, 0xFF, 0xFF}; // ��0ID��
uint8_t UI1[4] = {0xFF, 0xFF, 0xFF, 0xFF}; // ��1ID��
uint8_t UI2[4] = {0xFF, 0xFF, 0xFF, 0xFF}; // ��2ID��
uint8_t UI3[4] = {0xFF, 0xFF, 0xFF, 0xFF}; // ��3ID��

// RC522�˿�GPIO��ʼ��
void PcdInit()
{

    GPIO_InitTypeDef GPIO_InitStruct = {0};

    /* GPIO Ports Clock Enable */
    __HAL_RCC_GPIOD_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    /* 配置初始输出电平 */
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15 | GPIO_PIN_8, GPIO_PIN_RESET);     // RST = PA15, NSS = PA8
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);                    // MOSI = PB15
    HAL_GPIO_WritePin(GPIOI, GPIO_PIN_1, GPIO_PIN_RESET);                   // SCK = PI1

    /* 配置 MISO 引脚为输入 */
    GPIO_InitStruct.Pin = GPIO_PIN_14;                     // MISO = PB14
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

    /* 配置 RST 引脚为输出 */
    GPIO_InitStruct.Pin = GPIO_PIN_15;                     // RST = PA15
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    /* 配置 NSS 引脚为输出 */
    GPIO_InitStruct.Pin = GPIO_PIN_8;                      // NSS = PA8
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    /* 配置 MOSI 引脚为输出 */
    GPIO_InitStruct.Pin = GPIO_PIN_15;                     // MOSI = PB15
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

    /* 配置 SCK 引脚为输出 */
    GPIO_InitStruct.Pin = GPIO_PIN_1;                      // SCK = PI1
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);


  /*Configure GPIO pins : PBPin PBPin PB6 PB7 */
  GPIO_InitStruct.Pin = MF522_SDA_Pin|MF522_MOSI_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
}

///////////////////////����ΪRC522��������/////////////////////////
///////////////////////����ΪRC522��������/////////////////////////
///////////////////////����ΪRC522��������/////////////////////////

// ��    �ܣ�Ѱ��
// ����˵��: req_code[IN]:Ѱ����ʽ
//                 0x52 = Ѱ��Ӧ�������з���14443A��׼�Ŀ�
//                 0x26 = Ѱδ��������״̬�Ŀ�
//           	  pTagType[OUT]����Ƭ���ʹ���
//                 0x4400 = Mifare_UltraLight
//                 0x0400 = Mifare_One(S50)
//                 0x0200 = Mifare_One(S70)
//                 0x0800 = Mifare_Pro(X)
//                 0x4403 = Mifare_DESFire
// ��    ��: �ɹ�����MI_OK
char PcdRequest(unsigned char req_code, unsigned char *pTagType)
{
    char status;
    unsigned int unLen;
    unsigned char ucComMF522Buf[MAXRLEN];
    //  unsigned char xTest ;
    ClearBitMask(Status2Reg, 0x08);
    WriteRawRC(BitFramingReg, 0x07);

    //  xTest = ReadRawRC(BitFramingReg);
    //  if(xTest == 0x07 )
    //   { LED_GREEN  =0 ;}
    // else {LED_GREEN =1 ;while(1){}}
    SetBitMask(TxControlReg, 0x03);

    ucComMF522Buf[0] = req_code;

    status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 1, ucComMF522Buf, &unLen);
    //     if(status  == MI_OK )
    //   { LED_GREEN  =0 ;}
    //   else {LED_GREEN =1 ;}
    if ((status == MI_OK) && (unLen == 0x10))
    {
        *pTagType = ucComMF522Buf[0];
        *(pTagType + 1) = ucComMF522Buf[1];
    }
    else
    {
        status = MI_ERR;
    }

    return status;
}

// ��    �ܣ�����ײ
// ����˵��: pSnr[OUT]:��Ƭ���кţ�4�ֽ�
// ��    ��: �ɹ�����MI_OK
char PcdAnticoll(unsigned char *pSnr)
{
    char status;
    unsigned char i, snr_check = 0;
    unsigned int unLen;
    unsigned char ucComMF522Buf[MAXRLEN];

    ClearBitMask(Status2Reg, 0x08);
    WriteRawRC(BitFramingReg, 0x00);
    ClearBitMask(CollReg, 0x80);

    ucComMF522Buf[0] = PICC_ANTICOLL1;
    ucComMF522Buf[1] = 0x20;

    status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 2, ucComMF522Buf, &unLen);

    if (status == MI_OK)
    {
        for (i = 0; i < 4; i++)
        {
            *(pSnr + i) = ucComMF522Buf[i];
            snr_check ^= ucComMF522Buf[i];
        }
        if (snr_check != ucComMF522Buf[i])
        {
            status = MI_ERR;
        }
    }

    SetBitMask(CollReg, 0x80);
    return status;
}

// ��    �ܣ�ѡ����Ƭ
// ����˵��: pSnr[IN]:��Ƭ���кţ�4�ֽ�
// ��    ��: �ɹ�����MI_OK
char PcdSelect(unsigned char *pSnr)
{
    char status;
    unsigned char i;
    unsigned int unLen;
    unsigned char ucComMF522Buf[MAXRLEN];

    ucComMF522Buf[0] = PICC_ANTICOLL1;
    ucComMF522Buf[1] = 0x70;
    ucComMF522Buf[6] = 0;
    for (i = 0; i < 4; i++)
    {
        ucComMF522Buf[i + 2] = *(pSnr + i);
        ucComMF522Buf[6] ^= *(pSnr + i);
    }
    CalulateCRC(ucComMF522Buf, 7, &ucComMF522Buf[7]);

    ClearBitMask(Status2Reg, 0x08);

    status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 9, ucComMF522Buf, &unLen);

    if ((status == MI_OK) && (unLen == 0x18))
    {
        status = MI_OK;
    }
    else
    {
        status = MI_ERR;
    }

    return status;
}

// ��    �ܣ���֤��Ƭ����
// ����˵��: auth_mode[IN]: ������֤ģʽ
//                  0x60 = ��֤A��Կ
//                  0x61 = ��֤B��Կ
//           addr[IN]�����ַ
//           pKey[IN]������
//           pSnr[IN]����Ƭ���кţ�4�ֽ�
// ��    ��: �ɹ�����MI_OK
char PcdAuthState(unsigned char auth_mode, unsigned char addr, unsigned char *pKey, unsigned char *pSnr)
{
    char status;
    unsigned int unLen;
    unsigned char i, ucComMF522Buf[MAXRLEN];

    ucComMF522Buf[0] = auth_mode;
    ucComMF522Buf[1] = addr;
    for (i = 0; i < 6; i++)
    {
        ucComMF522Buf[i + 2] = *(pKey + i);
    }
    for (i = 0; i < 6; i++)
    {
        ucComMF522Buf[i + 8] = *(pSnr + i);
    }
    //   memcpy(&ucComMF522Buf[2], pKey, 6);
    //   memcpy(&ucComMF522Buf[8], pSnr, 4);

    status = PcdComMF522(PCD_AUTHENT, ucComMF522Buf, 12, ucComMF522Buf, &unLen);
    if ((status != MI_OK) || (!(ReadRawRC(Status2Reg) & 0x08)))
    {
        status = MI_ERR;
    }

    return status;
}

// ��    �ܣ���ȡM1��һ������
// ����˵��: addr[IN]�����ַ
//           pData[OUT]�����������ݣ�16�ֽ�
// ��    ��: �ɹ�����MI_OK
char PcdRead(unsigned char addr, unsigned char *pData)
{
    char status;
    unsigned int unLen;
    unsigned char i, ucComMF522Buf[MAXRLEN];

    ucComMF522Buf[0] = PICC_READ;
    ucComMF522Buf[1] = addr;
    CalulateCRC(ucComMF522Buf, 2, &ucComMF522Buf[2]);

    status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, &unLen);
    if ((status == MI_OK) && (unLen == 0x90))
    //   {   memcpy(pData, ucComMF522Buf, 16);   }
    {
        for (i = 0; i < 16; i++)
        {
            *(pData + i) = ucComMF522Buf[i];
        }
    }
    else
    {
        status = MI_ERR;
    }

    return status;
}

// ��    �ܣ�д���ݵ�M1��һ��
// ����˵��: addr[IN]�����ַ
//           pData[IN]��д������ݣ�16�ֽ�
// ��    ��: �ɹ�����MI_OK
char PcdWrite(unsigned char addr, unsigned char *pData)
{
    char status;
    unsigned int unLen;
    unsigned char i, ucComMF522Buf[MAXRLEN];

    ucComMF522Buf[0] = PICC_WRITE;
    ucComMF522Buf[1] = addr;
    CalulateCRC(ucComMF522Buf, 2, &ucComMF522Buf[2]);

    status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, &unLen);

    if ((status != MI_OK) || (unLen != 4) || ((ucComMF522Buf[0] & 0x0F) != 0x0A))
    {
        status = MI_ERR;
    }

    if (status == MI_OK)
    {
        // memcpy(ucComMF522Buf, pData, 16);

        for (i = 0; i < 16; i++)
        {
            ucComMF522Buf[i] = *(pData + i);
        }
        CalulateCRC(ucComMF522Buf, 16, &ucComMF522Buf[16]);

        status = PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 18, ucComMF522Buf, &unLen);
        if ((status != MI_OK) || (unLen != 4) || ((ucComMF522Buf[0] & 0x0F) != 0x0A))
        {
            status = MI_ERR;
        }
    }

    return status;
}

// ��    �ܣ����Ƭ��������״̬
// ��    ��: �ɹ�����MI_OK
char PcdHalt(void)
{
    unsigned int unLen;
    unsigned char ucComMF522Buf[MAXRLEN];

    ucComMF522Buf[0] = PICC_HALT;
    ucComMF522Buf[1] = 0;
    CalulateCRC(ucComMF522Buf, 2, &ucComMF522Buf[2]);

    PcdComMF522(PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, &unLen);

    return MI_OK;
}

// ��MF522����CRC16����
void CalulateCRC(unsigned char *pIndata, unsigned char len, unsigned char *pOutData)
{
    unsigned char i, n;
    ClearBitMask(DivIrqReg, 0x04);
    WriteRawRC(CommandReg, PCD_IDLE);
    SetBitMask(FIFOLevelReg, 0x80);
    for (i = 0; i < len; i++)
    {
        WriteRawRC(FIFODataReg, *(pIndata + i));
    }
    WriteRawRC(CommandReg, PCD_CALCCRC);
    i = 0xFF;
    do
    {
        n = ReadRawRC(DivIrqReg);
        i--;
    } while ((i != 0) && !(n & 0x04));
    pOutData[0] = ReadRawRC(CRCResultRegL);
    pOutData[1] = ReadRawRC(CRCResultRegM);
}

// ��    �ܣ���λRC522
// ��    ��: �ɹ�����MI_OK
char PcdReset(void)
{
    RST_H;
    delay_10ms(1);
    RST_L;
    delay_10ms(1);
    RST_H;
    delay_10ms(10);

    if (ReadRawRC(0x02) == 0x80)
    {
    }

    WriteRawRC(CommandReg, PCD_RESETPHASE);

    WriteRawRC(ModeReg, 0x3D); // ��Mifare��ͨѶ��CRC��ʼֵ0x6363
    WriteRawRC(TReloadRegL, 30);
    WriteRawRC(TReloadRegH, 0);
    WriteRawRC(TModeReg, 0x8D);
    WriteRawRC(TPrescalerReg, 0x3E);
    WriteRawRC(TxAutoReg, 0x40);
    return MI_OK;
}

// ����RC632�Ĺ�����ʽ
char M500PcdConfigISOType(unsigned char type)
{
    if (type == 'A') // ISO14443_A
    {
        ClearBitMask(Status2Reg, 0x08);

        /*     WriteRawRC(CommandReg,0x20);    //as default
              WriteRawRC(ComIEnReg,0x80);     //as default
              WriteRawRC(DivlEnReg,0x0);      //as default
              WriteRawRC(ComIrqReg,0x04);     //as default
              WriteRawRC(DivIrqReg,0x0);      //as default
              WriteRawRC(Status2Reg,0x0);//80    //trun off temperature sensor
              WriteRawRC(WaterLevelReg,0x08); //as default
              WriteRawRC(ControlReg,0x20);    //as default
              WriteRawRC(CollReg,0x80);    //as default
       */
        WriteRawRC(ModeReg, 0x3D); // 3F
        /*	   WriteRawRC(TxModeReg,0x0);      //as default???
               WriteRawRC(RxModeReg,0x0);      //as default???
               WriteRawRC(TxControlReg,0x80);  //as default???
               WriteRawRC(TxSelReg,0x10);      //as default???
           */
        WriteRawRC(RxSelReg, 0x86); // 84
        //      WriteRawRC(RxThresholdReg,0x84);//as default
        //      WriteRawRC(DemodReg,0x4D);      //as default

        //      WriteRawRC(ModWidthReg,0x13);//26
        WriteRawRC(RFCfgReg, 0x7F); // 4F
        /*   WriteRawRC(GsNReg,0x88);        //as default???
           WriteRawRC(CWGsCfgReg,0x20);    //as default???
           WriteRawRC(ModGsCfgReg,0x20);   //as default???
    */
        WriteRawRC(TReloadRegL, 30); // tmoLength);// TReloadVal = 'h6a =tmoLength(dec)
        WriteRawRC(TReloadRegH, 0);
        WriteRawRC(TModeReg, 0x8D);
        WriteRawRC(TPrescalerReg, 0x3E);

        //     PcdSetTmo(106);
        delay_10ms(1);
        PcdAntennaOn();
    }
    else
    {
        return (char)-1;
    }

    return MI_OK;
}

// ��    �ܣ���RC632�Ĵ���
// ����˵����Address[IN]:�Ĵ�����ַ
// ��    �أ�������ֵ
unsigned char ReadRawRC(unsigned char Address)
{
    unsigned char i, ucAddr;
    unsigned char ucResult = 0;

    NSS_L;
    ucAddr = ((Address << 1) & 0x7E) | 0x80;

    for (i = 8; i > 0; i--)
    {
        SCK_L;
        if (ucAddr & 0x80)
        {
            MOSI_H;
        }
        else
        {
            MOSI_L;
        }
        SCK_H;
        ucAddr <<= 1;
    }

    for (i = 8; i > 0; i--)
    {
        SCK_L;
        ucResult <<= 1;
        SCK_H;
        if (HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_14) == GPIO_PIN_SET)  // MISO = PB14 (D12)

            ucResult |= 1;
    }

    NSS_H;
    SCK_H;
    return ucResult;
}

// ��    �ܣ�дRC632�Ĵ���
// ����˵����Address[IN]:�Ĵ�����ַ
//           value[IN]:д���ֵ
void WriteRawRC(unsigned char Address, unsigned char value)
{
    unsigned char i, ucAddr;

    SCK_L;
    NSS_L;
    ucAddr = ((Address << 1) & 0x7E);

    for (i = 8; i > 0; i--)
    {
        if (ucAddr & 0x80)
        {
            MOSI_H;
        }
        else
            MOSI_L;
        SCK_H;
        ucAddr <<= 1;
        SCK_L;
    }

    for (i = 8; i > 0; i--)
    {
        if (value & 0x80)
        {
            MOSI_H;
        }
        else
        {
            MOSI_L;
        }
        SCK_H;
        value <<= 1;
        SCK_L;
    }
    NSS_H;
    SCK_H;
}

// ��    �ܣ���RC522�Ĵ���λ
// ����˵����reg[IN]:�Ĵ�����ַ
//           mask[IN]:��λֵ
void SetBitMask(unsigned char reg, unsigned char mask)
{
    char tmp = 0x0;
    tmp = ReadRawRC(reg);
    WriteRawRC(reg, tmp | mask); // set bit mask
}

// ��    �ܣ���RC522�Ĵ���λ
// ����˵����reg[IN]:�Ĵ�����ַ
//           mask[IN]:��λֵ
void ClearBitMask(unsigned char reg, unsigned char mask)
{
    char tmp = 0x0;
    tmp = ReadRawRC(reg);
    WriteRawRC(reg, tmp & ~mask); // clear bit mask
}

// ��    �ܣ�ͨ��RC522��ISO14443��ͨѶ
// ����˵����Command[IN]:RC522������
//           pInData[IN]:ͨ��RC522���͵���Ƭ������
//           InLenByte[IN]:�������ݵ��ֽڳ���
//           pOutData[OUT]:���յ��Ŀ�Ƭ��������
//           *pOutLenBit[OUT]:�������ݵ�λ����
char PcdComMF522(unsigned char Command,
                 unsigned char *pInData,
                 unsigned char InLenByte,
                 unsigned char *pOutData,
                 unsigned int *pOutLenBit)
{
    char status = MI_ERR;
    unsigned char irqEn = 0x00;
    unsigned char waitFor = 0x00;
    unsigned char lastBits;
    unsigned char n;
    unsigned int i;
    switch (Command)
    {
    case PCD_AUTHENT:
        irqEn = 0x12;
        waitFor = 0x10;
        break;
    case PCD_TRANSCEIVE:
        irqEn = 0x77;
        waitFor = 0x30;
        break;
    default:
        break;
    }

    WriteRawRC(ComIEnReg, irqEn | 0x80);
    ClearBitMask(ComIrqReg, 0x80);
    WriteRawRC(CommandReg, PCD_IDLE);
    SetBitMask(FIFOLevelReg, 0x80);

    for (i = 0; i < InLenByte; i++)
    {
        WriteRawRC(FIFODataReg, pInData[i]);
    }
    WriteRawRC(CommandReg, Command);

    if (Command == PCD_TRANSCEIVE)
    {
        SetBitMask(BitFramingReg, 0x80);
    }

    //    i = 600;//����ʱ��Ƶ�ʵ���������M1�����ȴ�ʱ��25ms
    i = 2000;
    do
    {
        n = ReadRawRC(ComIrqReg);
        i--;
    } while ((i != 0) && !(n & 0x01) && !(n & waitFor));
    ClearBitMask(BitFramingReg, 0x80);

    if (i != 0)
    {
        if (!(ReadRawRC(ErrorReg) & 0x1B))
        {
            status = MI_OK;
            if (n & irqEn & 0x01)
            {
                status = MI_NOTAGERR;
            }
            if (Command == PCD_TRANSCEIVE)
            {
                n = ReadRawRC(FIFOLevelReg);
                lastBits = ReadRawRC(ControlReg) & 0x07;
                if (lastBits)
                {
                    *pOutLenBit = (n - 1) * 8 + lastBits;
                }
                else
                {
                    *pOutLenBit = n * 8;
                }
                if (n == 0)
                {
                    n = 1;
                }
                if (n > MAXRLEN)
                {
                    n = MAXRLEN;
                }
                for (i = 0; i < n; i++)
                {
                    pOutData[i] = ReadRawRC(FIFODataReg);
                }
            }
        }
        else
        {
            status = MI_ERR;
        }
    }

    SetBitMask(ControlReg, 0x80); // stop timer now
    WriteRawRC(CommandReg, PCD_IDLE);
    return status;
}

// ��������
// ÿ��������ر����շ���֮��Ӧ������1ms�ļ��
void PcdAntennaOn()
{
    unsigned char i;
    i = ReadRawRC(TxControlReg);
    if (!(i & 0x03))
    {
        SetBitMask(TxControlReg, 0x03);
    }
}

// �ر�����
void PcdAntennaOff()
{
    ClearBitMask(TxControlReg, 0x03);
}

// �ȴ����뿪
void WaitCardOff(void)
{
    char status;
    unsigned char TagType[2];

    while (1)
    {
        status = PcdRequest(REQ_ALL, TagType);
        if (status)
        {
            status = PcdRequest(REQ_ALL, TagType);
            if (status)
            {
                status = PcdRequest(REQ_ALL, TagType);
                if (status)
                {
                    return;
                }
            }
        }
        delay_10ms(10);
    }
}

// Delay 10ms
void delay_10ms(unsigned int _10ms)
{
    unsigned int i, j;

    for (i = 0; i < _10ms; i++)
    {
        for (j = 0; j < 60000; j++)
            ;
    }
}

///////////////////////����ΪRC522��������/////////////////////////
///////////////////////����ΪRC522��������/////////////////////////
///////////////////////����ΪRC522��������/////////////////////////

// RFIDģ���ʼ��
void RFID_Init(void)
{
    PcdInit();       // RC522�˿ڶ���
    PcdReset();      // ��λRC522
    PcdAntennaOff(); // ������
    PcdAntennaOn();  // ������
    M500PcdConfigISOType('A');
}

// ��ȡ����ź��������ؿ����1-3����ϵͳ¼�뿨����0��û��ʶ�𵽿�����5��6
uint8_t Rc522Test(void)
{
    uint8_t cardno;
    if (PcdRequest(REQ_ALL, Temp) == MI_OK)
    {
        if (PcdAnticoll(UID) == MI_OK)
        {
            cardno = 0;
            if (UID[0] == UI0[0] && UID[1] == UI0[1] && UID[2] == UI0[2] && UID[3] == UI0[3])
            {
                cardno = 1;
            }
            else if (UID[0] == UI1[0] && UID[1] == UI1[1] && UID[2] == UI1[2] && UID[3] == UI1[3])
            {
                cardno = 2;
            }
            else if (UID[0] == UI2[0] && UID[1] == UI2[1] && UID[2] == UI2[2] && UID[3] == UI2[3])
            {
                cardno = 3;
            }
            else if (UID[0] == UI3[0] && UID[1] == UI3[1] && UID[2] == UI3[2] && UID[3] == UI3[3])
            {
                cardno = 4;
            }
            else
                cardno = 0;
        }
        else
            cardno = 5;
    }
    else
        cardno = 6;
    return cardno;
}
