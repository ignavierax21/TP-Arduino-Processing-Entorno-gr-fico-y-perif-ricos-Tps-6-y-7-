Interfaz gráfica con Processing

-Descripción

Este programa desarrolla una interfaz gráfica en Processing para visualizar y controlar las entradas/salidas de una placa Arduino UNO.

La interfaz permite mostrar el estado de dos pulsadores físicos y controlar dos LEDs.

-Interfaz gráfica

La ventana se divide en dos sectores:

- Entradas: muestra el estado de los pulsadores mediante indicadores de colores.
- Salidas: muestra el estado de los LEDs y permite controlarlos haciendo clic con el mouse.

-Funcionamiento

- Los pulsadores físicos actualizan los indicadores de entrada en Processing.
- Los indicadores muestran los estados HIGH y LOW mediante colores.
- Al hacer clic sobre los indicadores de salida, se envían órdenes a Arduino para encender o apagar los LEDs.
- Los estados de las salidas se actualizan según la información recibida desde Arduino.

Comunicación serie

La comunicación entre Arduino y Processing se realiza a 9600 baudios.

Hay que verificar que no tengamos abierto el Monitor Serie del Arduino IDE mientras Processing utiliza el mismo puerto.

Processing recibe cuatro valores separados por comas y envía comandos para controlar los LEDs:

- `A`: encender LED 1.
- `a`: apagar LED 1.
- `B`: encender LED 2.
- `b`: apagar LED 2.

-Requisitos

- Processing 4.
- Biblioteca Serial de Processing.
- Placa Arduino UNO.
- Cable USB.
- Código Arduino cargado previamente en la placa.

-Ejecución

1. Conectar Arduino UNO a la computadora.
2. Verificar que el programa Arduino esté cargado.
3. Abrir el proyecto en Processing.
4. Verificar que el puerto serie configurado coincida con el utilizado por Arduino.
5. Ejecutar el programa.
