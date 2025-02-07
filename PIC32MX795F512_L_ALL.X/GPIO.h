//=============================================
#define _SET_PIN_     (0x01)
#define _CLEAR_PIN_   (0x00)

#define _SET_PORT_    (0xFFFFFFFF)
#define _CLEAR_PORT_  (0x00000000)

// Macro to configure pin direction 
#define CONFIGURE_PIN_AS_OUTPUT(PIN) (PIN = OUTPUT) 
#define CONFIGURE_PIN_AS_INPUT(PIN) (PIN = INPUT) 
#define CONFIGURE_PIN(PIN, DIRECTION) ((DIRECTION) == OUTPUT ? (PIN = 0) : (PIN = 1))
// Macro to set or clear a pin 
#define SET_PIN(PIN) (PIN = _SET_PIN_)
#define CLEAR_PIN(PIN) (PIN = _CLEAR_PIN_)
#define TOGGLE_PIN(PIN) (PIN = !PIN)

// Macro to set or clear a PORT 
#define SET_PORT(PORT) (PORT = _SET_PORT_)
#define CLEAR_PORT(PORT) (PIN = _CLEAR_PORT_)
#define TOGGLE_PORT(PORT) (PORT = !PORT)


// Macro to set or clear a register 
#define SET_REGISTER(REGISTER) (REGISTER = 1)
#define CLEAR_REGISTER(REGISTER) (REGISTER = 0)
#define TOGGLE_REGISTER(REGISTER) (REGISTER = !REGISTER)
// Enumeration for pin direction 
typedef enum { 
    INPUT = 1, 
    OUTPUT = 0 
} PIN_DIRECTION; 
