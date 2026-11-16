
Este programa controla dos LEDs mediante dos pulsadores físicos y permite recibir órdenes desde una computadora utilizando comunicación serie.

La placa Arduino UNO se comunica con Processing a través del puerto serie, utilizando una velocidad de transmisión de 9600 baudios.

-Conexiones

| Componente | Pin Arduino |
|---|---|
| Pulsador 1 | D7 |
| Pulsador 2 | D8 |
| LED 1 | D12 |
| LED 2 | D13 |
| Tierra común | GND |

Los pulsadores utilizan la configuración `INPUT_PULLUP`, por lo que se conectan entre sus respectivos pines digitales y GND. 
Decidí usar esa configuración para evitar usar mas resistencias físicas para los botones.

Cada LED se conecta mediante una resistencia de 1 kΩ.

- Funcionamiento

El programa hace las siguientes tareas:

- Lee el estado de los dos pulsadores.
- Enciende el LED correspondiente cuando se presiona un pulsador.
- Recibe comandos enviados desde Processing.
- Enciende o apaga los LEDs según los comandos recibidos.
- Envía periódicamente a Processing los estados de las dos entradas y las dos salidas.

-Comunicación serie

Los comandos recibidos desde Processing son:

| Comando | Acción |
|---|---|
| A | Encender LED 1 |
| a | Apagar LED 1 |
| B | Encender LED 2 |
| b | Apagar LED 2 |

Arduino envía cuatro valores separados por comas:

`Pulsador1,Pulsador2,LED1,LED2`

La comunicación trabaja a 9600 baudios.

-Requisitos

- Placa Arduino UNO.
- Arduino IDE.
- Conexión USB entre Arduino y la computadora.
