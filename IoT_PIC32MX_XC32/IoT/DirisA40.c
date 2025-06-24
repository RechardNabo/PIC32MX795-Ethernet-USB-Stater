#include "TCPIP.h"

extern UINT8 Request;

void A40Volt (UINT8 SlaveID)
{
    MODBUSRequest(SlaveID,0x03,0x0308,0x0006,0x00);
    Request=1;
}
void A40All (UINT8 SlaveID)
{
    MODBUSRequest(SlaveID,0x03,0x0FAC,0x0021,0x00);
    Request=1;
}
void A40Frequency (UINT8 SlaveID)
{
    MODBUSRequest(SlaveID,0x03,0xC55E,0x0002,0x00);
    Request=1;
}
