## 3/3/23
Parts are shipping, due to arrive Monday/Tuesday next week. We ordered a Gikfun R385 pump kit including:

* DC Diaphragm Pump
* 12 V, 1 A Adaptor
* 1 m Water Tube
* 2x Silica Gel Fixed Ring Mounts
* 2x 5 V Relay
* 5x Songhe Capactive Moisture Sensors
We created a plan for assembly and picked up Poron foam for prototyping.

## 3/10/23
The parts arrived, and we are working to create test implementations of them on the STM32L4. The included DC power supply for the pump might be too powerful for our needs. A finalized deliverables list was created for our project goals:

* Automatic control of watering and drying cycles
* Wireless updates about system status and plant health

## 3/17/23
We have basic functionality on all of the peripherals except for Bluetooth. We can use the input from the capacitive moisture sensor to control the relay which controls the pump. Remaining tasks:

1. Bluetooth interface
2. More sophisticated control loop
